package com.recruit.service;

import com.recruit.entity.Candidate;
import com.recruit.entity.OrganizationStructure;

import java.util.List;

public interface CandidateService {
    Candidate addCandidate(Candidate candidate);
    void deleteById(long id);
    Candidate getById(Long id);
    Candidate getBySurname(String surname);
    Candidate getByName(String name);
    //Candidate getByFullName(String surname, String name, String patronymic);
    Candidate getByEmail(String email);
    List<Candidate> getByHREmail(String email);
    Candidate editCandidate(Candidate candidate);
    Candidate getBySessionCode(String code);
    List<Candidate> getAll();
    List<Candidate> getByPostVacancy(String post);
    List<Candidate> getByVacancy(long id_vacancy);
}
