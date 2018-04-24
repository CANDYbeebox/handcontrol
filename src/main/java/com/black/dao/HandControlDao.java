package com.black.dao;

import com.black.pojo.OptionEntity;

/**
 * Created by try on 2017/11/24.
 */
public interface HandControlDao {

//    设置为自动模式
    void setAuto();
//    设置为手动模式
    void setHand();
    //     设置车为0
    void setBikeZero();
    //    设置车为1
    void setBikeOne();
//    设置狗为0
    void setDogZero();
//    设置狗为1
    void setDogOne();

//    设置门为0（关闭状态）
    void setDoorZero();
//    设置门为1（开启状态）
    void setDoorOne();
//    设置暴力为0
    void setViolentZero();
//    设置暴力为1
    void setViolentOne();
//    查询状态
    OptionEntity  selectOptions();

}
