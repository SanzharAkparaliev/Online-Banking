package com.demo_bank_v1.controller;

import com.demo_bank_v1.helper.HTML;
import com.demo_bank_v1.helper.Token;
import com.demo_bank_v1.mailMessenger.MailMessanger;
import com.demo_bank_v1.model.User;
import com.demo_bank_v1.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.MessagingException;
import javax.validation.Valid;
import java.util.Random;

@Controller
public class RegisterController {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private MailMessanger messanger;

    @GetMapping("/register")
    public ModelAndView getRegister(){
        ModelAndView getRegisterPage = new ModelAndView("register");
        getRegisterPage.addObject("PageTitle","Register");
        return getRegisterPage;
    }

    @PostMapping("/register")
    public ModelAndView register(@Valid @ModelAttribute("registerUser") User user,
                                 BindingResult result,
                                 @RequestParam("first_name") String first_name,
                                 @RequestParam("last_name") String last_name,
                                 @RequestParam("email") String email,
                                 @RequestParam("password") String password,
                                 @RequestParam("confirm_password") String confirm_password
                                 ) throws MessagingException {
        ModelAndView registrationPage = new ModelAndView("register");

        if(result.hasErrors() && confirm_password.isEmpty()){
            registrationPage.addObject("confirm_pass","The confirm field is required");
            return registrationPage;
        }

        //Todo :check for password match:
        if(!password.equals(confirm_password)){
            registrationPage.addObject("passwordMisMatch","password do not match");
            return registrationPage;
        }
        //todo:get token String
        String token = Token.generateToken();

        //todo: generate random code;
        Random random = new Random();
        int bound = 123;
        int code = bound * random.nextInt(bound);

        //todo: get email html body:
        String emailBody = HTML.htmlEmailTemplate(token,code);
        //todo: hash password
        String hashed_password = BCrypt.hashpw(password,BCrypt.gensalt());

        //todo: register user
        userRepository.registerUser(first_name,last_name,email,hashed_password,token,code);

        // TODO: SEND EMAIL NOTIFICATION:
        boolean flag = messanger.sendEmail("Verify Account", emailBody, email);

        //todo: send email notification
        String seccussMessage = "Account Registered Successfully,Please check your Email and Verify Account ";
         registrationPage.addObject("success", seccussMessage);

         return registrationPage;

    }
}
