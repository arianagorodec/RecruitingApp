package com.recruit.controller;

import com.recruit.entity.User;
import com.recruit.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@Controller
public class RegistrationController {

    @Autowired
    private UserServiceImpl userService;




    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(@ModelAttribute("userForm") @Valid User userForm, BindingResult bindingResult, Model model) {
        boolean ch = true;
        if (bindingResult.hasErrors()) {
            return "registration";
        }
        if(userForm.getName().equals("")) {
            model.addAttribute("nameError", "Заполните имя");
            ch=false;
        }

        if(userForm.getSurname().equals("")) {
            model.addAttribute("surnameError", "Заполните фамилию");
            ch=false;
        }
        if(userForm.getMobphone().equals("")) {
            model.addAttribute("mobphoneError", "Заполните мобильный телефон");
            ch=false;
        }
        if(userForm.getBirthday().equals("")||userForm.getBirthday()==null) {
            model.addAttribute("birthdayError", "Заполните дату рождения");
            ch=false;
        }

        if(userForm.getGender()==null) {
            model.addAttribute("genderError", "Заполните пол");
            ch=false;
        }

        if (!userForm.getPassword().equals(userForm.getPasswordConfirm())){
            model.addAttribute("passwordError", "Пароли не совпадают");
            ch=false;
        }

        if(userForm.getPassword().equals("")||userForm.getPasswordConfirm().equals("")) {
            model.addAttribute("passwordError", "Заполните пароль");
            ch=false;
        }

        if (userForm.getUsername().equals("")){
            model.addAttribute("usernameError", "Заполните email");
            ch=false;
        }

//        System.out.println(userForm.getBirthday());
        if (!userService.saveUser(userForm)){
            model.addAttribute("usernameError", "Пользователь с таким именем уже существует");
            ch=false;
        }
        if(ch)
            return "redirect:/";
        else
            return "registration";
    }
}
