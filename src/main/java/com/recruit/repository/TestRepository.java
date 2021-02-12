package com.recruit.repository;

import com.recruit.entity.Test;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface TestRepository extends JpaRepository<Test,Long> {
    @Query("select t from Test t where t.vacancy.id = :id_vacancy")
    Test findByIdVacancy(@Param("id_vacancy") Long id_vacancy);
}
