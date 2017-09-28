package com.black.control;

import com.black.common.md5_class;
import com.black.pojo.UserEntity;
import com.black.service.UserFun;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by try on 2017/9/15.
 */
@Controller
public class LoginControl {
    @Autowired
    private UserFun fun;

    @RequestMapping(value ="/login.do", produces = "application/text;charset=utf-8")
    @ResponseBody
    public String login(String account, String password, HttpSession session){
        String str_ResponseText=null;
        try {
            UserEntity u=fun.login(account,password);
            if(u!=null){
                str_ResponseText="正确";
                session.setAttribute("user",u);
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
            System.out.println("登陆失败");
            str_ResponseText="错误";
        }
        return str_ResponseText;
    }

    @RequestMapping(value ="/check_username.do", produces = "application/text;charset=utf-8")
    @ResponseBody
    public String checkAccount(String account, HttpServletRequest request, HttpServletResponse response ){
        String str_IsExisted=null;
        try {
            if(fun.checkAccount(account).equals("账户ok")) {
                str_IsExisted = "ok";
            }
        }
        catch (Exception e){
            System.out.println(e.getMessage());
            str_IsExisted="重复";
        }
        return  str_IsExisted;
    }

    @RequestMapping(value ="/register.do", produces = "application/text;charset=utf-8")
    @ResponseBody
    public String register(String register_mail,String username_register,String password_register) {
        String str_ResponseText;
        UserEntity u=new UserEntity();
        u.setAccount(username_register);
        u.setEmail(register_mail);
        u.setPassword(md5_class.MD5(password_register));
        fun.add(u);
        str_ResponseText="ok";
        System.out.println(register_mail);
        return str_ResponseText;
    }

    @RequestMapping(value ="/findPassword.do", produces = "application/text;charset=utf-8")
    @ResponseBody
    public String findPassword(String email) {
        String str_ResponseFlag;
        System.out.println(email);
        try {
            String a=fun.findPassword(email);
            str_ResponseFlag="已成功";
        }
        catch (Exception e){
            System.out.println(e.getMessage());
            str_ResponseFlag="无该邮箱";
        }
        return str_ResponseFlag;

    }

    @RequestMapping(value ="/resetPassword.do", produces = "application/text;charset=utf-8")
    @ResponseBody
    public String resetPassword(String newPassword,String oldPassword,HttpSession session) {
        String str_ResponseFlag=null;
        UserEntity u=(UserEntity)session.getAttribute("user");
        try {
            str_ResponseFlag=fun.resetPassword(u.getAccount(),u.getPassword(),newPassword,oldPassword);
        }
        catch (Exception e){
            System.out.println(e.getMessage());
            str_ResponseFlag="错误";
        }
        return str_ResponseFlag;
    }

    @RequestMapping(value ="/outLogin.do")
    public String outLogin(HttpSession session){
        session.invalidate();
        return "redirect:/entrance.jsp";
//       return "redirect:/choose.do";
    }

    @RequestMapping("/choose.do")
    public String test(){
        return "choose";
    }

}
