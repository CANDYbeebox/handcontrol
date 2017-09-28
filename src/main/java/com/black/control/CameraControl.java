package com.black.control;

import com.black.common.txtaction;
import com.black.pojo.OptionEntity;
import com.black.service.CameraFun;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.OutputStream;

/**
 * Created by try on 2017/9/28.
 */
@Controller
public class CameraControl {
    @Autowired
    private CameraFun cam;

    @RequestMapping("/searchOptions.do")
    @ResponseBody
    public OptionEntity searchOptions(String signal){
        OptionEntity o=null;
        try {
             o=cam.searchOportions();
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }
        return o;
    }

    @RequestMapping("/picture.do")
    public void showPicture(HttpServletResponse response, HttpServletRequest request) throws Exception{
//        String picId = getRequest().getParameter("picId");
//        String pic_path = pointCardApplyManager.findPicturePath(picId);
//        System.out.println(pic_path);
//        System.out.println(application.getRealPath(""));
        String real=request.getServletContext().getRealPath("");
        System.out.println(real);
//        FileInputStream is = new FileInputStream(real+"\\static\\11.jpg");
        FileInputStream is = new FileInputStream(real+"/static/11.jpg");
//        FileInputStream is = new FileInputStream("11.jpg");
        int i = is.available(); // 得到文件大小
        byte data[] = new byte[i];
        is.read(data); // 读数据
        is.close();
        response.setContentType("image/*"); // 设置返回的文件类型
        OutputStream toClient = response.getOutputStream(); // 得到向客户端输出二进制数据的对象
        toClient.write(data); // 输出数据
        toClient.close();
    }

    @RequestMapping("/readTxt.do")
    public void readTxt(String FILENAME,HttpServletRequest request,HttpServletResponse response){
        System.out.println(FILENAME);
        String realpath=request.getServletContext().getRealPath("");
        txtaction testTxt=new txtaction();
        String readdata="";
        readdata=testTxt.readTxtFile(realpath+"/static/"+FILENAME);
        System.out.println(readdata);
        try {
            response.getWriter().print(readdata);
            response.getWriter().close();
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }
    }

    @RequestMapping("/writeTxt.do")
    public void writeTxt(String FILENAME,String CONTENT,HttpServletRequest request){
        System.out.println(CONTENT);
        String realpath=request.getServletContext().getRealPath("");
        txtaction testTxt=new txtaction();
        testTxt.clearFileContent(realpath+"/static/"+FILENAME);
//    testTxt.writeFile(realpath,"capturePic.txt","1");
        testTxt.writeFile(realpath+"/static",FILENAME,CONTENT);
    }
}
