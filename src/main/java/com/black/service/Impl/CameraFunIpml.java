package com.black.service.Impl;

import com.black.dao.CameroDao;
import com.black.pojo.OptionEntity;
import com.black.service.CameraFun;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by try on 2017/9/28.
 */
@Service
public class CameraFunIpml implements CameraFun {
    @Autowired
    private CameroDao Cdao;

    @Override
    public OptionEntity searchOportions() throws Exception {
        OptionEntity res=Cdao.selectOptions();
        if(res==null)
            throw new Exception("数据库为空");
        return  res;
    }
}
