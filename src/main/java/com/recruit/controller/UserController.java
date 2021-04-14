package com.recruit.controller;

import com.recruit.entity.*;
import com.recruit.service.impl.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class UserController {
    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private CandidateServiceImpl candidateService;
    @Autowired
    private AnketaServiceImpl anketaService;
    @Autowired
    private EmployeeServiceImpl employeeService;
    @Autowired
    private ChatMessageServiceImpl chatMessageService;
    @Autowired
    private VacancyServiceImpl vacancyService;
    @Autowired
    private TimetableServiceImpl timetableService;


    @Value("${upload.path}")
    private  String uploadPath;
    @Value("${upload.pathJ}")
    private  String uploadPathJ;
    @Value("${upload.path.anketa}")
    private  String uploadPathAnketa;
    @Value("${upload.path.anketaJ}")
    private  String uploadPathAnketaJ;

    @GetMapping("/user")
    public String userList(Model model) {
        Candidate candidate = candidateService.getInfoCandidate();
        String code = candidate.getSessionCode();
        model.addAttribute("code",code);
        model.addAttribute("name", candidate.getName()+" "+candidate.getSurname());
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        model.addAttribute("birthday", format.format(candidate.getBirthday()));
        model.addAttribute("mobphone", candidate.getMobphone());
        model.addAttribute("email", candidate.getEmail());
       model.addAttribute("gender", candidate.getGender());
        model.addAttribute("uploadPath",uploadPath);
       model.addAttribute("photo",candidate.getPhoto());
        model.addAttribute("facebook",candidate.getFacebookLink());
        model.addAttribute("twitter",candidate.getTwitterLink());
        model.addAttribute("linked",candidate.getLinkedLink());
        return "user";
    }
    @GetMapping("/user/quest")
    public String  questUser(Model model) {
        Candidate candidate = candidateService.getInfoCandidate();
        String code = candidate.getSessionCode();
        model.addAttribute("code",code);
        Anketa anketa = anketaService.getByIdCandidateForForm(candidate.getId());
        if(anketa!=null){
            model.addAttribute("anketa", anketa);
        }
        else
            model.addAttribute("anketa", new Anketa());
        model.addAttribute("name", candidate.getName()+" "+candidate.getSurname());
        return "user_quest";
    }
    @GetMapping("/message-{code}")
    public String  messageUser(Model model, @PathVariable String code) {
        Candidate candidate = candidateService.getInfoCandidate();
        model.addAttribute("code",code);
        model.addAttribute("username", candidate.getUser().getUsername());
        model.addAttribute("to",  candidate.getHrEmail());
        Employee employeeTo = employeeService.getByEmail(candidate.getHrEmail());
        Candidate candidateTo = candidateService.getByEmail(candidate.getHrEmail());
        model.addAttribute("photo",  employeeTo.getPhoto());
        List<ChatMessage> messagesList = chatMessageService.getByToTwice(employeeTo.getUser().getId(), candidate.getUser().getId());
        Comparator<ChatMessage> comparator = new Comparator<ChatMessage>() {
            @Override
            public int compare(ChatMessage left, ChatMessage right) {
                return (int) (left.getId() - right.getId());
            }
        };
        messagesList.sort(comparator);
        model.addAttribute("list",  messagesList);
        return "user_message";
    }

    @GetMapping("/user/vacancy")
    public String userVacancy(Model model) {
        Candidate candidate = candidateService.getInfoCandidate();
        List<Vacancy> vacancyList = vacancyService.getAll();
        for (Vacancy vacancy:vacancyList){
            if(candidate.getVacancies().contains(vacancy))
                vacancy.setUse(true);
        }
        model.addAttribute("vacancyList",vacancyList);
        return "user_vacancy";
    }
    @GetMapping("/user/request")
    public String userRequest(Model model) {
        Candidate candidate = candidateService.getInfoCandidate();
        List<Vacancy> vacancyList = vacancyService.getByIdCandidate(candidate.getId());
        for (Vacancy vacancy :vacancyList){
            List<Timetable> timetables = timetableService.getByIdCandidateAndVacancy(candidate.getId(),vacancy.getId());
            vacancy.setTechInterviewerDate("ещё не назначено");
            vacancy.setHrInterviewerDate("ещё не назначено");
            for (Raiting raiting :candidate.getRaitings()){
                if(raiting.getVacancy().equals(vacancy))
                    vacancy.setTestResult(raiting.getTestScope());
            }
            for (Timetable timetable: timetables) {
                if(timetable.getEmployee().getPost().getPost().equals("HR"))
                    vacancy.setHrInterviewerDate(timetable.getStartDate() + " " + timetable.getStartTime());
                else
                    vacancy.setTechInterviewerDate(timetable.getStartDate() + " " + timetable.getStartTime());
            }
        }
        model.addAttribute("vacancyList",vacancyList);
        return "user_request";
    }

    @PostMapping("/user")
    public String addPhoto(@RequestParam("file") MultipartFile file) throws IOException {
        Candidate candidate = candidateService.getInfoCandidate();
        if (file != null) {
            File uploadDir = new File(uploadPathJ);
            if(!uploadDir.exists()){
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPathJ+"/"+resultFileName));

            candidate.setPhoto(resultFileName);
            candidateService.updateCandidate(candidate);
        }
        return "redirect:/user";
    }

    @PostMapping("/user/facebook")
    public String addFacebook(@RequestParam("facebookLink") String link) throws IOException {
        Candidate candidate = candidateService.getInfoCandidate();
        if (link != null) {
            candidate.setFacebookLink(link);
            candidateService.updateCandidate(candidate);
        }
        return "redirect:/user";
    }

    @PostMapping("/user/linked")
    public String addLinked(@RequestParam("linkedLink") String link) throws IOException {
        Candidate candidate = candidateService.getInfoCandidate();
        if (link != null) {
            candidate.setLinkedLink(link);
            candidateService.updateCandidate(candidate);
        }
        return "redirect:/user";
    }

    @PostMapping("/user/twitter")
    public String addtwitter(@RequestParam("twitterLink") String link) throws IOException {
        Candidate candidate = candidateService.getInfoCandidate();
        if (link != null) {
            candidate.setTwitterLink(link);
            candidateService.updateCandidate(candidate);
        }
        return "redirect:/user";
    }

    @PostMapping("/user/quest")
    public String  questUser(@ModelAttribute("anketa") @Valid Anketa anketa, BindingResult bindingResult,
          @RequestParam("file") MultipartFile file) throws IOException {
        if (bindingResult.hasErrors()) {
            return "user_quest";
        }
        Candidate candidate = candidateService.getInfoCandidate();
        if (file != null) {
            File uploadDir = new File(uploadPathAnketaJ);
            if(!uploadDir.exists()){
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPathAnketaJ+"/"+resultFileName));

            anketa.setResume(resultFileName);
            anketa.setCandidate(candidate);
            Anketa oldAnketa = anketaService.getByIdCandidate(candidate.getId());
            if(oldAnketa!=null) {
                oldAnketa.setAnketa(anketa);
                anketaService.updateAnketaFromForm(oldAnketa);
            }
            else
                anketaService.updateAnketaFromForm(anketa);
        }
        return "user_quest";
    }

    @PostMapping("/user/vacancy")
    public String addVacancy(@RequestParam("id") long id_vacancy) throws IOException {
        Candidate candidate = candidateService.getInfoCandidate();
        Vacancy vacancy = vacancyService.getById(id_vacancy);
        candidate.getVacancies().add(vacancy);
        Raiting raiting = new Raiting();
        raiting.setVacancy(vacancy);
        raiting.setTestScope(0.0);
        raiting.setLangScope(null);
        raiting.setSocialScope(0.0);
        raiting.setTechScope(0.0);
        candidate.setRaiting(raiting);
        candidateService.updateCandidate(candidate);
        return "redirect:/user/vacancy";
    }

}
