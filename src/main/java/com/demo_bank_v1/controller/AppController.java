package com.demo_bank_v1.controller;

import com.demo_bank_v1.model.Account;
import com.demo_bank_v1.model.PaymentHistory;
import com.demo_bank_v1.model.User;
import com.demo_bank_v1.repository.AccountRepository;
import com.demo_bank_v1.repository.PaymentHistoryRepository;
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
    @Autowired
    private PaymentHistoryRepository paymentHistoryRepository;

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

    @GetMapping("/payment_history")
    public ModelAndView getPaymentHistory(HttpSession session){
        // Set View:
        ModelAndView getPaymentHistoryPage = new ModelAndView("paymentHistory");

        // Get Logged In User:\
        User user = (User) session.getAttribute("user");

        // Get Payment History / Records:
        List<PaymentHistory> userPaymentHistory = paymentHistoryRepository.getPaymentRecordsById(user.getUser_id());
        System.out.println(userPaymentHistory.toString());

        getPaymentHistoryPage.addObject("payment_history", userPaymentHistory);

        return getPaymentHistoryPage;

    }
}
