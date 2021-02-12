package com.recruit.service;

import com.recruit.entity.OrganizationStructure;

import java.util.List;

public interface OrganizationStructureService {
    OrganizationStructure addOrganizationStructure(OrganizationStructure organizationStructure);
    void deleteById(long id);
    OrganizationStructure getById(long id);
    OrganizationStructure getByDepartment(String name);
    OrganizationStructure getByPost(String name);
    OrganizationStructure editOrganizationStructure(OrganizationStructure organizationStructure);
    List<OrganizationStructure> getAll();
    OrganizationStructure getByDepartmentAndPost(String department, String post);
}
