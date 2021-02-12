package com.recruit.service.impl;

import com.recruit.entity.Timetable;
import com.recruit.repository.TimetableRepository;
import com.recruit.service.TimetableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TimetableServiceImpl implements TimetableService {
    @Autowired
    private TimetableRepository timetableRepository;

    @Override
    public Timetable addTimetable(Timetable timetable) {
        return timetableRepository.saveAndFlush(timetable);
    }

    @Override
    public void deleteById(long id) {
        timetableRepository.deleteById(id);
    }

    @Override
    public List<Timetable> getByIdEmployee(Long idEmployee) {
        return timetableRepository.findByIdEmployee(idEmployee);
    }

    @Override
    public Timetable getByIdCandidate(Long idCandidate) {
        return timetableRepository.findByIdCandidate(idCandidate);
    }

    @Override
    public Timetable editTimetable(Timetable timetable) {
        return timetableRepository.saveAndFlush(timetable);
    }

    @Override
    public List<Timetable> getByType(String type) {
        return timetableRepository.findByType(type);
    }

    @Override
    public List<Timetable> getByTypeAndIdEmployee(String type, long id) {
        return timetableRepository.findByTypeAndIdEmployee(type,id);
    }

    @Override
    public List<Timetable> getByTypeAndIdCandidate(String type, long id) {
        return timetableRepository.findByTypeAndIdCandidate(type,id);
    }

    @Override
    public List<Timetable> getAll() {
        return timetableRepository.findAll();
    }

    @Override
    public List<Timetable> getByIdCandidateAndVacancy(long id_candidate, long id_vacancy) {
        return timetableRepository.findByIdCandidateAndIdVacancy(id_candidate,id_vacancy);
    }

    @Transactional
    @Override
    public void deleteByIdVacancy(long id_vacancy) {
        timetableRepository.deleteByIdVacancy(id_vacancy);
        return;
    }
}
