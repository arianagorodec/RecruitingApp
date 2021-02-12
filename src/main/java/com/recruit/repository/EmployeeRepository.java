package com.recruit.repository;

import com.recruit.entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Long> {
    @Query("select e from Employee e where e.surname = :surname")
    Employee findBySurname(@Param("surname") String surname);
    @Query("select e from Employee e where e.name = :name")
    Employee findByName(@Param("name") String name);

    @Query("select e from Employee e where e.email = :email")
    Employee findByEmail(@Param("email") String email);

    @Query("select e from Employee e where e.post.post = 'hr'")
    List<Employee> findAllHr();

    @Transactional
    @Query("select e from Employee e where e.id = :id")
    Employee findByIDE(@Param("id") long id);
}
