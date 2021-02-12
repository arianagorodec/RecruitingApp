package com.recruit.controller;

import com.recruit.entity.*;
import com.recruit.service.RaitingService;
import com.recruit.service.impl.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.*;

@Controller
public class WorkerController {
    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private EmployeeServiceImpl employeeService;
    @Autowired
    private CandidateServiceImpl candidateService;
    @Autowired
    private TimetableServiceImpl timetableService;
    @Autowired
    private RaitingServiceImpl raitingService;

    @Value("${upload.path}")
    private  String uploadPath;
    @Value("${upload.pathJ}")
    private  String uploadPathJ;
    @Value("${upload.path.share.employee.resume}")
    private  String uploadPathResume;
    @Value("${upload.path.share.employee.resumeJ}")
    private  String uploadPathResumeJ;


    @GetMapping("/worker")
    public String workerList(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Employee employee = employeeService.getInfoEmployee();
        model.addAttribute("name", employee.getName()+" "+employee.getSurname());
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        model.addAttribute("birthday", format.format(employee.getBirthday()));
        model.addAttribute("mobphone", employee.getMobphone());
        model.addAttribute("email", employee.getEmail());
       model.addAttribute("gender", employee.getGender());
        model.addAttribute("department", employee.getPost().getDepartment());
        model.addAttribute("post", employee.getPost().getPost());
        model.addAttribute("uploadPath",uploadPath);
       model.addAttribute("photo",employee.getPhoto());
        model.addAttribute("facebook",employee.getFacebookLink());
        model.addAttribute("twitter",employee.getTwitterLink());
        model.addAttribute("linked",employee.getLinkedLink());
        return "employee";
    }

    @GetMapping("/worker/diagram")
    public String  diagramEmployee(Model model) {
        List<Employee> employees = employeeService.getAll();
        model.addAttribute("employeeForm", employees);
        List<Candidate> candidates = candidateService.getAll();
        model.addAttribute("candidateForm", candidates);
        return "employee_diagram";
    }
    @GetMapping("/worker/event")
    public String  eventEmployee(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Employee employee = employeeService.getByEmail(auth.getName());

        List<Timetable> timetables = timetableService.getByTypeAndIdEmployee("resume",employee.getId());
        model.addAttribute("resumeForm", timetables);
        List<Timetable> events = timetableService.getByIdEmployee(employee.getId());
        model.addAttribute("eventForm", events);
//        model.addAttribute("dateError", "");
        return "employee_event";
    }

    @GetMapping("/worker/recruiting")
    public String  recruitingEmployee(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Employee employee = employeeService.getByEmail(auth.getName());
        List<Candidate> candidates = candidateService.getByPostVacancy(employee.getPost().getDepartment());
        List<Candidate> candidateList =new ArrayList<>();
        for (Candidate candidate: candidates) {
            for(Vacancy i: candidate.getVacancies()){
                Raiting raiting = raitingService.getByCandidateAndVacancy(candidate,i);
                candidate.setVacancy(i);
                candidate.setRaiting(raiting);
                candidateList.add(candidate);
            }
        }        model.addAttribute("candidateList", candidateList);

        return "employee_recruiting";
    }

    @PostMapping("/worker")
    public String addPhoto(@RequestParam("file") MultipartFile file) throws IOException {
        Employee employee = employeeService.getInfoEmployee();
        if (file != null) {
            File uploadDir = new File(uploadPathJ);
            if(!uploadDir.exists()){
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPathJ+"/"+resultFileName));

            employee.setPhoto(resultFileName);
            employeeService.updateEmployee(employee);
        }
        return "redirect:/worker";
    }

    @PostMapping("/worker/facebook")
    public String addFacebook(@RequestParam("facebookLink") String link) throws IOException {
        Employee employee = employeeService.getInfoEmployee();
        if (link != null) {
            employee.setFacebookLink(link);
            employeeService.updateEmployee(employee);
        }
        return "redirect:/worker";
    }

    @PostMapping("/worker/linked")
    public String addLinked(@RequestParam("linkedLink") String link) throws IOException {
        Employee employee = employeeService.getInfoEmployee();
        if (link != null) {
            employee.setLinkedLink(link);
            employeeService.updateEmployee(employee);
        }
        return "redirect:/worker";
    }

    @PostMapping("/worker/twitter")
    public String addtwitter(@RequestParam("twitterLink") String link) throws IOException {
        Employee employee = employeeService.getInfoEmployee();
        if (link != null) {
            employee.setTwitterLink(link);
            employeeService.updateEmployee(employee);
        }
        return "redirect:/worker";
    }


    @PostMapping("/worker/event")
    public String setEvent(@RequestParam("dateStart") String dateStart,
                           @RequestParam("timeStart") String timeStart,
                           @RequestParam("dateEnd") String dateEnd,
                           @RequestParam("timeEnd") String timeEnd,
                           @RequestParam("type") String type, Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Employee employee = employeeService.getByEmail(auth.getName());
        Timetable timetable = new Timetable();
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm");

        String[] colors = {"#FFDEAD","#ADD8E6","#4fab40", "#DDA0DD"};
        Random random = new Random();
        try {
            String start = dateStart+" "+timeStart;
            String end = dateEnd+" "+timeEnd;
            Date dateS= format.parse(start);
            LocalDateTime timeS = LocalDateTime.parse(start, DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"));
            Date dateE= format.parse(end);
            LocalDateTime timeE = LocalDateTime.parse(end, DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"));
            timetable.setStartDate(dateS);
            timetable.setStartTime(timeS);
            timetable.setEndDate(dateE);
            timetable.setEndTime(timeE);
            timetable.setEmployee(employee);
            timetable.setType(type);
            timetable.setColor(colors[random.nextInt(colors.length)]);
            timetableService.addTimetable(timetable);
        } catch (ParseException|DateTimeParseException e) {
            e.printStackTrace();
            model.addAttribute("dateError", "Неверный ввод даты или времени");
            return "employee_event";
        }
        return "redirect:/worker/event";
    }

    @PostMapping("/worker/recruiting")
    public String addCandidate(@RequestParam("file") MultipartFile file) throws IOException {
//        Employee employee = employeeService.getInfoEmployee();
        if (file != null) {
            File uploadDir = new File(uploadPathResumeJ);
            if(!uploadDir.exists()){
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPathResumeJ+"/"+resultFileName));

//            employee.setPhoto(resultFileName);
//            employeeService.updateEmployee(employee);
        }
        return "redirect:/worker/recruiting";
    }
}
