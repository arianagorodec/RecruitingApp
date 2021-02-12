package com.recruit.repository;

import com.recruit.entity.OrganizationStructure;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrganizationStructureRepository extends JpaRepository<OrganizationStructure, Long> {
    @Query("select o from OrganizationStructure o where o.id = :id")
    OrganizationStructure findById(@Param("id") long id);
    @Query("select o from OrganizationStructure o where o.department = :department")
    OrganizationStructure findByDepartment(@Param("department") String department);
    @Query("select o from OrganizationStructure o where o.post = :post")
    OrganizationStructure findByPost(@Param("post") String post);
    @Query("select o from OrganizationStructure o where o.post = :post and o.department = :department")
    OrganizationStructure findByDepartmentAndPost(@Param("department") String department, @Param("post") String post);
}
