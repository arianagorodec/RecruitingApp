package com.recruit.controller;

import com.recruit.entity.*;
import com.recruit.entity.enums.LanguageLevel;
import com.recruit.entity.enums.RoleEnum;
import com.recruit.model.AnalyzeCandidates;
import com.recruit.service.RaitingService;
import com.recruit.service.impl.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.*;

@Controller
public class HrController {
    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private EmployeeServiceImpl employeeService;
    @Autowired
    private CandidateServiceImpl candidateService;
    @Autowired
    private TimetableServiceImpl timetableService;
    @Autowired
    private ChatMessageServiceImpl chatMessageService;
    @Autowired
    private AnketaServiceImpl anketaService;
    @Autowired
    private RaitingServiceImpl raitingService;
    @Autowired
    private VacancyServiceImpl vacancyService;
    @Autowired
    private OrganizationStructureServiceImpl organizationStructureService;
    @Autowired
    private MailSenderServiceIml mailSender;


    @Value("${upload.path}")
    private  String uploadPath;
    @Value("${upload.pathJ}")
    private  String uploadPathJ;


    @GetMapping("/hr")
    public String hrList(Model model) {
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
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String ipAddress ="";
        Object details =
                SecurityContextHolder.getContext().getAuthentication().getDetails();
        if (details instanceof WebAuthenticationDetails) {
            ipAddress = ((WebAuthenticationDetails) details).getRemoteAddress();
        }
        return "hr";
    }

    @GetMapping("/hr/assesment")
    public String  assesmentHR(Model model) {
        List<Candidate> candidates = candidateService.getAll();
        List<Candidate> candidateList =new ArrayList<>();
        for (Candidate candidate: candidates) {
            for(Vacancy i: candidate.getVacancies()){
                Candidate newCandidate = new Candidate(candidate);
                Raiting raiting = raitingService.getByCandidateAndVacancy(candidate,i);
                newCandidate.setVacancy(i);
                newCandidate.setRaiting(raiting);
                candidateList.add(newCandidate);
            }
        }
        model.addAttribute("candidateList", candidateList);
        return "hr_assesment";
    }
    @GetMapping("/hr/diagram")
    public String  diagramEmployee(Model model) {
        List<Employee> employees = employeeService.getAll();
        model.addAttribute("employeeForm", employees);
        List<Candidate> candidates = candidateService.getAll();
        model.addAttribute("candidateForm", candidates);
        return "hr_diagram";
    }
    @GetMapping("/hr/event")
    public String  eventHR(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Employee employee = employeeService.getByEmail(auth.getName());
        List<Timetable> events = timetableService.getByIdEmployee(employee.getId());
        model.addAttribute("eventForm", events);
        return "hr_event";
    }

    @GetMapping("/hr/interviewer")
    public String  interviewerHR(Model model) {
        List<Timetable> timetables = timetableService.getByType("resume");
        List<Vacancy> vacancyList = vacancyService.getAll();
        model.addAttribute("resumeForm", timetables);
        model.addAttribute("vacancyList", vacancyList);
        return "hr_interviewer";
    }

    @GetMapping("/hr/vacancy")
    public String  vacancyHR(Model model) {
        List<OrganizationStructure> organizationStructureList = organizationStructureService.getAll();
        model.addAttribute("postList", organizationStructureList);
        List<Vacancy> vacancyList = vacancyService.getAll();
        model.addAttribute("vacancyList", vacancyList);
        return "hr_vacancy";
    }

    @GetMapping("/hr/profile")
    public String  profileHR(Model model) {
        List<Employee> employees = employeeService.getAll();
        model.addAttribute("employeeForm", employees);
        List<Candidate> candidates = candidateService.getAll();
        model.addAttribute("candidateForm", candidates);

        return "hr_profile";
    }


