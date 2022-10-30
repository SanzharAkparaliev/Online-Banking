package com.demo_bank_v1.repository;

import com.demo_bank_v1.model.PaymentHistory;
import com.demo_bank_v1.model.TransactionHistory;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TransactionHistoryRepository extends CrudRepository<TransactionHistory,Integer> {
    @Query(value = "SELECT t.transaction_id,a.account_id,u.user_id, t.transaction_type,t.amount,t.source,t.status,t.reason_code,t.created_at\n" +
            "FROM transaction AS t INNER JOIN account AS a ON t.account_id = a.account_id INNER JOIN user as u ON a.user_id = u.user_id = :user_id", nativeQuery = true)
    List<TransactionHistory> getTransactionRecordsById(@Param("user_id")int user_id);
}
