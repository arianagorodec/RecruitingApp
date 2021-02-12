package com.recruit.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name="timetable")

public class Timetable {
    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    @Column(name = "id", length = 11, nullable = false)
    private long id;

    @Column(name = "startTime")
    private LocalDateTime startTime;
    @Column(name = "startDate")
    private Date startDate;
    @Column(name = "endTime")
    private LocalDateTime endTime;
    @Column(name = "endDate")
    private Date endDate;
    @Column(name = "type")
    private String type;
    @Column(name = "color")
    private String color;
    @Column(name = "url")
    private String url;

    @ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST}) //orphanRemoval=true
    @JoinColumn(name = "id_employee", nullable = false)
    private Employee employee;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_candidate", nullable = true)
    private Candidate candidate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_vacancy", nullable = true)
    private Vacancy vacancy;

    public Timetable() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getStartTime() {
        if(startTime!=null)
            return DateTimeFormatter.ofPattern("HH:mm").format(startTime);
        else
            return "";
    }

    public void setStartTime(LocalDateTime startTime) {
        this.startTime = startTime;
    }

    public String getStartDate() {
        if(startDate!=null)
            return new SimpleDateFormat("yyyy-MM-dd").format(startDate);
        else
            return "";
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Candidate getCandidate() {
        return candidate;
    }

    public void setCandidate(Candidate candidate) {
        this.candidate = candidate;
    }

    public String getEndDate() {
        if(endDate!=null) {
            return new SimpleDateFormat("yyyy-MM-dd").format(endDate);
        }
        else
            return "";
//        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getEndTime() {
//        return endTime;
        if(endTime!=null)
            return DateTimeFormatter.ofPattern("HH:mm").format(endTime);
        else
            return "";
    }

    public void setEndTime(LocalDateTime endTime) {
        this.endTime = endTime;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Vacancy getVacancy() {
        return vacancy;
    }

    public void setVacancy(Vacancy vacancy) {
        this.vacancy = vacancy;
    }
}
