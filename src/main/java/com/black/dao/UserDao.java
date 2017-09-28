package com.black.dao;

import com.black.pojo.UserEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by try on 2017/9/15.
 */
public interface UserDao {
    public UserEntity select(String account);
    public void insert(UserEntity u);
    public List<UserEntity> selectByEmail(String email);
    public void update(@Param("email") String email, @Param("password")String password);
    public void resetPassword(@Param("account")String account,@Param("password")String password);
}

