package com.fun.project.app.business.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fun.common.constant.Constants;
import com.fun.common.exception.RedisConnectException;
import com.fun.common.utils.DateUtils;
import com.fun.common.utils.StringUtils;
import com.fun.common.utils.TimestampUtil;
import com.fun.framework.redis.IRedisService;
import com.fun.project.app.business.entity.Message;
import com.fun.project.app.business.service.IChatService;
import com.fun.project.app.user.entity.AppUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.*;

import static com.fun.common.constant.Constants.*;

/**
 * @author DJun
 * @date 2019/12/9
 */
@Service
public class ChatServiceImpl implements IChatService {
    private Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    private IRedisService redisService;

    @Override
    public AppUser findUserById(String key) {
        try {
            String value = null;
            if (key.startsWith(Constants.USER_PREFIX)) {
                value = redisService.get(key);
            } else {
                value = redisService.get(Constants.USER_PREFIX + key);
            }
            if (StringUtils.isEmpty(value)) {
                return null;
            }
            JSONObject object = (JSONObject) JSONObject.parseObject(value).get("user");
            return object.toJavaObject(AppUser.class);
        } catch (RedisConnectException e) {
            log.error(REDIS_CONN_FAIL, DateUtils.dateTime());
            return null;
        }
    }

    @Override
    public void sendMessage(String fromId, String toId, Message message) {
        Message msg = new Message();
        msg.setCreateTime(TimestampUtil.getCurrentTimestamp13());
        msg.setFromUserId(fromId);
        msg.setToUserId(toId);
        msg.setMessage(message.getMessage());
        push(msg, CHAT_FROM_PREFIX + fromId + CHAT_TO_PREFIX + toId);

    }

    /**
     * 创建聊天窗口
     *
     * @param msg Message
     * @param key 房间号
     */
    private void push(Message msg, String key) {
        List<Message> list = new ArrayList<>();
        try {
            String value = redisService.get(key);
            // 是否已存在当前聊天窗口
            if (StringUtils.isEmpty(value)) {
                list.add(msg);
            } else {
                // 获取聊天记录
                list = Objects.requireNonNull(JSONObject.parseArray(value)).toJavaList(Message.class);
                list.add(msg);
            }
            redisService.set(key, JSONObject.toJSONString(list));
        } catch (RedisConnectException e) {
            log.error(REDIS_CONN_FAIL, DateUtils.dateTime());
        }
    }

    @Override
    public List<AppUser> onlineList() {
        List<AppUser> list = new ArrayList<>();
        try {
            Set<String> keys = redisService.getKeys(USER_PREFIX + MATCH_ALL);
            if (keys != null && keys.size() > 0) {
                keys.forEach(key -> {
                    list.add(this.findUserById(key));
                });
            }
        } catch (RedisConnectException e) {
            log.error(REDIS_CONN_FAIL, DateUtils.dateTime());
            return null;
        }
        return list;
    }

    @Override
    public List<Message> chatWindow(String fromId, String toId) {
        List<Message> list = new ArrayList<>();

        //A -> B
        String fromTo = null;
        //B -> A
        String toFrom = null;
        try {
            fromTo = redisService.get(Constants.CHAT_FROM_PREFIX + fromId + Constants.CHAT_TO_PREFIX + toId);
            toFrom = redisService.get(Constants.CHAT_FROM_PREFIX + toId + Constants.CHAT_TO_PREFIX + fromId);
        } catch (RedisConnectException e) {
            e.printStackTrace();
        }
        JSONArray fromToObject = JSONObject.parseArray(fromTo);
        JSONArray toFromObject = JSONObject.parseArray(toFrom);
        if (fromToObject != null) {
            list.addAll(fromToObject.toJavaList(Message.class));
        }
        if (toFromObject != null) {
            list.addAll(toFromObject.toJavaList(Message.class));
        }
        if (list.size() > 0) {
            sort(list);
            return list;
        } else {
            return new ArrayList<>();
        }
    }

    private static void sort(List<Message> list) {
        list.sort(Comparator.comparing(Message::getCreateTime));
    }
}
