package com.demo_bank_v1.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyErrorController implements ErrorController {
    @GetMapping("/error")
    public ModelAndView getError(){
        ModelAndView getErrorPage = new ModelAndView("err");
        getErrorPage.addObject("PageTitle","Errors");
        getErrorPage.addObject("error", "Not Found");
        return getErrorPage;
    }
}
