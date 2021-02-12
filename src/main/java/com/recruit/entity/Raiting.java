package com.recruit.entity;


import com.recruit.entity.enums.LanguageLevel;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import javax.persistence.*;


@Entity
@Table(name="raiting")
public class Raiting {
    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    @Column(name = "id_raiting", length = 11, nullable = false)
    private long id_raiting;

    @Column(name="testScope")
    private Double testScope;
    @Column(name="socialScope")
    private Double socialScope;
    @Column(name="langScope")
    private LanguageLevel langScope;
    @Column(name="techScope")
    private Double techScope;

    @ManyToOne(fetch = FetchType.EAGER, cascade = {CascadeType.PERSIST})
    @JoinColumn(name = "id_candidate")
    private Candidate candidate;

    @ManyToOne(fetch = FetchType.EAGER, cascade = {CascadeType.PERSIST})
    @JoinColumn(name = "id_vacancy")
    private Vacancy vacancy;

    public Raiting() {
    }

    public Raiting(Double testScope, Double socialScope, LanguageLevel langScope, Double techScope, Candidate candidate, Vacancy vacancy) {
        this.testScope = testScope;
        this.socialScope = socialScope;
        this.langScope = langScope;
        this.techScope = techScope;
        this.candidate = candidate;
        this.vacancy = vacancy;
    }

    public long getId_raiting() {
        return id_raiting;
    }

    public void setId_raiting(long id_raiting) {
        this.id_raiting = id_raiting;
    }

    public Double getTestScope() {
        return testScope;
    }

    public void setTestScope(Double testScope) {
        this.testScope = testScope;
    }

    public Double getSocialScope() {
        return socialScope;
    }

    public void setSocialScope(Double socialScope) {
        this.socialScope = socialScope;
    }

    public LanguageLevel getLangScope() {
        return langScope;
    }

    public void setLangScope(LanguageLevel langScope) {
        this.langScope = langScope;
    }

    public Double getTechScope() {
        return techScope;
    }

    public void setTechScope(Double techScope) {
        this.techScope = techScope;
    }

    public Candidate getCandidate() {
        return candidate;
    }

    public void setCandidate(Candidate candidate) {
        this.candidate = candidate;
    }

    public Vacancy getVacancy() {
        return vacancy;
    }

    public void setVacancy(Vacancy vacancy) {
        this.vacancy = vacancy;
    }


}
