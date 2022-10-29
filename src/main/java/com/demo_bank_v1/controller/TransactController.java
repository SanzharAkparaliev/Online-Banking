package com.demo_bank_v1.controller;

import com.demo_bank_v1.model.User;
import com.demo_bank_v1.repository.AccountRepository;
import com.demo_bank_v1.repository.PaymentRepository;
import com.demo_bank_v1.repository.TransactRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;

@Controller
@RequestMapping("/transact")
public class TransactController {
    @Autowired
    private AccountRepository accountRepository;
    @Autowired
    private PaymentRepository paymentRepository;

    @Autowired
    private TransactRepository transactRepository;

    double newBalance;
    double currentBalance;
    LocalDateTime currenDateTime = LocalDateTime.now();

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
        currentBalance = accountRepository.getAccountBalance(user.getUser_id(), acc_id);
        newBalance = currentBalance + depositAmountValue;
        //update account
        accountRepository.changeAccountBalanceById(newBalance,acc_id);

        //log Successful Transaction
        transactRepository.logTransaction(acc_id,"deposit",depositAmountValue,"online","success","Deposit Transaction Successful",currenDateTime);

        redirectAttributes.addFlashAttribute("success","Amount Deposited Successfully");
        return "redirect:/app/dashboard";
    }

    @PostMapping("/transfer")
    public String transfer(@RequestParam("transfer_from") String transfer_from,
                           @RequestParam("transfer_to") String transfer_to,
                           @RequestParam("transfer_amount") String transfer_amount,
                           HttpSession session,
                           RedirectAttributes redirectAttributes){
        String errorMessage;
        //check for empty fields
        if(transfer_from.isEmpty() || transfer_to.isEmpty() || transfer_amount.isEmpty()){
            errorMessage = "The account transfering from and to along with the amount be empty";
            redirectAttributes.addFlashAttribute("error",errorMessage);
            return "redirect:/app/dashboard";
        }

        //convert variables
        int transferFromId = Integer.parseInt(transfer_from);
        int transferToId = Integer.parseInt(transfer_to);
        double transferAmount = Double.parseDouble(transfer_amount);

        //check if transfering into the same account
        if(transferFromId == transferToId){
            errorMessage = "Cannot Transfer Into the same Account,Please select the appropriate account to perform transfer";
            redirectAttributes.addFlashAttribute("error",errorMessage);
            return "redirect:/app/dashboard";
        }

        //check for 0 (zero) values;
        if(transferAmount == 0){
            errorMessage = "Cannot Transfer an amount of 0 (Zero) value,please enter a value greater then 0 (Zero)";
            redirectAttributes.addFlashAttribute("error",errorMessage);
            return "redirect:/app/dashboard";
        }



        //get logged in user
        User user = (User)session.getAttribute("user");

        //get current balance
        double currentBalanceOfAccountTransferringFrom = accountRepository.getAccountBalance(user.getUser_id(),transferFromId);

        //check if transfer amount is more than current balance
        if(currentBalanceOfAccountTransferringFrom < transferAmount){
            errorMessage = "You have insufficient Funds to perform this Transfer!";
            //log failed transaction
            transactRepository.logTransaction(transferFromId,"Transfer",transferAmount,"online","filed","Insufficient Funds",currenDateTime);
            redirectAttributes.addFlashAttribute("error",errorMessage);
            return "redirect:/app/dashboard";
        }

        double currentBalanceOfAccountTransferringTo = accountRepository.getAccountBalance(user.getUser_id(),transferToId);

        //set new balance
        double newBalanceOfAccountTransferringFrom = currentBalanceOfAccountTransferringFrom - transferAmount;
         double newBalanceOfAccountTransferringTo = currentBalanceOfAccountTransferringTo + transferAmount;

        //changed the balance of the account transferring from
        accountRepository.changeAccountBalanceById(newBalanceOfAccountTransferringFrom,transferFromId);

        //changed the balance of the Account Transferring to
        accountRepository.changeAccountBalanceById(newBalanceOfAccountTransferringTo,transferToId);

        //log successful Transaction
        transactRepository.logTransaction(transferFromId,"Transfer",transferAmount,"online","success","Transfer Transaction Successful",currenDateTime);

        String successMessage = "Amount Transferred Successfully";

        redirectAttributes.addFlashAttribute("success",successMessage);
        return "redirect:/app/dashboard";
    }

    @PostMapping("/withdraw")
    public String withdraw(@RequestParam("withdrawal_amount") String withdrawalAmount,
                           @RequestParam("account_id") String accountId,
                           HttpSession session,
                           RedirectAttributes redirectAttributes){
        String errorMessage;
        String successMessage;
        //check for empty values;
        if(withdrawalAmount.isEmpty() || accountId.isEmpty()){
            errorMessage = "Withdrawal Amount and Account Withdrawing From Cannot be Empty";
            redirectAttributes.addFlashAttribute("error",errorMessage);
            return "redirect:/app/dashboard";
        }

        //covert variables
        double withdrawal_amount = Double.parseDouble(withdrawalAmount);
        int account_id = Integer.parseInt(accountId);

        //check for 0 (zero) values
        if(withdrawal_amount == 0){
            errorMessage = "Withdrawal Amount Cannot be of 0 (Zero) value,please enter a value greater then 0 (zero)";
            redirectAttributes.addFlashAttribute("error",errorMessage);
            return "redirect:/app/dashboard";
        }

        //get logged in user
        User user = (User) session.getAttribute("user");

        //get current balance
        currentBalance = accountRepository.getAccountBalance(user.getUser_id(), account_id);

        //check if transfer amount is more than current balance
        if(currentBalance < withdrawal_amount){
            errorMessage = "You have insufficient Funds to perform this Transfer!";
            //log failed transaction
            transactRepository.logTransaction(account_id,"Withdrawal",withdrawal_amount,"online","filed","Insufficient Funds",currenDateTime);
            redirectAttributes.addFlashAttribute("error",errorMessage);

            return "redirect:/app/dashboard";
        }
        //get new balance
        newBalance = currentBalance - withdrawal_amount;

        //update account balance
        accountRepository.changeAccountBalanceById(newBalance,account_id);


        //log successful Transaction
        transactRepository.logTransaction(account_id,"Withdrawal",withdrawal_amount,"online","success","Withdrawal Transaction Successful",currenDateTime);

        successMessage = "Withdrawal Successfully";
        redirectAttributes.addFlashAttribute("success",successMessage);
        return "redirect:/app/dashboard";
    }

    @PostMapping("/payment")
    public String payment(@RequestParam("beneficiary")String beneficiary,
                          @RequestParam("account_number")String account_number,
                          @RequestParam("account_id")String account_id,
                          @RequestParam("reference")String reference,
                          @RequestParam("payment_amount")String payment_amount,
                          HttpSession session,
                          RedirectAttributes redirectAttributes){
        //check for empty values
        if(beneficiary.isEmpty() || account_number.isEmpty() || account_id.isEmpty() || payment_amount.isEmpty()){
            String errorMessage = "Beneficiary,Account Number,Account Paying From and Payment Amount Cannot be Empty";
            redirectAttributes.addFlashAttribute("error",errorMessage);
            return "redirect:/app/dashboard";
        }

        //convert variables
        int accountId = Integer.parseInt(account_id);
        double paymentAmount = Double.parseDouble(payment_amount);

        //check for 0 (zero) values
        if(paymentAmount == 0){
            String errorMessage = "Payment Amount Cannot be of 0 (Zero) value,please enter a value greater then 0 (Zero)";
            redirectAttributes.addFlashAttribute("error",errorMessage);
            return "redirect:/app/dashboard";
        }

        //get logged in user
        User user = (User) session.getAttribute("user");

        //get current balance
        currentBalance = accountRepository.getAccountBalance(user.getUser_id(),accountId);

        //check if payment amount is more than current balance
        if(currentBalance < paymentAmount){
            String errorMessage = "You have insufficient Funds to perform this payment";

            String reasonCode= "Could not Processed Payment due to insufficient funds!";
            paymentRepository.makePayment(accountId,beneficiary,account_number,paymentAmount,reference,"filed",reasonCode,currenDateTime);

            //log failed transaction
            transactRepository.logTransaction(accountId,"Payment",paymentAmount,"online","filed","Insufficient Funds",currenDateTime);
            redirectAttributes.addFlashAttribute("error",errorMessage);

            redirectAttributes.addFlashAttribute("error",errorMessage);
            return "redirect:/app/dashboard";
        }

        //set new balance for account paying from
        newBalance = currentBalance - paymentAmount;

        //make payment
        String reasonCode= "Payment Processed Successfully";
        paymentRepository.makePayment(accountId,beneficiary,account_number,paymentAmount,reference,"success",reasonCode,currenDateTime);

        //update account paying from
        accountRepository.changeAccountBalanceById(newBalance,accountId);


        //log successful Transaction
        transactRepository.logTransaction(accountId,"Payment",paymentAmount,"online","success","Payment Transaction Successful",currenDateTime);

        String successMessage = reasonCode;
        redirectAttributes.addFlashAttribute("success",successMessage);
        return "redirect:/app/dashboard";
 }
}
