package com.demo_bank_v1.controller;

import com.demo_bank_v1.helper.Token;
import com.demo_bank_v1.model.User;
import com.demo_bank_v1.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

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
                        @RequestParam("_token")String token,
                        Model model,
                        HttpSession httpSession){
        if(email.isEmpty() || email == null || password.isEmpty() || password == null){
            model.addAttribute("error","Username or Password Cannot be Empty");
            return "login";
        }
        String getEmailInDatabase = userRepository.getUserEmail(email);
        if(getEmailInDatabase != null){
            String getPasswordInDatabase = userRepository.getUserPassword(getEmailInDatabase);
            if(!BCrypt.checkpw(password,getPasswordInDatabase)){
                model.addAttribute("error","Incorect Username and password");
                return "login";
            }
        }else {
            model.addAttribute("error","Something went wrong please contact support");
            return "error";
        }

        int verified = userRepository.isVerified(getEmailInDatabase);
        if(verified != 1){
            String msg = "This Account is not yet Verified,please check email and verify account";
            model.addAttribute("error",msg);
            return "login";
        }

        User user = userRepository.getUserDetails(getEmailInDatabase);

        httpSession.setAttribute("user",user);
        httpSession.setAttribute("token",token);
        httpSession.setAttribute("authenticated",true);

        return "redirect:/app/dashboard";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes redirectAttributes){
        session.invalidate();
        redirectAttributes.addFlashAttribute("logged_out","Logged out successfully");
        return "redirect:/login";
    }
}
