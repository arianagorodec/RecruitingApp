package com.recruit.repository;

import com.recruit.entity.Anketa;
import com.recruit.entity.Raiting;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RaitingRepository extends JpaRepository<Raiting,Long> {
    @Query("select a from Raiting a where a.vacancy.id = :id_vacancy")
    Raiting findByIdVacancy(@Param("id_vacancy") Long id_vacancy);

    @Query("select a from Raiting a where a.vacancy.id = :id_vacancy and a.candidate.id= :id_candidate")
    Raiting findByCandidateAndVacancy(@Param("id_candidate") Long id_candidate, @Param("id_vacancy") Long id_vacancy);


    @Modifying
    @Query("delete from Raiting a where a.vacancy.id = :id_vacancy")
    void deleteByIdVacancy(@Param("id_vacancy") Long id);

    @Modifying
    @Query("delete from Raiting a where a.id = :id")
    void deleteById(@Param("id") Long id_raiting);
}
