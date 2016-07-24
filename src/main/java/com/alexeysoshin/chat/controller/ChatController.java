package com.alexeysoshin.chat.controller;

import com.alexeysoshin.chat.model.Message;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class ChatController {

    @MessageMapping("/message")
    @SendTo("/topic/messages")
    /**
     * Messages will be published to /topic/messages
     */
    public Message publishMessage(Message message) throws Exception {
        if (isValid(message)) {
            return message;
        }
        return null;
    }

    private boolean isValid(Message message) {
        return message.text.length() > 0 && message.from.length() > 0;
    }

}