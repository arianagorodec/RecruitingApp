package com.recruit.model;

import com.recruit.entity.Candidate;
import com.recruit.entity.Raiting;
import com.recruit.entity.Test;
import com.recruit.entity.Vacancy;
import com.recruit.entity.enums.LanguageLevel;
import com.recruit.service.impl.CandidateServiceImpl;
import com.recruit.service.impl.TestServiceImpl;
import com.recruit.service.impl.VacancyServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class AnalyzeCandidates {

    public List<Candidate> firstStepAnalyze(Vacancy vacancy, List<Candidate> allCandidatesList, Test test){
        List<Candidate> result = new ArrayList<>();
        if(allCandidatesList!=null) {
            for (Candidate candidate : allCandidatesList) {
                for (Raiting raiting : candidate.getRaitings()) {
                    candidate.setRaiting(raiting);
                    if (raiting.getVacancy() == vacancy) {
                        if (raiting.getTestScope() >= test.getPass_score())
                            result.add(candidate);
                    }
                }
            }
//            for (Candidate candidate: result)
//                System.out.println(candidate.getRaiting().getLangScope());
        }

        return result;
    }
    public List<Candidate> secondStepAnalyze(List<Candidate> firstStepCandidates, Vacancy vacancy){
        List<Candidate> result = new ArrayList<>();

        if(firstStepCandidates!=null) {
            for (Candidate candidate : firstStepCandidates) {
                        if (tellNumberLevel(candidate.getRaiting().getLangScope()) >= tellNumberLevel(vacancy.getLanguage_level()))
                            result.add(candidate);
            }
        }

        return result;
    }
    public List<Candidate> thirdStepAnalyze(List<Candidate> secondStepCandidates,
                                            double c_test,
                                            double c_lang,
                                            double c_softSkills,
                                            double c_tech,
                                            int countCandidate){
        List<Candidate> result = new ArrayList<>();

        double assesment = 0;

        if(secondStepCandidates!=null) {
            for (Candidate candidate : secondStepCandidates) {
                        assesment = c_test * candidate.getRaiting().getTestScope() + c_lang * tellNumberLevel(candidate.getRaiting().getLangScope())
                                + c_softSkills * candidate.getRaiting().getSocialScope() + c_tech * candidate.getRaiting().getTestScope();
                        candidate.setResultAssesment(assesment);

            }
        }
        secondStepCandidates.sort(new SortByResultAssesment().reversed());

        if(countCandidate<secondStepCandidates.size()) {
            for (int i = 0; i < countCandidate; i++)
                result.add(secondStepCandidates.get(i));
        }
        else
            result=secondStepCandidates;

        return result;
    }

        public double tellNumberLevel(LanguageLevel level) {
            switch (level) {
                case A1: return 1.67;
                case A2: return 3.34;
                case B1: return 5.01;
                case B2: return 6.68;
                case C1: return 8.35;
                case C2: return 10;
                default: return 0;
            }
        }
}
