package com.recruit.controller;

import com.recruit.entity.ChatMessage;
import com.recruit.service.impl.ChatMessageServiceImpl;
import com.recruit.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;

@Controller
public class ChatController {
    @Autowired
    UserServiceImpl userService;
    @Autowired
    ChatMessageServiceImpl chatMessageService;

    @MessageMapping("/message-{id}.sendMessage")
    @SendTo("/messages/public.{id}")
    public ChatMessage sendMessage(@Payload ChatMessage chatMessage,@DestinationVariable String id) {
        if(chatMessage.getMessage()!=null) {
            ChatMessage newChatMessage = new ChatMessage(chatMessage);
            newChatMessage.setUserTo(userService.getByUsername(chatMessage.getTo()));
            newChatMessage.setUserFrom(userService.getByUsername(chatMessage.getFrom()));
            chatMessageService.addChatMessage(newChatMessage);
        }
            return chatMessage;
    }
    @MessageMapping("/message-{id}.addUser")
    @SendTo("/messages/public.{id}")
    public ChatMessage addUser(@Payload ChatMessage chatMessage,
                               SimpMessageHeaderAccessor headerAccessor,
                               @DestinationVariable String id ){
        // Add username in web socket session
//        System.out.println(chatMessage.getFrom());
            headerAccessor.getSessionAttributes().put("username", chatMessage.getFrom());

            return chatMessage;
    }
}
