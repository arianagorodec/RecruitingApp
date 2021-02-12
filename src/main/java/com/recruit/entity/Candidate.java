package com.recruit.entity;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;



@Entity
@Table(name="candidate")

public class Candidate {
    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    @Column(name = "id_candidate", length = 11, nullable = false)
    private long id;

    @Column(name = "surname")
    private String surname;
    @Column(name = "name")
    private String name;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column(name = "birthday")
    private Date birthday;
    @Column(name = "mob_phone")
    private String mobphone;
    @Column(name = "email")
    private String email;
    @Column(name = "gender")
    private String gender;
    @Column(name="photo")
    private String photo;
    @Column(name="facebookLink")
    private String facebookLink;
    @Column(name="linkedLink")
    private String linkedLink;
    @Column(name="twitterLink")
    private String twitterLink;
    @Column(name="HrEmail")
    private String HrEmail;
    @Column(name="sessionCode")
    private String sessionCode;

    @OneToOne(optional = false, cascade = CascadeType.ALL)
    @JoinColumn(name="id_user", unique = true, nullable = false, updatable = false)
    private User user;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "candidate", cascade = CascadeType.ALL)
    private Set<Raiting> raitings;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "employee", cascade = CascadeType.ALL)
    private Set<Timetable> timetableSet;

    @OneToOne(mappedBy="candidate", cascade = CascadeType.ALL)
    public Anketa anketa;

//    @ManyToMany(mappedBy = "vacancySet")
//    Set<Vacancy> vacancies;

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(
            name = "Candidate_Vacation",
            joinColumns = { @JoinColumn(name = "id_Candidate") },
            inverseJoinColumns = { @JoinColumn(name = "id_Vacation") }
    )
    Set<Vacancy> vacancies = new HashSet<>();

    @Transient
    Vacancy vacancy;
    @Transient
    Raiting raiting;
    @Transient
    double resultAssesment;

    public Candidate() {
    }

    public Candidate(Candidate candidate) {
        this.id=candidate.id;
        this.surname = candidate.surname;
        this.name = candidate.name;
        this.birthday = candidate.birthday;
        this.mobphone = candidate.mobphone;
        this.email = candidate.email;
        this.gender = candidate.gender;
        this.photo = candidate.photo;
        this.facebookLink = candidate.facebookLink;
        this.linkedLink = candidate.linkedLink;
        this.twitterLink = candidate.twitterLink;
        this.sessionCode = candidate.sessionCode;
        this.user = candidate.user;
        this.raitings = candidate.raitings;
        this.timetableSet = candidate.timetableSet;
        this.anketa = candidate.anketa;
        this.vacancies = candidate.vacancies;
    }

    public Candidate(String surname, String name, Date birthday, String mobphone, String email, String gender, String photo, String facebookLink, String linkedLink, String twitterLink, String hrEmail, String sessionCode, User user, Set<Raiting> raitings, Set<Timetable> timetableSet, Anketa anketa, Set<Vacancy> vacancies) {
        this.surname = surname;
        this.name = name;
        this.birthday = birthday;
        this.mobphone = mobphone;
        this.email = email;
        this.gender = gender;
        this.photo = photo;
        this.facebookLink = facebookLink;
        this.linkedLink = linkedLink;
        this.twitterLink = twitterLink;
        HrEmail = hrEmail;
        this.sessionCode = sessionCode;
        this.user = user;
        this.raitings = raitings;
        this.timetableSet = timetableSet;
        this.anketa = anketa;
        this.vacancies = vacancies;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getMobphone() {
        return mobphone;
    }

    public void setMobphone(String mobphone) {
        this.mobphone = mobphone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Set<Timetable> getTimetableSet() {
        return timetableSet;
    }

    public void setTimetableSet(Set<Timetable> timetableSet) {
        this.timetableSet = timetableSet;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Anketa getAnketa() {
        return anketa;
    }

    public void setAnketa(Anketa anketa) {
        this.anketa = anketa;
    }

    public String getHrEmail() {
        return HrEmail;
    }

    public void setHrEmail(String hrEmail) {
        HrEmail = hrEmail;
    }

    public String getSessionCode() {
        return sessionCode;
    }

    public void setSessionCode(String sessionCode) {
        this.sessionCode = sessionCode;
    }

    public String getFacebookLink() {
        return facebookLink;
    }

    public void setFacebookLink(String facebookLink) {
        this.facebookLink = facebookLink;
    }

    public String getLinkedLink() {
        return linkedLink;
    }

    public void setLinkedLink(String linkedLink) {
        this.linkedLink = linkedLink;
    }

    public String getTwitterLink() {
        return twitterLink;
    }

    public void setTwitterLink(String twitterLink) {
        this.twitterLink = twitterLink;
    }

    public Set<Raiting> getRaitings() {
        return raitings;
    }

    public void setRaitings(Set<Raiting> raitings) {
        this.raitings = raitings;
    }

    public Set<Vacancy> getVacancies() {
        return vacancies;
    }

    public void setVacancies(Set<Vacancy> vacancies) {
        this.vacancies = vacancies;
    }

    public Vacancy getVacancy() {
        return vacancy;
    }

    public void setVacancy(Vacancy vacancy) {
        this.vacancy = vacancy;
    }

    public Raiting getRaiting() {
        return raiting;
    }

    public void setRaiting(Raiting raiting) {
        this.raiting = raiting;
    }

    public double getResultAssesment() {
        return resultAssesment;
    }

    public void setResultAssesment(double resultAssesment) {
        this.resultAssesment = resultAssesment;
    }
}
