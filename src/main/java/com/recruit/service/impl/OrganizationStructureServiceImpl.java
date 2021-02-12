package com.recruit.service.impl;


import com.recruit.entity.OrganizationStructure;
import com.recruit.repository.OrganizationStructureRepository;
import com.recruit.service.OrganizationStructureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrganizationStructureServiceImpl implements OrganizationStructureService {
    @Autowired
    private OrganizationStructureRepository organizationStructureRepository;

    @Override
    public OrganizationStructure addOrganizationStructure(OrganizationStructure organizationStructure) {
        return organizationStructureRepository.saveAndFlush(organizationStructure);
    }

    @Override
    public void deleteById(long id) {
        organizationStructureRepository.deleteById(id);
    }

    @Override
    public OrganizationStructure getById(long id) {
        return organizationStructureRepository.findById(id);
    }

    @Override
    public OrganizationStructure getByDepartment(String name) {
        return organizationStructureRepository.findByDepartment(name);
    }

    @Override
    public OrganizationStructure getByDepartmentAndPost(String department, String post) {
        return organizationStructureRepository.findByDepartmentAndPost(department,post);
    }

    @Override
    public OrganizationStructure getByPost(String name) {
        return organizationStructureRepository.findByPost(name);
    }

    @Override
    public OrganizationStructure editOrganizationStructure(OrganizationStructure organizationStructure) {
        return organizationStructureRepository.saveAndFlush(organizationStructure);
    }

    @Override
    public List<OrganizationStructure> getAll() {
        return organizationStructureRepository.findAll();
    }
}
