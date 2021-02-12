package com.recruit.repository;

import com.recruit.entity.Anketa;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AnketaRepository extends JpaRepository<Anketa,Long> {
    @Query("select a from Anketa a where a.candidate.id = :id_candidate")
    Anketa findByIdCandidate(@Param("id_candidate") Long id_candidate);
}
