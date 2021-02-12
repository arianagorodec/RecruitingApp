package com.recruit.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="organization_structure")

public class OrganizationStructure {
    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    @Column(name = "id_post", length = 11, nullable = false)
    private long id;

    @Column(name = "department")
    private String department;
    @Column(name = "post")
    private String post;
    @Column(name = "salary")
    private double salary;


    @OneToMany(fetch = FetchType.EAGER, mappedBy = "post", cascade = CascadeType.ALL)
    private Set<Employee> employees;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "post", cascade = CascadeType.ALL)
    private Set<Vacancy> vacancies;

    public OrganizationStructure() {
    }

    public OrganizationStructure(String department, String post, double salary, Set<Employee> employees) {
        this.department = department;
        this.post = post;
        this.salary = salary;
        this.employees = employees;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Set<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees(Set<Employee> employees) {
        this.employees = employees;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public Set<Vacancy> getVacancies() {
        return vacancies;
    }

    public void setVacancies(Set<Vacancy> vacancies) {
        this.vacancies = vacancies;
    }
}
