package com.demo_bank_v1.controller;

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
@RequestMapping("/transact")
public class TransactController {
    @Autowired
    private AccountRepository accountRepository;

    @PostMapping("/deposit")
    public String deposit(@RequestParam("deposit_amount") String depositAmount,
                          @RequestParam("account_id") String accountId,
                          HttpSession session,
                          RedirectAttributes redirectAttributes){
        if(depositAmount.isEmpty() || accountId.isEmpty()){
            redirectAttributes.addFlashAttribute("error","Deposit Amount or Account Depositing to cannot be Empty");
            return "redirect:/app/dashboard";
        }

        User user = (User)session.getAttribute("user");
        //get current account balance
        int acc_id = Integer.parseInt(accountId);
        double depositAmountValue = Double.parseDouble(depositAmount);

        //check if reposit amount is 0 (zero)
        if(depositAmountValue == 0){
            redirectAttributes.addFlashAttribute("error","Deposit Amount Cannot Be of 0 (Zero) Value");
            return "redirect:/app/dashboard";
        }

        //todo:update balance
        double currentBalance = accountRepository.getAccountBalance(user.getUser_id(), acc_id);
        double newBalance = currentBalance + depositAmountValue;
        //update account
        accountRepository.changeAccountBalanceById(newBalance,acc_id);
        redirectAttributes.addFlashAttribute("success","Amount Deposited Successfully");
        return "redirect:/app/dashboard";
    }
}
