package com.recruit.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="test")
public class Test {
    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    @Column(name = "id_test", length = 11, nullable = false)
    private long id;

    @Column(name="pass_score")
    private double pass_score;
    @Column(name="questions")
    private String questions;
    @Column(name="answers")
    private String answers;

    @OneToOne(optional = false, cascade = CascadeType.ALL)
    @JoinColumn(name="id_vacancy", unique = true, nullable = false, updatable = false)
    private Vacancy vacancy;

    @Transient
    private List<Question> questionList;

    //q1#q2#q3...
    //a11!&a12&a13..#a21&a22!&a23&...

    public List<Question> splitQuestions(){
        String delimeter = "#";
        String delimeterA = "&";
        String delimeterCorrectA = "!";
        String[] subStrQ = questions.split(delimeter);
        String[] subStrA = answers.split(delimeter);
        for (int i=0; i<subStrQ.length; i++){
            Question question = new Question();
            List<Answer> answerList = new ArrayList<>();
            question.setText_q(subStrQ[i]);
            String[] answerForQuestionI = subStrA[i].split(delimeterA);
            for (String a: answerForQuestionI){
                Answer answer = new Answer();
                String[] answerArr = a.split(delimeterCorrectA);
                if(answerArr.length==2) {
                    answer.setCorrect(true);
                    answer.setText(answerArr[1]);
                }
                else
                    answer.setText(answerArr[0]);
                answerList.add(answer);
            }
            question.setAnswers(answerList);
            questionList.add(question);
        }
        return questionList;
    }

    public List<Question> splitQuestions(String questions, String answers){
        String delimeter = "#";
        String delimeterA = "&";
        String delimeterCorrectA = "!";
        String[] subStrQ = questions.split(delimeter);
        String[] subStrA = answers.split(delimeter);
        for (int i=0; i<subStrQ.length; i++){
            Question question = new Question();
            List<Answer> answerList = new ArrayList<>();
            question.setText_q(subStrQ[i]);
            String[] answerForQuestionI = subStrA[i].split(delimeterA);
            for (String a: answerForQuestionI){
                Answer answer = new Answer();
                String[] answerArr = a.split(delimeterCorrectA);
                if(answerArr.length==2) {
                    answer.setCorrect(true);
                    answer.setText(answerArr[1]);
                }
                else
                    answer.setText(answerArr[0]);
                answerList.add(answer);
            }
            question.setAnswers(answerList);
            questionList.add(question);
        }
        return questionList;
    }

    public void combineStrings(List<Question> questionList){
        for (Question q: questionList){
            questions = "";
            questions.concat(q.text_q).concat("#");
            answers = "";
            for(Answer a: q.getAnswers()){
                if(a.equals(q.getAnswers().get(q.getAnswers().size()-1))) {
                    if (a.isCorrect())
                        answers.concat("!").concat(a.getText()).concat("#");
                    else
                        answers.concat(a.getText()).concat("#");
                }
                else {
                    if (a.isCorrect())
                        answers.concat("!").concat(a.getText()).concat("&");
                    else
                        answers.concat(a.getText()).concat("&");
                }
            }
            answers=answers.substring(0, answers.length()-1);
        }
        questions=questions.substring(0, questions.length()-1);

    }


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public double getPass_score() {
        return pass_score;
    }

    public void setPass_score(double pass_score) {
        this.pass_score = pass_score;
    }

    public String getQuestions() {
        return questions;
    }

    public void setQuestions(String questions) {
        this.questions = questions;
    }

    public String getAnswers() {
        return answers;
    }

    public void setAnswers(String answers) {
        this.answers = answers;
    }

    public Vacancy getVacancy() {
        return vacancy;
    }

    public void setVacancy(Vacancy vacancy) {
        this.vacancy = vacancy;
    }

    public List<Question> getQuestionList() {
        return questionList;
    }

    public void setQuestionList(List<Question> questionList) {
        this.questionList = questionList;
    }
}
