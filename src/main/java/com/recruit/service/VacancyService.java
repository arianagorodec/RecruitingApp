package com.recruit.service;

import com.recruit.entity.Vacancy;

import java.util.List;

public interface VacancyService {
    Vacancy addVacancy(Vacancy vacancy);
    void deleteById(long id);
    Vacancy getByIdPost(Long id_post);
    Vacancy editVacancy(Vacancy vacancy);
    List<Vacancy> getAll();
    Vacancy getById(long id_vacancy);

    List<Vacancy> getByIdCandidate(long id);
}
