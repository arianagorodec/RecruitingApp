package com.recruit.service.impl;

import com.recruit.entity.Vacancy;
import com.recruit.repository.VacancyRepository;
import com.recruit.service.VacancyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class VacancyServiceImpl implements VacancyService {
    @Autowired
    private VacancyRepository vacancyRepository;

    @Override
    public Vacancy addVacancy(Vacancy vacancy) {
        return vacancyRepository.saveAndFlush(vacancy);
    }

    @Transactional
    @Override
    public void deleteById(long id) {
        vacancyRepository.deleteById(id);
    }


    @Override
    public Vacancy getByIdPost(Long id_post) {
        return vacancyRepository.findByIdPost(id_post);
    }

    @Override
    public Vacancy editVacancy(Vacancy vacancy) {
        return vacancyRepository.saveAndFlush(vacancy);
    }

    @Override
    public List<Vacancy> getAll() {
        return vacancyRepository.findAll();
    }

    public Vacancy updateVacancy(Vacancy vacancy) {
        return vacancyRepository.save(vacancy);
    }

    @Override
    public Vacancy getById(long id_vacancy) {
        return vacancyRepository.findById(id_vacancy);
    }

    @Override
    public List<Vacancy> getByIdCandidate(long id) {
        return vacancyRepository.findByIdCandidate(id) ;
    }
}


