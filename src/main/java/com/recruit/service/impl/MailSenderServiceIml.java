package com.recruit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailSenderServiceIml {
    @Autowired
    private JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String username;

    public void sendActivationPage(String emailTo, String message){
        SimpleMailMessage mailMessage = new SimpleMailMessage();

        String password = "";

        mailMessage.setFrom(username);
        mailMessage.setTo(emailTo);
        mailMessage.setSubject("Восстановление пароля");
        mailMessage.setText(message);

        mailSender.send(mailMessage);

    }
}
