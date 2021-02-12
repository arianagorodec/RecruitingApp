package com.recruit.service;

import com.recruit.entity.Candidate;
import com.recruit.entity.Raiting;
import com.recruit.entity.Vacancy;

import java.util.List;

public interface RaitingService {
    Raiting addRaiting(Raiting raiting);
    void deleteById(long id);
    Raiting getByIdVacancy(Long id_vacancy);
    Raiting editRaiting(Raiting raiting);
    List<Raiting> getAll();
    Raiting getByCandidateAndVacancy(Candidate candidate, Vacancy i);

    void deleteByIdVacancy(long id);
}
