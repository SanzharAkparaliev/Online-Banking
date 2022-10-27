package com.demo_bank_v1.controller;

import com.demo_bank_v1.helper.Token;
import com.demo_bank_v1.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AuthController {
    @Autowired
    private UserRepository userRepository;

    @GetMapping("/login")
    public ModelAndView getLogin(){
        ModelAndView getLoginPage = new ModelAndView("login");
        String token = Token.generateToken();
        //Send Token to View
        getLoginPage.addObject("token",token);
        getLoginPage.addObject("PageTitle","Login");
        return getLoginPage;
    }

    @PostMapping("/login")
    public String login(@RequestParam("email") String email,
                        @RequestParam("password") String password,
                        @RequestParam("_token")String token, Model model){
        if(email.isEmpty() || email == null || password.isEmpty() || password == null){
            model.addAttribute("error","Username or Password Cannot be Empty");
            return "login";
        }
        String getEmailInDatabase = userRepository.getUserEmail(email);
        if(!getEmailInDatabase.isEmpty() || getEmailInDatabase != null){
            String getPasswordInDatabase = userRepository.getUserPassword(getEmailInDatabase);
            if(!BCrypt.checkpw(password,getPasswordInDatabase)){
                model.addAttribute("error","Incorect Username and password");
                return "login";
            }else {
                model.addAttribute("success","Login Successfully");
                return "login";
            }
        }else {
            model.addAttribute("error","Something went wrong please contact support");
            return "error";
        }

        return "";
    }
}
