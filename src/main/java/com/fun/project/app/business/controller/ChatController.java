package com.fun.project.app.business.controller;

import com.fun.common.constant.Constants;
import com.fun.common.result.CommonResult;
import com.fun.common.utils.StringUtils;
import com.fun.framework.config.WebsocketServerEndpoint;
import com.fun.project.app.business.entity.Message;
import com.fun.project.app.business.service.IChatService;
import com.fun.project.app.user.entity.AppUser;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author DJun
 * @date 2019/12/18
 */
@Api(tags = "聊天接口")
@RestController
@RequestMapping("/chat")
public class ChatController {

    @Autowired
    private IChatService chatService;

    @ApiOperation("获取userId的用户信息")
    @GetMapping("/{userId}")
    public CommonResult info(@PathVariable("userId") String id) {
        return CommonResult.success(chatService.findUserById(id));
    }

    @ApiOperation("当前用户发送消息给另一位用户")
    @PostMapping("{userId}/to/{toId}")
    public CommonResult push(@PathVariable("userId") String userId, @PathVariable("toId") String toId, Message message) {
        WebsocketServerEndpoint endpoint = new WebsocketServerEndpoint();
        endpoint.sendTo(userId,toId, message);
        return CommonResult.success(Constants.SUCCESS);
    }

    @GetMapping("/online")
    public CommonResult onlineList() {
        List<AppUser> userList = chatService.onlineList();
        if (StringUtils.isNull(userList)) {
            return CommonResult.failed("当前没有用户在线");
        }
        return CommonResult.success(userList);
    }

    /**
     * 获取指定窗口消息
     *
     * @param fromId 当前用户
     * @param toId   对方用户Id
     */
    @GetMapping("/self/{fromId}/{toId}")
    public CommonResult chatWindow(@PathVariable("fromId") String fromId, @PathVariable("toId") String toId) {
        List<Message> list = chatService.chatWindow(fromId, toId);
        return CommonResult.success(list);
    }


}
