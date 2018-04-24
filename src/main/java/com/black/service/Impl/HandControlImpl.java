package com.black.service.Impl;

import com.black.dao.HandControlDao;
import com.black.service.HandControlFun;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by try on 2017/11/24.
 */
@Service
public class HandControlImpl implements HandControlFun{

    @Autowired
    private HandControlDao handControlDao;

    @Override
    public void setAuto() {
        handControlDao.setAuto();
    }

    @Override
    public void setHand() {
        handControlDao.setHand();

    }

    @Override
    public void setStates(String signal) {
        if (signal == null) {
            throw new RuntimeException("信号为空");
        }
        switch (signal) {
            case "bikeZero" : handControlDao.setBikeZero();break;
            case "bikeOne" : handControlDao.setBikeOne();break;
            case "dogZero" : handControlDao.setDogZero();break;
            case "dogOne" : handControlDao.setDogOne();break;
            case "doorZero" : handControlDao.setDoorZero();break;
            case "doorOne" : handControlDao.setDoorOne();break;
            case "violentZero" : handControlDao.setViolentZero();break;
            case "violentOne" : handControlDao.setViolentOne();break;
            default:break;
        }
    }
}
