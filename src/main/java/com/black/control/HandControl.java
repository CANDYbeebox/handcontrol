package com.black.control;

import com.black.service.HandControlFun;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.servlet.http.HttpSession;

/**
 * Created by try on 2017/11/24.
 */
@Controller
public class HandControl {

    @Autowired
    HandControlFun handControlFun;

    @RequestMapping(value ="/autoControl.do")
    public void setAutoControl(){
        handControlFun.setAuto();
    }

    @RequestMapping(value ="/handControl.do")
    public void setHandControl(){
        handControlFun.setHand();
    }

    @RequestMapping(value = "/stateSet.do")
    public void setStates(String signal) {
        handControlFun.setStates(signal);
    }


}
