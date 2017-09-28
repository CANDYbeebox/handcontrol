package com.black.common;

import java.io.*;

/**
 * Created by sure on 2017/7/2.
 */
public class txtaction {

    public void writeFile(String dir,String filename,String content) {
//        String txtFileName = "1.txt";
        String txtFileName = filename;
        String directoryPath = dir;
//        String directoryPath = "";
        try {
//            directoryPath = WebplusContext.getRealPath("/apps/schoolfellow/upload/smsRecord");
            directoryPath=dir;
            File directory = new File(directoryPath);
            if (!directory.exists()) {
                directory.mkdirs();
            }
            File txtFile = new File(directoryPath, txtFileName);
            FileOutputStream out = new FileOutputStream(txtFile, true);
            String line = System.getProperty("line.separator");
            String smsContent = content + line;
            out.write(smsContent.toString().getBytes("GBK"));
            out.close();
            System.out.println("将结果写入文件成功！");
        } catch (Exception ex) {
//            log.error("将结果写入文件失败！", ex);
            System.out.println("将结果写入文件失败！");
        }
    }

    public void clearFileContent(String filepath) {
//        String filePath = WebplusContext.getServletContext().getRealPath("/apps/schoolfellow/upload/emailRecord/emailRecord.txt");
        String filePath=filepath;
        try {
            FileOutputStream out = new FileOutputStream(filePath,false);
            out.write(new String("").getBytes());
            out.close();
//            script = "alert('清空发送邮件日志成功！');";
            System.out.println("清除成功");
        } catch (Exception ex) {
            System.out.println("清除失败");
//            script = "alert('清空文件的内容失败,因为没有发送邮件日志文件！');";
        }
    }


    public String readTxtFile(String filePath){
        String temp="";
        try {
            String encoding="GBK";
            File file=new File(filePath);
            if(file.isFile() && file.exists()){ //判断文件是否存在
                InputStreamReader read = new InputStreamReader(
                        new FileInputStream(file),encoding);//考虑到编码格式
                BufferedReader bufferedReader = new BufferedReader(read);
                String lineTxt = null;

                while((lineTxt = bufferedReader.readLine()) != null){
                    temp+=lineTxt;
                    System.out.println(lineTxt);
                }
                read.close();
            }else{
                System.out.println("找不到指定的文件");
            }
        } catch (Exception e) {
            System.out.println("读取文件内容出错");
            e.printStackTrace();
        }
        return temp;
    }
    public static void main(String[] args){
        txtaction testTxt=new txtaction();
        String readdata="";
        readdata=testTxt.readTxtFile("111/0703.txt");
        System.out.println(readdata);
    }
}
