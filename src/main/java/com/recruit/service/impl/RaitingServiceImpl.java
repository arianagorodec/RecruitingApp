package com.recruit.service.impl;

import com.recruit.entity.Candidate;
import com.recruit.entity.Raiting;
import com.recruit.entity.Vacancy;
import com.recruit.repository.RaitingRepository;
import com.recruit.service.RaitingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RaitingServiceImpl implements RaitingService {
    @Autowired
    private RaitingRepository raitingRepository;

    @Override
    public Raiting addRaiting(Raiting raiting) {
        return raitingRepository.saveAndFlush(raiting);
    }

    @Override
    public void deleteById(long id) {
        raitingRepository.deleteById(id);
    }

    @Override
    public Raiting getByIdVacancy(Long id_vacancy) {
        return raitingRepository.findByIdVacancy(id_vacancy);
    }

    @Override
    public Raiting editRaiting(Raiting raiting) {
        return raitingRepository.saveAndFlush(raiting);
    }

    @Override
    public List<Raiting> getAll() {
        return raitingRepository.findAll();
    }

    public Raiting updateRaitingy(Raiting raiting) {
        return raitingRepository.save(raiting);
    }

    @Override
    public Raiting getByCandidateAndVacancy(Candidate candidate, Vacancy vacancy) {
        return raitingRepository.findByCandidateAndVacancy(candidate.getId(), vacancy.getId());
    }

    @Transactional
    @Override
    public void deleteByIdVacancy(long id) {
        raitingRepository.deleteByIdVacancy(id);
    }
}


