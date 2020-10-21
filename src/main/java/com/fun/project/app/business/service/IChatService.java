package com.fun.project.app.business.service;

import com.fun.project.app.business.entity.Message;
import com.fun.project.app.user.entity.AppUser;

import java.util.List;

/**
 * @author DJun
 * @date 2019/11/27
 */
public interface IChatService {

    /**
     * 通过 userId 获取缓存中的用户信息
     *
     * @param key userId / Constants.USER_PREFIX + userId
     * @return AppUser
     */
    AppUser findUserById(String key);

    /**
     * 发送消息，并存入缓存
     *
     * @param fromId  推送方ID
     * @param toId    接收方ID
     * @param message 消息
     */
    void sendMessage(String fromId, String toId, Message message);

    /**
     * 获取在线用户信息
     *
     * @return List<AppUser>
     */
    List<AppUser> onlineList();

    /**
     * 获取指定窗口消息
     *
     * @param fromId 推送方ID
     * @param toId   接收方ID
     * @return List<Message>
     */
    List<Message> chatWindow(String fromId, String toId);
}
