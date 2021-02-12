package com.recruit.service.impl;

import com.recruit.entity.Test;
import com.recruit.repository.TestRepository;
import com.recruit.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestServiceImpl implements TestService {
    @Autowired
    private TestRepository testRepository;

    @Override
    public Test addTest(Test test) {
        return testRepository.saveAndFlush(test);
    }

    @Override
    public void deleteById(long id) {
        testRepository.deleteById(id);
    }

    @Override
    public Test getByIdVacancy(Long id_vacancy) {
        return testRepository.findByIdVacancy(id_vacancy);
    }

    @Override
    public Test editTest(Test test) {
        return testRepository.saveAndFlush(test);
    }

    @Override
    public List<Test> getAll() {
        return testRepository.findAll();
    }

    public Test updateTest(Test test) {
        return testRepository.save(test);
    }
}


