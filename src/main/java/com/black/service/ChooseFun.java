package com.black.service;

import com.black.pojo.ElevatorEntity;
import com.black.pojo.UserEntity;

import java.util.List;

/**
 * Created by try on 2017/9/24.
 */
public interface ChooseFun {
    public List<ElevatorEntity> searchElevatorCompany(String location) ;
    public List<ElevatorEntity> searchElevatorDetail(String useunit) ;
    public List<ElevatorEntity> searchInfoForMap(String keyWord) ;
}
