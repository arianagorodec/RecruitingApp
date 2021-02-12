package com.recruit.entity;

import com.recruit.entity.enums.LanguageLevel;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="vacancy")
public class Vacancy {
    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    @Column(name = "id_vacancy", length = 11, nullable = false)
    private long id;

    @Column(name="name")
    private String name;
    @Column(name="testLink")
    private String testLink;
    @Column(name="description")
    private String description;
    @Column(name="language_level")
    private LanguageLevel language_level;

    @Transient
    private boolean use=false;
    @Transient
    private String hrInterviewerDate;
    @Transient
    private String techInterviewerDate;
    @Transient
    private double testResult;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "vacancy", cascade = CascadeType.ALL)
    private Set<Raiting> raitings;

    @ManyToOne(fetch = FetchType.EAGER, cascade = {CascadeType.PERSIST})
    @JoinColumn(name = "id_post")
    private OrganizationStructure post;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "vacancy", cascade = CascadeType.ALL)
    private Set<Timetable> timetableSet;

    @ManyToMany(mappedBy = "vacancies", fetch = FetchType.LAZY)
    private Set<Candidate> candidates = new HashSet<>();


    @OneToOne(mappedBy="vacancy", cascade = CascadeType.ALL)
    private Test test;


    public Vacancy() {
    }

    public Vacancy(String name, String testLink, String description, LanguageLevel language_level, OrganizationStructure post, Set<Candidate> candidates) {
        this.name = name;
        this.testLink = testLink;
        this.description = description;
        this.language_level = language_level;
        this.post = post;
        this.candidates = candidates;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public OrganizationStructure getPost() {
        return post;
    }

    public void setPost(OrganizationStructure post) {
        this.post = post;
    }

    public String getTestLink() {
        return testLink;
    }

    public void setTestLink(String testLink) {
        this.testLink = testLink;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Set<Raiting> getRaitings() {
        return raitings;
    }

    public void setRaitings(Set<Raiting> raitings) {
        this.raitings = raitings;
    }

    public Set<Candidate> getCandidates() {
        return candidates;
    }

    public void setCandidates(Set<Candidate> candidates) {
        this.candidates = candidates;
    }

    public boolean isUse() {
        return use;
    }

    public void setUse(boolean use) {
        this.use = use;
    }

    public Set<Timetable> getTimetableSet() {
        return timetableSet;
    }

    public void setTimetableSet(Set<Timetable> timetableSet) {
        this.timetableSet = timetableSet;
    }

    public String getHrInterviewerDate() {
        return hrInterviewerDate;
    }

    public void setHrInterviewerDate(String hrInterviewerDate) {
        this.hrInterviewerDate = hrInterviewerDate;
    }

    public String getTechInterviewerDate() {
        return techInterviewerDate;
    }

    public void setTechInterviewerDate(String techInterviewerDate) {
        this.techInterviewerDate = techInterviewerDate;
    }

    public double getTestResult() {
        return testResult;
    }

    public void setTestResult(double testResult) {
        this.testResult = testResult;
    }

    public LanguageLevel getLanguage_level() {
        return language_level;
    }

    public void setLanguage_level(LanguageLevel language_level) {
        this.language_level = language_level;
    }

    public Test getTest() {
        return test;
    }

    public void setTest(Test test) {
        this.test = test;
    }
}
