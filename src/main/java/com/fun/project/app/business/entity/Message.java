package com.fun.project.app.business.entity;

import com.fun.project.app.user.entity.AppUser;
import lombok.Data;

import java.io.Serializable;

/**
 * @author DJun
 * @date 2019/12/24
 */
@Data
public class Message implements Serializable {

    /** 接收者 */
    private String toUserId;

    /** 发送者 */
    private String fromUserId;

    /** 消息内容 */
    private String message;

    /** 发送时间 */
    private Long createTime;

    private AppUser fromUserInfo;

    private AppUser toUserInfo;
}
