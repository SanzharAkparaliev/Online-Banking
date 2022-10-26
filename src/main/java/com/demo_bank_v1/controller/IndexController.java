package com.demo_bank_v1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

    @GetMapping("/")
    public ModelAndView getIndex(){
        ModelAndView getIndexPage = new ModelAndView("index");
        getIndexPage.addObject("PageTitle","Home");
        return getIndexPage;
    }

    @GetMapping("/login")
    public ModelAndView getLogin(){
        ModelAndView getLoginPage = new ModelAndView("login");
        getLoginPage.addObject("PageTitle","Login");
        return getLoginPage;
    }


    @GetMapping("/error")
    public ModelAndView getError(){
        ModelAndView getErrorPage = new ModelAndView("error");
        getErrorPage.addObject("PageTitle","Errors");
        return getErrorPage;
    }

    @GetMapping("/verify")
    public ModelAndView getVerify(){
        ModelAndView getVerifyPage = new ModelAndView("login");
        getVerifyPage.addObject("PageTitle","Errors");
        return getVerifyPage;
    }
}
