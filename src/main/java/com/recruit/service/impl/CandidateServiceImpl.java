package com.recruit.service.impl;

import com.recruit.entity.Candidate;
import com.recruit.entity.OrganizationStructure;
import com.recruit.repository.CandidateRepository;
import com.recruit.service.CandidateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CandidateServiceImpl implements CandidateService {
    @Autowired
    private CandidateRepository candidateRepository;

    @Override
    public Candidate addCandidate(Candidate candidate) {
        return candidateRepository.saveAndFlush(candidate);
    }

    public Candidate updateCandidate(Candidate candidate) {
        return candidateRepository.save(candidate);
    }

    @Override
    public void deleteById(long id) {
        candidateRepository.deleteByIdCandidate(id);
    }

    @Override
    public Candidate getById(Long id) {
        return candidateRepository.findByIdC(id);
    }

    @Override
    public Candidate getByEmail(String email) {
        return candidateRepository.findByEmail(email);
    }
//    @Override
//    public Candidate getByFullName(String surname, String name, String patronymic) {
//        return candidateRepository.findByFullName(surname, name, patronymic);
//    }
    @Override
    public Candidate getBySurname(String surname) {
        return candidateRepository.findBySurname(surname);
    }

    @Override
    public Candidate getByName(String name) {
        return candidateRepository.findByName(name);
    }

    @Override
    public Candidate editCandidate(Candidate candidate) {
        return candidateRepository.saveAndFlush(candidate);
    }

    @Override
    public List<Candidate> getAll() {
        return candidateRepository.findAll();
    }

    public Candidate getInfoCandidate(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Candidate candidate = getByEmail(auth.getName());
        return candidate;
    }

    @Override
    public Candidate getBySessionCode(String code) {
        return candidateRepository.findBySessionCode(code);
    }

    @Override
    public List<Candidate> getByHREmail(String email) {
        return candidateRepository.findByEmailHR(email);
    }

    @Override
    public List<Candidate> getByPostVacancy(String post) {
        return candidateRepository.getByPostVacancy(post);
    }

    @Override
    public List<Candidate> getByVacancy(long id_vacancy) {
        return candidateRepository.getByVacancy(id_vacancy);
    }
}