    @GetMapping("/hr/statistics")
    public String  statisticsHR(Model model) {
        List<Anketa> anketaList = anketaService.getAll();
        List<Employee> employeeList = employeeService.getAll();
        if(anketaList!=null) {
            Double[] question4 = anketaService.question4Percent(anketaList);
            Double[] question5 = anketaService.question5Percent(anketaList);
            Double[] question1 = anketaService.question1Percent(anketaList);
            Double[] question2 = anketaService.question2Percent(anketaList);
            model.addAttribute("question4Perfect", question4[0]);
            model.addAttribute("question4Good", question4[1]);
            model.addAttribute("question4Ok", question4[2]);
            model.addAttribute("question4Bad", question4[3]);
            model.addAttribute("question5Hour", question5[0]);
            model.addAttribute("question5Day", question5[1]);
            model.addAttribute("question5Week", question5[2]);
            model.addAttribute("question5Year", question5[3]);
            model.addAttribute("question1Yes", question1[0]);
            model.addAttribute("question1No", question1[1]);
            model.addAttribute("question2Yes", question2[0]);
            model.addAttribute("question2No", question2[1]);
        }
        Double[] gender = employeeService.genderPercent(employeeList);
        model.addAttribute("woman", gender[0]);
        model.addAttribute("man", gender[1]);
        Double[] age = employeeService.getAgeGroup(employeeList);
        model.addAttribute("aTwenty", age[0]);
        model.addAttribute("twenty45", age[1]);
        model.addAttribute("old45", age[2]);

        return "hr_statistics";
    }

    @GetMapping("/hr/message")
    public String  message(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Employee employee = employeeService.getByEmail(auth.getName());
        List<Candidate> candidates = candidateService.getByHREmail(employee.getEmail());
        model.addAttribute("candidate",null);
        model.addAttribute("candidates", candidates);
        model.addAttribute("code", 0);
        model.addAttribute("username", employee.getUser().getUsername());
        model.addAttribute("to",  "");
        List<ChatMessage> messagesList = null;
        model.addAttribute("list",  messagesList);
        return "hr_message";
    }

    @GetMapping("/hr/message-{code}")
    public String  messageHR(Model model, @PathVariable String code) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Employee employee = employeeService.getByEmail(auth.getName());
        List<Candidate> candidates = candidateService.getByHREmail(employee.getEmail());
        model.addAttribute("candidates", candidates);
        Candidate candidate = candidateService.getBySessionCode(code);
        model.addAttribute("photo",candidate.getPhoto());
        model.addAttribute("candidate",candidate.getName()+" "+candidate.getSurname());
        model.addAttribute("code",code);
        model.addAttribute("username", employee.getUser().getUsername());
        model.addAttribute("to",  candidate.getEmail());
        List<ChatMessage> messagesList = chatMessageService.getByToTwice(employee.getUser().getId(), candidate.getUser().getId());
        Comparator<ChatMessage> comparator = new Comparator<ChatMessage>() {
            @Override
            public int compare(ChatMessage left, ChatMessage right) {
                return (int) (left.getId() - right.getId());
            }
        };
        messagesList.sort(comparator);
        model.addAttribute("list",  messagesList);
        return "hr_message";
    }

