package com.demo_bank_v1.repository;

import com.demo_bank_v1.model.Account;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface AccountRepository extends CrudRepository<Account,Integer> {

    @Query(value = "select * from account where user_id= :user_id",nativeQuery = true)
    List<Account> getUserAccountById(@Param("user_id") int user_id);

    @Query(value = "select balance from account where user_id = :user_id",nativeQuery = true)
    BigDecimal getTotalBalanse(@Param("user_id") int user_id);
}
