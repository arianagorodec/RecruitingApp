package com.recruit.entity;

import com.recruit.entity.enums.MessageStatus;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name="chat_message")
public class ChatMessage {
    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    @Column(name = "id", length = 11, nullable = false)
    private long id;

    @Column(name = "message")
    private String message;
    @Transient
    private String from;
    @Transient
    private String to;
    @Column(name = "time")
    private String time;

    @ManyToOne(fetch = FetchType.LAZY) //orphanRemoval=true
    @JoinColumn(name = "user_from")
    private User userFrom;

    @ManyToOne(fetch = FetchType.LAZY) //orphanRemoval=true
    @JoinColumn(name = "user_to")
    private User userTo;

    public ChatMessage() {
    }

    public ChatMessage(ChatMessage chatMessage) {
        this.id=chatMessage.getId();
        this.time = chatMessage.getTime();
        this.to = chatMessage.getTo();
        this.from = chatMessage.getFrom();
        this.userTo = chatMessage.getUserTo();
        this.userFrom = chatMessage.getUserFrom();
        this.message= chatMessage.getMessage();
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public User getUserFrom() {
        return userFrom;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public void setUserFrom(User userFrom) {
        this.userFrom = userFrom;
    }

    public User getUserTo() {
        return userTo;
    }

    public void setUserTo(User userTo) {
        this.userTo = userTo;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

}
