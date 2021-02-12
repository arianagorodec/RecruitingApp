package com.recruit.repository;

import com.recruit.entity.Anketa;
import com.recruit.entity.Vacancy;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VacancyRepository extends JpaRepository<Vacancy,Long> {
    @Query("select a from Vacancy a where a.post.id = :id_post")
    Vacancy findByIdPost(@Param("id_post") Long id_post);

    Vacancy findById(long id);

    @Modifying
    @Query("delete from Vacancy v where v.id = :id_vacancy")
    void deleteById(@Param("id_vacancy") Long id_vacancy);

    @Query("select v from Vacancy v join v.candidates c where c.id = :id")
    List<Vacancy> findByIdCandidate(long id);
}
