package com.black.dao;

import com.black.pojo.ElevatorEntity;
import com.black.pojo.UserEntity;

import java.util.List;

/**
 * Created by try on 2017/9/24.
 */
public interface ElevatorDao {
    public List<ElevatorEntity> searchByLocation(String location);
    public List<ElevatorEntity> searchDetail(String useunit);
    public List<ElevatorEntity> searchByName(String keyword);

}
