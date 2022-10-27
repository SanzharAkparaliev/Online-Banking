package com.demo_bank_v1.controller;

import com.demo_bank_v1.model.Account;
import com.demo_bank_v1.model.User;
import com.demo_bank_v1.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/app")
public class AppController {
    @Autowired
    private AccountRepository accountRepository;

    @GetMapping("/dashboard")
    public ModelAndView getDashboardPage(HttpSession session){
        ModelAndView getDashboardPage = new ModelAndView("dashboard");
        User user = (User) session.getAttribute("user");

        List<Account> getUserAccounts = accountRepository.getUserAccountById(user.getUser_id());
        BigDecimal totalAccountBalance = accountRepository.getTotalBalanse(user.getUser_id());

        getDashboardPage.addObject("userAccounts",getUserAccounts);
        getDashboardPage.addObject("totalBalance",totalAccountBalance);

        return getDashboardPage;
    }
}
