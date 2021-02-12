package com.recruit.config;

import com.recruit.entity.Candidate;
import com.recruit.service.impl.CandidateServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.*;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

import java.util.List;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
    @Autowired
    private CandidateServiceImpl candidateService;

//    @Override
//    public void registerStompEndpoints(StompEndpointRegistry registry) {
//        List<Candidate> candidates = candidateService.getAll();
//        registry.addEndpoint("/message-" + 1);
//        registry.addEndpoint("/message-" + 1).withSockJS();
//        if(candidates.size()!=0) {
//            for (Candidate candidate : candidates) {
//                registry.addEndpoint("/message-" + candidate.getSessionCode());
//                registry.addEndpoint("/message-" + candidate.getSessionCode()).withSockJS();
//            }
//        }
//    }

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry
                .addEndpoint("/message")
                .setAllowedOrigins("*")
                .withSockJS();
    }

    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        registry.setApplicationDestinationPrefixes("/app");
        registry.enableSimpleBroker("/messages");
        registry.setUserDestinationPrefix("/messages");
    }

}