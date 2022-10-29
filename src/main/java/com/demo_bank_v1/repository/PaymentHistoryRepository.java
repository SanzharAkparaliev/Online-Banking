package com.demo_bank_v1.repository;

import com.demo_bank_v1.model.PaymentHistory;
import jdk.jfr.Registered;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PaymentHistoryRepository extends JpaRepository<PaymentHistory,Integer> {

    @Query(value = "SELECT p.payment_id,a.account_id,u.user_id, p.beneficiary, p.beneficiary_acc_no, p.amount,p.status,p.reference_no,p.reason_code,p.created_at from " +
            "payment p inner join account a on p.account_id = a.account_id INNER JOIN `user` u on a.account_id = u.user_id = :user_id", nativeQuery = true)
    List<PaymentHistory> getPaymentRecordsById(@Param("user_id")int user_id);
}
