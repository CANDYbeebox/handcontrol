package com.black.service.Impl;

import com.black.dao.ElevatorDao;
import com.black.dao.UserDao;
import com.black.pojo.ElevatorEntity;
import com.black.pojo.UserEntity;
import com.black.service.ChooseFun;
import com.sun.org.apache.bcel.internal.generic.RETURN;
import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by try on 2017/9/24.
 */
@Service
public class ChooseFunImpl implements ChooseFun {
    @Autowired
    private ElevatorDao eledao;
    @Override
    public List<ElevatorEntity> searchElevatorCompany(String location)  {
        List<ElevatorEntity> companyInformation=eledao.searchByLocation(location);
        List<ElevatorEntity> responseList= new ArrayList<ElevatorEntity>();
        String tempCompany="";
        for (int i = 0; i <companyInformation.size() ; i++) {
            ElevatorEntity e=companyInformation.get(i);
            if(!e.getUseUnit().equals(tempCompany)) {
                responseList.add(e);
                tempCompany = companyInformation.get(i).getUseUnit();
            }
        }
        return responseList;
    }

    @Override
    public List<ElevatorEntity> searchElevatorDetail(String useunit) {
        List<ElevatorEntity> elevatorDetail=eledao.searchDetail(useunit);
        return elevatorDetail;
    }

    @Override
    public List<ElevatorEntity> searchInfoForMap(String keyWord) {
        List<ElevatorEntity> companyInformationByAddress=eledao.searchByLocation(keyWord);
        List<ElevatorEntity> companyInformationByName=eledao.searchByName(keyWord);
        companyInformationByName.removeAll(companyInformationByAddress);
        companyInformationByAddress.addAll(companyInformationByName);
//        for (int i = 0; i <companyInformationByName.size() ; i++) {
//            System.out.println(companyInformationByName.get(i).getUseUnit());
//        }
//        companyInformationByAddress.addAll(companyInformationByName);
        List<ElevatorEntity> responseList= new ArrayList<ElevatorEntity>();
        String tempCompany="";
        for (int i = 0; i <companyInformationByAddress.size() ; i++) {
            ElevatorEntity e=companyInformationByAddress.get(i);
            if(!e.getUseUnit().equals(tempCompany)) {
                responseList.add(e);
                tempCompany = companyInformationByAddress.get(i).getUseUnit();
            }
        }
        return responseList;
    }
}
