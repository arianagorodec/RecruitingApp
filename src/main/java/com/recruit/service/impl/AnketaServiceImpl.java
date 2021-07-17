package com.recruit.service.impl;

import com.recruit.entity.Anketa;
import com.recruit.repository.AnketaRepository;
import com.recruit.service.AnketaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnketaServiceImpl implements AnketaService {
    @Autowired
    private AnketaRepository anketaRepository;

    @Override
    public Anketa addAnketa(Anketa anketa) {
        return anketaRepository.saveAndFlush(anketa);
    }

    @Override
    public void deleteById(long id) {
        anketaRepository.deleteById(id);
    }

    @Override
    public Anketa getByIdCandidate(Long id_candidate) {
        return anketaRepository.findByIdCandidate(id_candidate);
    }

    @Override
    public Anketa editAnketa(Anketa allowance) {
        return anketaRepository.saveAndFlush(allowance);
    }

    @Override
    public List<Anketa> getAll() {
        return anketaRepository.findAll();
    }

    public Anketa updateAnketa(Anketa anketa) {
        return anketaRepository.save(anketa);
    }

    public Anketa updateAnketaFromForm(Anketa anketa) {
        anketa.setAnswers(combineAnswer(anketa));
        return anketaRepository.save(anketa);
    }

    public String combineStr (String[] strings){
            String q6 = "";
            for(String str:strings){
                q6+=str+".";
            }
            return q6;
    }

    public String combineAnswer (Anketa anketa){
        String a = "";
            a=anketa.getQuestion1()+"/"+anketa.getQuestion2()+"/"+anketa.getQuestion3()+"/"+anketa.getQuestion4()+"/"
                    +anketa.getQuestion5()+"/"+combineStr(anketa.getQuestion6())+"/"
                    +combineStr(anketa.getQuestion7())+"/"+combineStr(anketa.getQuestion8());
        return a;
    }

    public Anketa getByIdCandidateForForm(long id){
        Anketa anketa = getByIdCandidate(id);
        if(anketa!=null) {
            String delimeter = "\\."; // Разделитель
            String delimeterAnswer = "/";
            String answers[]=anketa.getAnswers().split(delimeterAnswer);
            anketa.setQuestion1(answers[0]);
            anketa.setQuestion2(answers[1]);
            anketa.setQuestion3(answers[2]);
            anketa.setQuestion4(answers[3]);
            anketa.setQuestion5(answers[4]);
            anketa.setQuestion6(answers[5].split(delimeter));
            anketa.setQuestion7(answers[6].split(delimeter));
            anketa.setQuestion8(answers[7].split(delimeter));
        }
        return anketa;
    }

    public Anketa delimAnswer(Anketa anketa){
        String delimeter = "\\."; // Разделитель
        String delimeterAnswer = "/";
        String answers[]=anketa.getAnswers().split(delimeterAnswer);
        anketa.setQuestion1(answers[0]);
        anketa.setQuestion2(answers[1]);
        anketa.setQuestion3(answers[2]);
        anketa.setQuestion4(answers[3]);
        anketa.setQuestion5(answers[4]);
        anketa.setQuestion6(answers[5].split(delimeter));
        anketa.setQuestion7(answers[6].split(delimeter));
        anketa.setQuestion8(answers[7].split(delimeter));
        return anketa;
    }

    public Double[] question4Percent(List<Anketa> anketaList) {
        Double[] q = new Double[4];
        for (int i = 0; i< q.length; i++) {
            q[i] = 0.0;
        }
        for (Anketa anketa: anketaList) {
            delimAnswer(anketa);
            if(anketa.getQuestion4().equals("Отлично"))
                q[0]++;
            else if(anketa.getQuestion4().equals("Хорошо"))
                q[1]++;
            else if(anketa.getQuestion4().equals("Удовлетворительно"))
                q[2]++;
            else
                q[3]++;

        }
        for (int i = 0; i< q.length; i++) {
            q[i] = q[i] / anketaList.size() * 100;
        }
        return q;
    }

    public Double[] question5Percent(List<Anketa> anketaList) {
        Double[] q = new Double[4];
        for (int i = 0; i< q.length; i++) {
            q[i] = 0.0;
        }
        for (Anketa anketa: anketaList) {
            delimAnswer(anketa);
            if(anketa.getQuestion5().equals("Несколько часов"))
                q[0]++;
            else if(anketa.getQuestion5().equals("Несколько дней"))
                q[1]++;
            else if(anketa.getQuestion5().equals("Несколько недель"))
                q[2]++;
            else
                q[3]++;

        }
        for (int i = 0; i< q.length; i++) {
            q[i] = q[i] / anketaList.size() * 100;
        }
        return q;
    }

    public Double[] question1Percent(List<Anketa> anketaList) {
        Double[] q = new Double[2];
        for (int i = 0; i< q.length; i++) {
            q[i] = 0.0;
        }
        for (Anketa anketa: anketaList) {
            delimAnswer(anketa);
            if(anketa.getQuestion5().equals("Да"))
                q[0]++;
            else
                q[1]++;
        }
        for (int i = 0; i< q.length; i++) {
            q[i] = q[i] / anketaList.size() * 100;
        }
        return q;
    }

    public Double[] question2Percent(List<Anketa> anketaList) {
        Double[] q = new Double[2];
        for (int i = 0; i< q.length; i++) {
            q[i] = 0.0;
        }
        for (Anketa anketa: anketaList) {
            delimAnswer(anketa);
            if(anketa.getQuestion5().equals("Да"))
                q[0]++;
            else
                q[1]++;
        }
        for (int i = 0; i< q.length; i++) {
            q[i] = q[i] / anketaList.size() * 100;
        }
        return q;
    }
}


