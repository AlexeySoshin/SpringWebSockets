package com.alexeysoshin.chat.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.session.ExpiringSession;
import org.springframework.session.MapSessionRepository;
import org.springframework.session.web.socket.config.annotation.AbstractSessionWebSocketMessageBrokerConfigurer;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;

import java.util.logging.Logger;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketExpiringConfig extends AbstractSessionWebSocketMessageBrokerConfigurer<ExpiringSession> {

    Logger logger = Logger.getAnonymousLogger();

    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
        config.enableSimpleBroker("/topic");
        config.setApplicationDestinationPrefixes("/chat");
    }

    @Override
    protected void configureStompEndpoints(StompEndpointRegistry stompEndpointRegistry) {
        stompEndpointRegistry.addEndpoint("/message").withSockJS();
        logger.info("Endpoints registered");
    }

    @Component
    public class LocalMapSessionRepository extends MapSessionRepository {

        private static final int MAX_INACTIVE_INTERVAL = 10;

        public LocalMapSessionRepository() {
            super.setDefaultMaxInactiveInterval(MAX_INACTIVE_INTERVAL);
        }
    }
}
