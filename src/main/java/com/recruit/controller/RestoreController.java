package com.recruit.controller;


import com.recruit.entity.User;
import com.recruit.service.impl.MailSenderServiceIml;
import com.recruit.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.UUID;

@Controller
public class RestoreController {
    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private MailSenderServiceIml mailSender;

    @GetMapping("/restore")
    public String restorePass(Model model) {
        return "restore";
    }

    @PostMapping("/restore")
    public String sendMessage(@RequestParam("username") String username, Model model) {


        User user = userService.getByUsername(username);

        if (user == null) {
            model.addAttribute("usernameError", "Пользователя с таким email не существует");
            return restorePass(model);
        } else {
            user.setActivationCode(UUID.randomUUID().toString());
            userService.editUser(user);

            String message = String.format("Здравствуйте, %s!\n"
                    + "Вот ваша ссылка на восстановление пароля: " +
                    "http://localhost:8080/restore/%s", user.getUsername(), user.getActivationCode());
            mailSender.sendActivationPage(username, message);
            model.addAttribute("usernameError", "Сообщение отправлено на почту!");
            return restorePass(model);
        }
    }

    @GetMapping("/restore/{code}")
    public String restore(Model model, @PathVariable String code){
        boolean isActivated = userService.activatedUser(code);
        if(isActivated) {
            return "activation";
        }
        else
            return "index";
    }

    @PostMapping("/restore/{code}")
    public String restorePass(@RequestParam("password") String password, @PathVariable String code, Model model) {
        userService.saveActivatedUser(code,password);
        return "index";
    }
}
