package com.black.service.Impl;

import com.black.dao.HandControlDao;
import com.black.service.HandControlFun;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

/**
 * Created by try on 2017/11/24.
 */
@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:spring-context.xml"})
public class HandControlImplTest {

    @Autowired
    HandControlDao handControlDao;

    @Autowired
    HandControlFun handControlFun;

    @Test
    public void setAuto() throws Exception {
        handControlDao.setAuto();

    }

    @Test
    public void setHand() throws Exception {
        handControlDao.setHand();
    }

    @Test
    public void setStates() throws Exception {
//        handControlFun.setStates("bikeZero");
        handControlFun.setStates("doorOne");
//        handControlFun.setStates("doorZero");
//        handControlFun.setStates("violentZero");
//        handControlDao.setBikeOne();


    }
}