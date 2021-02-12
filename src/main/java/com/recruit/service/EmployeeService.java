package com.recruit.service;

import com.recruit.entity.Employee;

import java.util.List;

public interface EmployeeService {
    Employee addEmployee(Employee employee);
    void deleteById(long id);
    Employee getBySurname(String surname);
    Employee getByEmail(String email);
    Employee getByIdE(long id);
    Employee getByName(String name);
    Employee editEmployee(Employee employee);
    List<Employee> getAll();
    List<Employee> getAllHr();
}
