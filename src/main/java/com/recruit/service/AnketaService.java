package com.recruit.service;

import com.recruit.entity.Anketa;

import java.util.List;

public interface AnketaService {
    Anketa addAnketa(Anketa anketa);
    void deleteById(long id);
    Anketa getByIdCandidate(Long id_candidate);
    Anketa editAnketa(Anketa anketa);
    List<Anketa> getAll();
}
