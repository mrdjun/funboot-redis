package com.fun.framework.config;

import com.alibaba.fastjson.JSONObject;
import com.fun.common.result.CommonResult;
import com.fun.common.utils.TimestampUtil;
import com.fun.project.app.business.entity.Message;
import com.fun.project.app.business.service.IChatService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;

/**
 * ServerEndpoint 注解是一个类层次的注解，它的功能主要是将目前的类定义成一个websocket服务器端,
 * 注解的值将被用于监听用户连接的终端访问URL地址,客户端可以通过这个URL来连接到WebSocket服务器端
 * ServerEndpoint 可以把当前类变成websocket服务类
 *
 * userId 为当前连接 socket 的用户
 *
 * @author DJun
 * @date 2019/12/23
 */
@ServerEndpoint("/chat/{userId}")
@Component
@Slf4j
public class WebsocketServerEndpoint {

    private static IChatService chatService;

    @Autowired
    public void setChatSessionService(IChatService chatService) {
        WebsocketServerEndpoint.chatService = chatService;
    }

    /**
     * 静态变量，用来记录当前在线连接数
     */
    private static int onlineCount = 0;

    /**
     * concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户id
     */
    private static ConcurrentHashMap<String, WebsocketServerEndpoint> webSocketSet = new ConcurrentHashMap<>();

    /**
     * 与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    private Session session;

    /**
     * 当前发消息的人
     */
    private String userId = "";

    /**
     * 统计在线人数
     */
    private static synchronized int getOnlineCount() {
        return onlineCount;
    }

    private static synchronized void addOnlineCount() {
        WebsocketServerEndpoint.onlineCount++;
    }

    private static synchronized void subOnlineCount() {
        WebsocketServerEndpoint.onlineCount--;
    }

    /**
     * 连接建立成功调用的方法
     *
     * @param userId  用户唯一
     * @param session 可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    @OnOpen
    public void onOpen(@PathParam(value = "userId") String userId, Session session) {
        this.userId = userId;
        this.session = session;
        // 加入线程安全map中
        webSocketSet.put(userId, this);
        // 在线数加1
        addOnlineCount();
        log.info("用户id：" + userId + "加入连接！当前在线人数为" + getOnlineCount());
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose() {
        if (!StringUtils.isEmpty(userId)) {
            // 根据用户id从map中删除
            webSocketSet.remove(userId);
            // 在线数减1
            subOnlineCount();
            log.info("用户id：" + userId + "关闭连接！当前在线人数为" + getOnlineCount());
        }
    }

    /**
     * 收到客户端消息
     *
     * @param message 客户端发送过来的消息
     * @param session 可选的参数
     */
    @OnMessage
    public void onMessage(String message, Session session) {
        log.info("来自客户端的消息:" + message);
        // 消息接收者
//        String toUserId = message.split(",")[1];
//        String sendMessage = message.split(",")[0];
//        sendToUser(toUserId, sendMessage);

    }

    /**
     * 当前用户给另外一位用户发送消息
     *
     * @param toUserId 接收者
     * @param msg      msg
     */
    public void sendTo(String userId,String toUserId, Message msg) {
        // 避免前端刷新页面后，websocket 对象丢失
        this.userId = userId;
        try {
            if (webSocketSet.get(toUserId) != null) {
                webSocketSet.get(toUserId).sendMessage(getRespData(toUserId, msg.getMessage()));
                chatService.sendMessage(userId,toUserId, msg);
            } else {
                if (webSocketSet.get(toUserId) != null) {
                    webSocketSet.get(toUserId).sendMessage(CommonResult.failed("接收端已离线").toString());
                }
                log.info("接收端:" + toUserId + "已经离线！");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 管理员发送消息
     *
     * @param message msg
     */
    public void systemSendToUser(String toUserId, String message) {

        try {
            if (webSocketSet.get(toUserId) != null) {
                webSocketSet.get(toUserId).sendMessage("系统给我发来消息，消息内容为--->>" + message);
            } else {
                log.info("接收端:" + toUserId + "离线");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    /**
     * 发生错误时调用
     *
     * @param session session
     * @param error   e
     */
    @OnError
    public void onError(Session session, Throwable error) {
        log.info("发生错误");
        error.printStackTrace();
    }

    /**
     * 发送消息
     *
     * @param message msg
     * @throws IOException e
     */
    public void sendMessage(String message) throws IOException {
        //同步发送
        this.session.getBasicRemote().sendText(message);
        //异步发送
        //this.session.getAsyncRemote().sendText(message);
    }

    private String getRespData(String toUserId, String message) {
        Message respData = new Message();
        respData.setMessage(message);
        respData.setCreateTime(TimestampUtil.getCurrentTimestamp13());
        respData.setFromUserInfo(chatService.findUserById(this.userId));
        respData.setToUserInfo(chatService.findUserById(toUserId));
        return JSONObject.toJSONString(CommonResult.success(respData));
    }
}
