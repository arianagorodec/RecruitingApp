package com.recruit.repository;

import com.recruit.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
//    @Query("select u from User u where u.username = :username")
//    User findByLogin(@Param("username") String name);

    User findByUsername(String username);
    User findById(long id);

    User findByActivationCode(String activationCode);

    @Query("select a from User a where a.role = 1")
    List<User> findAdmin();

}