//    @GetMapping("/hr/test")
//    public String  testCreater(Model model) {
//        List<Vacancy> vacancyList = vacancyService.getAll();
//        Test test = null;
//        model.addAttribute("test", test);
//        model.addAttribute("vacancyList", vacancyList);
//        return "hr_test";
//    }

    @GetMapping("/hr/analysis")
    public String  analysisCandidates(Model model) {
        List<Vacancy> vacancyList = vacancyService.getAll();
//        Test test = null;
//        model.addAttribute("result", result);
        model.addAttribute("vacancyList", vacancyList);
        return "hr_analysis";
    }

    @PostMapping("/hr")
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
        return "redirect:/hr";
    }

    @PostMapping("/hr/facebook")
    public String addFacebook(@RequestParam("facebookLink") String link) throws IOException {
        Employee employee = employeeService.getInfoEmployee();
        if (link != null) {
            employee.setFacebookLink(link);
            employeeService.updateEmployee(employee);
        }
        return "redirect:/hr";
    }

    @PostMapping("/hr/linked")
    public String addLinked(@RequestParam("linkedLink") String link) throws IOException {
        Employee employee = employeeService.getInfoEmployee();
        if (link != null) {
            employee.setLinkedLink(link);
            employeeService.updateEmployee(employee);
        }
        return "redirect:/hr";
    }

    @PostMapping("/hr/twitter")
    public String addtwitter(@RequestParam("twitterLink") String link) throws IOException {
        Employee employee = employeeService.getInfoEmployee();
        if (link != null) {
            employee.setTwitterLink(link);
            employeeService.updateEmployee(employee);
        }
        return "redirect:/hr";
    }


    @PostMapping("/hr/vacancy/delete")
    public String deleteVacancy(@RequestParam("id") long id) {
        List<Candidate> candidateList = candidateService.getAll();
        for (Candidate candidate : candidateList) {
            Set<Vacancy> vacancies = candidate.getVacancies();
            if(vacancies!=null) {
                for (Vacancy vacancy : vacancies) {
                    if (vacancy.getId() == id) {
                        candidate.getVacancies().remove(vacancy);
                        break;
                    }
                }
                candidateService.updateCandidate(candidate);
            }
        }
        raitingService.deleteByIdVacancy(id);
        timetableService.deleteByIdVacancy(id);
        vacancyService.deleteById(id);
        return "redirect:/hr/vacancy";
    }

    @PostMapping("/hr/interviewer/delete")
    public String deleteInterview(@RequestParam("id") long id) {
        timetableService.deleteById(id);
        return "redirect:/hr/interviewer";
    }

    @PostMapping("/hr/interviewer/edit")
    public String setInterview(@RequestParam("id") long id,
                               @RequestParam("EmailE") String mailE,
                               @RequestParam("EmailC") String mailC,
                               @RequestParam("startedOn") String timeStart,
                               @RequestParam("dob") String dateStart) {
        Employee employee = employeeService.getByEmail(mailE);
        Candidate candidate = candidateService.getByEmail(mailC);
        Timetable timetable = new Timetable();
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm");

        try {
            timetable.setId(id);
            String start = dateStart+" "+timeStart;
            String end = dateStart+" "+timeStart;
            Date dateS= format.parse(start);
            LocalDateTime timeS = LocalDateTime.parse(start, DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"));
            Date dateE= format.parse(end);
            LocalDateTime timeE = LocalDateTime.parse(end, DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"));
            timetable.setStartDate(dateS);
            timetable.setStartTime(timeS);
            timetable.setEndDate(dateE);
            timetable.setEndTime(timeE);
            timetable.setEmployee(employee);
            timetable.setCandidate(candidate);
            timetable.setType("resume");
            timetable.setColor("#FFDEAD");
            timetableService.editTimetable(timetable);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return "redirect:/hr/interviewer";
    }

    @PostMapping("/hr/interviewer/add")
    public String setInterview(@RequestParam("EmailE") String mailE,
                               @RequestParam("EmailC") String mailC,
                               @RequestParam("startedOn") String timeStart,
                               @RequestParam("dob") String dateStart,
                               @RequestParam("vacancy") long id_vacancy) {
        Employee employee = employeeService.getByEmail(mailE);
        Candidate candidate = candidateService.getByEmail(mailC);
        Vacancy vacancy = vacancyService.getById(id_vacancy);
        Timetable timetable = new Timetable();
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm");

        try {
            String start = dateStart+" "+timeStart;
            String end = dateStart+" "+timeStart;
            Date dateS= format.parse(start);
            LocalDateTime timeS = LocalDateTime.parse(start, DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"));
            Date dateE= format.parse(end);
            LocalDateTime timeE = LocalDateTime.parse(end, DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"));
            timetable.setStartDate(dateS);
            timetable.setStartTime(timeS);
            timetable.setEndDate(dateE);
            timetable.setEndTime(timeE);
            timetable.setEmployee(employee);
            timetable.setCandidate(candidate);
            timetable.setType("resume");
            timetable.setColor("#FFDEAD");
            timetable.setVacancy(vacancy);
            timetableService.addTimetable(timetable);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return "redirect:/hr/interviewer";
    }

    @PostMapping("/hr/vacancy/edit")
    public String setVacancy(@RequestParam("id") long id,
                             @RequestParam("nameVacancy") String nameVacancy,
                             @RequestParam("department") String department,
                             @RequestParam("post") String post,
                             @RequestParam("link") String link,
                             @RequestParam("description") String description){
       Vacancy vacancy = new Vacancy();
       vacancy.setId(id);
       vacancy.setName(nameVacancy);
        OrganizationStructure organizationStructure = organizationStructureService.getByDepartmentAndPost(department,post);
        if(organizationStructure==null){
            organizationStructure.setDepartment(department);
            organizationStructure.setPost(post);
            organizationStructureService.addOrganizationStructure(organizationStructure);
        }
        vacancy.setPost(organizationStructureService.getByDepartmentAndPost(department,post));
       vacancy.setTestLink(link);
       vacancy.setDescription(description);
       vacancyService.editVacancy(vacancy);
        return "redirect:/hr/vacancy";
    }

    @PostMapping("/hr/vacancy/add")
    public String setVacancy(@RequestParam("nameVacancy") String nameVacancy,
                             @RequestParam("department") String department,
                             @RequestParam("post") String post,
                             @RequestParam("link") String link,
                             @RequestParam("pass_score") Double pass_score,
                             @RequestParam("language_level") LanguageLevel language_level,
                             @RequestParam("description") String description) {
        Vacancy vacancy = new Vacancy();
        vacancy.setName(nameVacancy);
        OrganizationStructure organizationStructure = organizationStructureService.getByDepartmentAndPost(department,post);
        if(organizationStructure==null){
            organizationStructure.setDepartment(department);
            organizationStructure.setPost(post);
            organizationStructureService.addOrganizationStructure(organizationStructure);
        }
        vacancy.setPost(organizationStructureService.getByDepartmentAndPost(department,post));
        vacancy.setTestLink(link);
        vacancy.setPass_score(pass_score);
        vacancy.setDescription(description);
        vacancy.setLanguage_level(language_level);
        vacancyService.addVacancy(vacancy);

        return "redirect:/hr/vacancy";
    }

    @PostMapping("/hr/assesment/save")
    public String setAssesment(@RequestParam("id") long id,
                               @RequestParam("vacancy") String nameVacancy,
                             @RequestParam("testScope") double testScope,
                             @RequestParam("langScope") LanguageLevel langScope,
                             @RequestParam("socialScope") double socialScope,
                             @RequestParam("techScope") double techScope){
        Candidate candidate = candidateService.getById(id);
        for (Vacancy vacancy: candidate.getVacancies()){
            if(vacancy.getName().equals(nameVacancy)){
                Raiting raiting = raitingService.getByCandidateAndVacancy(candidate,vacancy);
                if(raiting==null)
                    raiting = new Raiting();
                raiting.setLangScope(langScope);
                raiting.setSocialScope(socialScope);
                raiting.setTestScope(testScope);
                raiting.setTechScope(techScope);
                raiting.setCandidate(candidate);
                raiting.setVacancy(vacancy);
                raitingService.editRaiting(raiting);
            }
        }
        return "redirect:/hr/assesment";
    }

    @PostMapping("/hr/event")
    public String setEvent(@RequestParam("dateStart") String dateStart,
                           @RequestParam("timeStart") String timeStart,
                           @RequestParam("dateEnd") String dateEnd,
                           @RequestParam("timeEnd") String timeEnd,
                           @RequestParam("type") String type,
                           Model model) {
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
        } catch (ParseException| DateTimeParseException e) {
            e.printStackTrace();
            model.addAttribute("dateError", "Неверный ввод даты или времени");
            return "hr_event";
        }
        return "redirect:/hr/event";
    }

    @PostMapping("/hr/profile/employee")
    public String setWorkEmployee(@RequestParam("email") String email){ //, @RequestParam("numCert") String numCert
        if(email!=null) {
            Employee employee = employeeService.getByEmail(email);
            if(employee.getIsWorking()==1)
                employee.setIsWorking(0);
            else
                employee.setIsWorking(1);
            employeeService.editEmployee(employee);
        }
        return "redirect:/hr/profile";
    }
    @PostMapping("/hr/profile/candidate")
    public String setWorkCandidate(@RequestParam("email") String email){ //, @RequestParam("numCert") String numCert
        if(email!=null) {
            Candidate candidate = candidateService.getByEmail(email);

            User user = userService.getByUsername(email);
            if(user!=null) {
                user.setActivationCode(UUID.randomUUID().toString());
                userService.editUser(user);

                String message = String.format("Здравствуйте, %s!\n"
                        + "Поздравляем! Вас приняли на работу!"
                        + "Вот ваша ссылка на заполнение данных: " +
                        "http://localhost:8080/inf/%s", user.getUsername(), user.getActivationCode());
                mailSender.sendActivationPage(email, message);
            }
            //employeeService.editEmployee(employee);
            Employee employee = new Employee();
            employee.setEmail(candidate.getEmail());
            employee.setName(candidate.getName());
            employee.setSurname(candidate.getSurname());
            employee.setBirthday(candidate.getBirthday());
            employee.setGender(candidate.getGender());
            employee.setIsWorking(1);
            employee.setMobphone(candidate.getMobphone());
            employee.setUser(candidate.getUser());
            employee.setPhoto(candidate.getPhoto());
            employeeService.addEmployee(employee);
            user.setRole(RoleEnum.ROLE_WORKER);
            userService.editUser(user);
            candidateService.deleteById(candidate.getId());
        }
        return "redirect:/hr/profile";
    }

//    @PostMapping("/hr/test/select_vacancy")
//    public String  testCreaterSelectVAcancy(@RequestParam("vacancy") long id_vacancy,
//                                            Model model){
//        Test test = testService.getByIdVacancy(id_vacancy);
//        List<Vacancy> vacancyList = vacancyService.getAll();
//        model.addAttribute("test", test);
//        model.addAttribute("vacancyList", vacancyList);
//        return "redirect:/hr/test";
//    }

//    @PostMapping("/hr/test")
//    public String  testCreaterSelectVAcancy(@RequestParam("vacancy") long id_vacancy,
//                                            Model model){
//        Test test = testService.getByIdVacancy(id_vacancy);
//        List<Vacancy> vacancyList = vacancyService.getAll();
//        model.addAttribute("test", test);
//        model.addAttribute("vacancyList", vacancyList);
//        return "redirect:/hr/test";
//    }

        @PostMapping("/hr/analysis")
    public String  analyzeCandidates(@RequestParam("vacancy") long id_vacancy,
                                     @RequestParam("c_test") double c_test,
                                     @RequestParam("c_lang") double c_lang,
                                     @RequestParam("c_softSkills") double c_softSkills,
                                     @RequestParam("c_tech") double c_tech,
                                     @RequestParam("countCandidate") int countCandidate,
                                     Model model) {
            List<Vacancy> vacancyList = vacancyService.getAll();
            List<Candidate> allCandidatesList = candidateService.getByVacancy(id_vacancy);
//            Test test = testService.getByIdVacancy(id_vacancy);
            Vacancy vacancy = vacancyService.getById(id_vacancy);

            List<Candidate> firstStepList = new AnalyzeCandidates().firstStepAnalyze(vacancy, allCandidatesList);
            List<Candidate> secondStepList = new AnalyzeCandidates().secondStepAnalyze(firstStepList, vacancy);
            List<Candidate> thirdStepList = new AnalyzeCandidates().thirdStepAnalyze(secondStepList, c_test, c_lang, c_softSkills, c_tech, countCandidate);


            model.addAttribute("vacancyList", vacancyList);
            model.addAttribute("firstStepList", firstStepList);
            model.addAttribute("secondStepList", secondStepList);
            model.addAttribute("thirdStepList", thirdStepList);
            model.addAttribute("c_test", c_test);
            model.addAttribute("c_lang", c_lang);
            model.addAttribute("c_softSkills", c_softSkills);
            model.addAttribute("c_tech", c_tech);
            model.addAttribute("countCandidate", countCandidate);

            return "hr_analysis";
        }
}
