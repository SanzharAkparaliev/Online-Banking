package com.demo_bank_v1.controller;

import com.demo_bank_v1.helper.GenAccountNumber;
import com.demo_bank_v1.model.User;
import com.demo_bank_v1.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/account")
public class AccountController {
    @Autowired
    private AccountRepository accountRepository;

    @PostMapping("/creating_account")
    public String createAccount(@RequestParam("account_name") String accountName,
                                @RequestParam("account_type") String accountType,
                                RedirectAttributes redirectAttributes,
                                HttpSession session){
        if(accountName.isEmpty() || accountType.isEmpty() ){
            redirectAttributes.addFlashAttribute("error","Account Name and Type Cannot be Empty");
            return "redirect:/app/dashboard";
        }

        User user = (User)session.getAttribute("user");
        int setAccountNumber = GenAccountNumber.generateAccountNumber();
        String bankAccountNumber = Integer.toString(setAccountNumber);

        //create account
        accountRepository.createBankAccount(user.getUser_id(), bankAccountNumber,accountName,accountType);

        redirectAttributes.addFlashAttribute("success","Account Created Successfully");
        return "redirect:/app/dashboard";
    }
}
