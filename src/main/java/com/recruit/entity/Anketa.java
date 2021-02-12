package com.recruit.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name="anketa")
public class Anketa {
    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    @Column(name = "id", length = 11, nullable = false)
    private long id;


    @Column(name = "question1")
    private String question1;
    @Column(name = "question2")
    private String question2;
    @Column(name = "question3")
    private String question3;
    @Column(name = "question4")
    private String question4;
    @Column(name = "question5")
    private String question5;

    @Column(name = "question6")
    private String question6DB;
    @Transient
    private String[] question6;

    @Column(name = "question7")
    private String question7DB;
    @Transient
    private String[] question7;

    @Column(name = "question8")
    private String question8DB;
    @Transient
    private String[] question8;

    @Column(name = "resume")
    private String resume;
    @Column(name = "review")
    private String review;

    @OneToOne(optional = false)
    @JoinColumn(name="id_candidate", unique = true)
    private Candidate candidate;

    public Anketa() {
    }



    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getQuestion1() {
        return question1;
    }

    public void setQuestion1(String question1) {
        this.question1 = question1;
    }

    public String getQuestion2() {
        return question2;
    }

    public void setQuestion2(String question2) {
        this.question2 = question2;
    }

    public String getQuestion3() {
        return question3;
    }

    public void setQuestion3(String question3) {
        this.question3 = question3;
    }

    public String getQuestion4() {
        return question4;
    }

    public void setQuestion4(String question4) {
        this.question4 = question4;
    }

    public String getQuestion5() {
        return question5;
    }

    public void setQuestion5(String question5) {
        this.question5 = question5;
    }

    public String[] getQuestion6() {
        return question6;
    }

    public void setQuestion6(String[] question6) {
        this.question6 = question6;
    }

    public String[] getQuestion7() {
        return question7;
    }

    public void setQuestion7(String[] question7) {
        this.question7 = question7;
    }

    public String[] getQuestion8() {
        return question8;
    }

    public void setQuestion8(String[] question8) {
        this.question8 = question8;
    }

    public String getQuestion6DB() {
        return question6DB;
    }

    public void setQuestion6DB(String question6DB) {
        this.question6DB = question6DB;
    }

    public String getQuestion7DB() {
        return question7DB;
    }

    public void setQuestion7DB(String question7DB) {
        this.question7DB = question7DB;
    }

    public String getQuestion8DB() {
        return question8DB;
    }

    public void setQuestion8DB(String question8DB) {
        this.question8DB = question8DB;
    }

    public String getResume() {
        return resume;
    }

    public void setResume(String resume) {
        this.resume = resume;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public Candidate getCandidate() {
        return candidate;
    }

    public void setCandidate(Candidate candidate) {
        this.candidate = candidate;
    }

    public void setAnketa(Anketa anketa) {
        this.setQuestion1(anketa.getQuestion1());
        this.setQuestion2(anketa.getQuestion2());
        this.setQuestion3(anketa.getQuestion3());
        this.setQuestion4(anketa.getQuestion4());
        this.setQuestion5(anketa.getQuestion5());
        this.setQuestion6(anketa.getQuestion6());
        this.setQuestion7(anketa.getQuestion7());
        this.setQuestion8(anketa.getQuestion8());
        this.setResume(anketa.getResume());
        this.setReview(anketa.getReview());
        this.setCandidate(anketa.getCandidate());
    }
}
