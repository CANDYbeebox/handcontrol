package com.black.service.Impl;

import com.black.common.SendEmail;
import com.black.common.md5_class;
import com.black.dao.UserDao;
import com.black.pojo.UserEntity;
import com.black.service.UserFun;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by try on 2017/9/15.
 */
@Service
public class UserFunImpl implements UserFun {
    @Autowired
    private UserDao udao;

    @Override
    public UserEntity login(String account, String password) throws Exception {
        password= md5_class.MD5(password);
        UserEntity u=udao.select(account);
        if(u==null){
            throw new Exception("账号不存在");
        }
        else if(!u.getPassword().equals(password)){
            throw new Exception("密码错误");
        }
        return u;
    }

    @Override
    public String checkAccount(String account) throws Exception {
        UserEntity u=udao.select(account);
        if(u!=null) {
            System.out.println("不空");
            throw new Exception("账户重复");
        }
        return "账户ok";
    }

    @Override
    public void add(UserEntity u) {
        udao.insert(u);
    }

    @Override
    public String findPassword(String email) throws Exception {
        System.out.println(email);
        //随机生成密码
        String str_NewRandom= RandomStringUtils.randomAlphanumeric(10);
        String str_NewPassword= md5_class.MD5(md5_class.MD5(str_NewRandom));
        List<UserEntity> userList=udao.selectByEmail(email);
        if(userList==null||userList.isEmpty())
            throw new Exception("不存在");
        udao.update(email,str_NewPassword);
        for(int i=0;i<userList.size();i++)
        {
            UserEntity user = userList.get(i);
            SendEmail.sendEmail(email,user.getAccount(),str_NewRandom);
        }
        return "ok";
    }

    @Override
    public String resetPassword(String account, String MysqlPassword,String newPassword, String oldPassword) throws Exception {
        newPassword=md5_class.MD5(newPassword);
        oldPassword=md5_class.MD5(oldPassword);
        if(!oldPassword.equals(MysqlPassword))
            throw new Exception("输入的原密码与数据库不匹配");
        else
            udao.resetPassword(account,newPassword);
        return "正确";
    }
}
