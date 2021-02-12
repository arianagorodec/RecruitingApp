package com.recruit.entity;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name="employee")

public class Employee {
    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    @Column(name = "id_employee", length = 11, nullable = false)
    private long id;

    @Column(name = "surname")
    private String surname;
    @Column(name = "name")
    private String name;
    @Column(name = "gender")
    private String gender;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column(name = "birthday")
    private Date birthday;
    @Column(name = "pasp_ser", length = 9)
    private String pasp_ser;
    @Column(name = "pasp_id",length = 14)
    private String pasp_id;
    @Column(name = "pasp_date")
    private Date pasp_date;
    @Column(name = "pasp_num")
    private String pasp_num;
    @Column(name = "rate")
    private double rate;
    @Column(name = "email")
    private String email;
    @Column(name = "mobphone")
    private String mobphone;
    @Column(name = "isWorking")
    private int isWorking;
    @Column(name="photo")
    private String photo;
    @Column(name="facebookLink")
    private String facebookLink;
    @Column(name="linkedLink")
    private String linkedLink;
    @Column(name="twitterLink")
    private String twitterLink;

    @OneToOne(cascade = CascadeType.ALL)
    @NotFound(action = NotFoundAction.IGNORE)
    @JoinColumn(name="id_user", unique = true, nullable = true, updatable = false)
    private User user = new User();


    @ManyToOne(fetch = FetchType.EAGER, cascade = {CascadeType.PERSIST})
    @JoinColumn(name = "id_post")
    private OrganizationStructure post;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "employee", cascade = CascadeType.ALL)
    private Set<Timetable> timetableSet;

    public Employee(String surname, String name, Date birthday, String gender, String email,String pasp_ser, String pasp_id, Date pasp_date, String pasp_num, double rate, String mobphone, int isWorking, String photo, User user, OrganizationStructure post, Set<Timetable> timetableSet) {
        this.surname = surname;
        this.name = name;
        this.birthday = birthday;
        this.email=email;
        this.gender = gender;
        this.pasp_ser = pasp_ser;
        this.pasp_id = pasp_id;
        this.pasp_date = pasp_date;
        this.pasp_num = pasp_num;
        this.rate = rate;
        this.mobphone = mobphone;
        this.isWorking = isWorking;
        this.user = user;
        this.post = post;
        this.timetableSet = timetableSet;
        this.photo = photo;
    }

    public Employee() {
    }

    public Employee(Employee e) {
        this.setId(e.getId());
        this.setSurname(e.getSurname());
        this.setName(e.getName());
        this.setBirthday(e.getBirthday());
        this.setGender(e.getGender());
        this.setEmail(e.getEmail());
        this.setPasp_ser(e.getPasp_ser());
        this.setPasp_id(e.getPasp_id());
        this.setPasp_date(e.getPasp_date());
        this.setPasp_num(e.getPasp_num());
        this.setRate( e.getRate());
        this.setMobphone(e.getMobphone());
        this.setIsWorking(e.getIsWorking());
        this.setUser(e.getUser());
        this.setPost(e.getPost());
        this.setPhoto(e.getPhoto());
    }

    public Set<Timetable> getTimetableSet() {
        return timetableSet;
    }

    public void setTimetableSet(Set<Timetable> timetableSet) {
        this.timetableSet = timetableSet;
    }


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public double getRate() {
        return rate;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

    public String getMobphone() {
        return mobphone;
    }

    public void setMobphone(String mobphone) {
        this.mobphone = mobphone;
    }


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public OrganizationStructure getPost() {
        return post;
    }

    public void setPost(OrganizationStructure post) {
        this.post = post;
    }

    public int getIsWorking() {
        return isWorking;
    }

    public void setIsWorking(int isWorking) {
        this.isWorking = isWorking;
    }

    public String getPasp_ser() {
        return pasp_ser;
    }

    public void setPasp_ser(String pasp_ser) {
        this.pasp_ser = pasp_ser;
    }

    public String getPasp_id() {
        return pasp_id;
    }

    public void setPasp_id(String pasp_id) {
        this.pasp_id = pasp_id;
    }

    public Date getPasp_date() {
        return pasp_date;
    }

    public void setPasp_date(Date pasp_date) {
        this.pasp_date = pasp_date;
    }

    public String getPasp_num() {
        return pasp_num;
    }

    public void setPasp_num(String pasp_num) {
        this.pasp_num = pasp_num;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
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
}
