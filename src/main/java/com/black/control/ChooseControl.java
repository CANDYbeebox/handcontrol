package com.black.control;

import com.black.pojo.ElevatorEntity;
import com.black.service.ChooseFun;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by try on 2017/9/24.
 */
@Controller
public class ChooseControl {
    @Autowired
    private ChooseFun fun;

    @RequestMapping(value ="/searchByLocation.do", produces = "application/json;charset=utf-8")
    @ResponseBody
    public List<ElevatorEntity> searchByLocation(String location) {
        List<ElevatorEntity> responseList=null;
        if(location!=null){
            responseList=fun.searchElevatorCompany(location);
        }
        return responseList ;
    }

    @RequestMapping(value ="/searchDetail.do", produces = "application/json;charset=utf-8")
    @ResponseBody
    public List<ElevatorEntity> searchDetail(String useunit) {
        List<ElevatorEntity> responseList=null;
        if(useunit!=null){
            responseList=fun.searchElevatorDetail(useunit);
        }
        return responseList;
    }

    @RequestMapping(value ="/searchForMap.do", produces = "application/json;charset=utf-8")
    @ResponseBody
    public List<ElevatorEntity> searchForMap(String keyWord) {
        List<ElevatorEntity> responseList=null;
        if(keyWord!=null){
            responseList=fun.searchInfoForMap(keyWord);
        }
        return responseList ;
    }

    @RequestMapping("/camera.do")
    public String test(){
        return "camera";
    }
}
