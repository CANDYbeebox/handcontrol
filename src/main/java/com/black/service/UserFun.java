package com.black.service;

import com.black.pojo.UserEntity;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by try on 2017/9/15.
 */
public interface UserFun {
    public UserEntity login(String account,String password) throws Exception;
    public String checkAccount(String account) throws Exception;
    @Transactional
    public void add(UserEntity u);
    @Transactional
    public String findPassword(String email) throws Exception;
    @Transactional
    public String resetPassword(String account,String MysqlPassword,String newPassword,String oldPassword)throws Exception;
}
