package com.recruit.service;

import com.recruit.entity.Anketa;
import com.recruit.entity.Test;

import java.util.List;

public interface TestService {
    Test addTest(Test test);
    void deleteById(long id);
    Test getByIdVacancy(Long id_vacancy);
    Test editTest(Test test);
    List<Test> getAll();
}
