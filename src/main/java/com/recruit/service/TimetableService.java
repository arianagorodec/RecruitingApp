package com.recruit.service;

import com.recruit.entity.Timetable;

import java.util.List;

public interface TimetableService {
    Timetable addTimetable(Timetable timetable);
    void deleteById(long id);
    List<Timetable> getByIdEmployee(Long idEmployee);
    Timetable getByIdCandidate(Long idCandidate);
    List<Timetable> getByType(String type);
    List<Timetable> getByTypeAndIdEmployee(String type, long id);
    List<Timetable> getByTypeAndIdCandidate(String type, long id);
    Timetable editTimetable(Timetable timetable);
    List<Timetable> getAll();
    void deleteByIdVacancy(long id_vacancy);
    List<Timetable> getByIdCandidateAndVacancy(long id, long id1);
}
