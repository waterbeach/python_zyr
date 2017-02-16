package com.ossean.populaross.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.RandomAccessFile;
import java.util.Scanner;

import org.springframework.stereotype.Component;

@Component
public class FileOperation {
	public static String readFile(String path) {
		File file = new File(path);
		String rt = "";
		try {
			Scanner sc = new Scanner(file);
			while(sc.hasNextLine()){
				rt += sc.nextLine();
				rt+=" ";
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rt;
	}
	public static boolean writeTxtFile(String content,File fileName)throws Exception{  
		  RandomAccessFile mm=null;  
		  boolean flag=false;  
		  FileOutputStream o=null;  
		  try {  
		  o = new FileOutputStream(fileName);  
	      o.write(content.getBytes("GBK"));  
	      o.close();  
		//   mm=new RandomAccessFile(fileName,"rw");  
		//   mm.writeBytes(content);  
		   flag=true;  
		  } catch (Exception e) {  
		   // TODO: handle exception  
		   e.printStackTrace();  
		  }finally{  
		   if(mm!=null){  
		    mm.close();  
		   }  
		  }  
		  return flag;  
	}  
	//写入文件
	public static void contentToTxt(String filePath, String content) {  
        String str = new String(); //原有txt内容  
        String s1 = new String();//内容更新  
        try {  
            File f = new File(filePath);  
            if (f.exists()) {  
                System.out.print("文件存在");  
            } else {  
                System.out.print("文件不存在");  
                f.createNewFile();// 不存在则创建  
            }  
            BufferedReader input = new BufferedReader(new FileReader(f));  
  
            while ((str = input.readLine()) != null) {  
                s1 += str + "\n";  
            }  
            System.out.println(s1);  
            input.close();  
            s1 += content;  
            BufferedWriter output = new BufferedWriter(new FileWriter(f));  
            output.write(s1);  
            output.close();  
        } catch (Exception e) {  
            e.printStackTrace();  
  
        }  
    }  
	
}
