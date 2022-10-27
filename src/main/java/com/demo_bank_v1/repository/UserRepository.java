package com.demo_bank_v1.repository;

import com.demo_bank_v1.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
public interface UserRepository extends JpaRepository<User,Integer> {
    @Modifying
    @Query(value = "INSERT INTO user(first_name, last_name, email, password, token, code) VALUES" +
            "(:first_name, :last_name, :email, :password, :token, :code)", nativeQuery = true )
    @Transactional
    void registerUser(@Param("first_name")String first_name,
                      @Param("last_name") String last_name,
                      @Param("email")String email,
                      @Param("password")String password,
                      @Param("token") String token,
                      @Param("code")int code);

    @Modifying
    @Query(value = "UPDATE user SET token=null, code=null, verify=1, varify_at=NOW(), updated_at=NOW() WHERE " +
            "token= :token AND code= :code", nativeQuery = true)
    @Transactional
    void verifyAccount(@Param("token")String token, @Param("code") String code);

    @Query(value = "select token from user where token= :token",nativeQuery = true)
    String checkToken(@Param("token") String token);

    @Query(value = "select email from user where email = :email",nativeQuery = true)
    String getUserEmail(@Param("email") String email);

    @Query(value = "select password from user where email = :email",nativeQuery = true)
    String getUserPassword(@Param("email") String email);

    @Query(value = "select verify from user where email = :email",nativeQuery = true)
    int isVerified(@Param("email") String email);

    @Query(value = "select * from user where email = :email",nativeQuery = true)
    User getUserDetails(@Param("email") String email);
}
