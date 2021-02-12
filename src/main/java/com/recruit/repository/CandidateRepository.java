package com.recruit.repository;

import com.recruit.entity.Candidate;
import com.recruit.entity.OrganizationStructure;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface CandidateRepository extends JpaRepository<Candidate, Long> {
//    @Query("select e from Candidate e where e.surname = :surname, e.name = :name, e.patronymic = :patronymic")
//    Candidate findByFullName(@Param("surname") String surname, @Param("name") String name, @Param("patronymic") String patronymic);
    @Query("select e from Candidate e where e.surname = :surname")
    Candidate findBySurname(@Param("surname") String surname);
    @Query("select e from Candidate e where e.name = :name")
    Candidate findByName(@Param("name") String name);
    @Query("select e from Candidate e where e.email = :email")
    Candidate findByEmail(@Param("email") String email);
    @Query("select e from Candidate e where e.HrEmail = :emailhr")
    List<Candidate> findByEmailHR(@Param("emailhr") String emailhr);
    @Query("select e from Candidate e where e.sessionCode = :code")
    Candidate findBySessionCode(@Param("code") String code);
    @Transactional
    @Modifying
    @Query("delete from Candidate e where e.id = :id")
    int deleteByIdCandidate(@Param("id") long id);

    @Query("select e from Candidate e where e.id = :id")
    Candidate findByIdC(@Param("id") long id);

    @Query("select e from Candidate e join e.vacancies v where v.post.department = :department")
    List<Candidate> getByPostVacancy(@Param("department") String department);

    @Query("select e from Candidate e join e.vacancies v where v.id = :id_vacancy")
    List<Candidate> getByVacancy(@Param("id_vacancy") long id_vacancy);
}
