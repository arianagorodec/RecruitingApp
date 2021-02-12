package com.recruit.entity;

import java.util.List;

public class Question {
    String text_q;
    List<Answer> answers;

    public String getText_q() {
        return text_q;
    }

    public void setText_q(String text_q) {
        this.text_q = text_q;
    }

    public List<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(List<Answer> answers) {
        this.answers = answers;
    }
}
