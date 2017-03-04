package com.ossean.populaross.main;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.ossean.populaross.dao.OpenSourceProjectDao;
import com.ossean.populaross.util.FileReader;

@Service
public class UpdateLanguage {
	@Resource
	private OpenSourceProjectDao openSourceProjectDao;
	
	public void start(){
		List<String> keywords = FileReader.read("./language.txt");//用于过滤类似于"Java","C++"这样的词
		for(String str : keywords){
			openSourceProjectDao.updateOpenSourceProjectWithName(TableName.targetTableName , str,0, 0);
		}
		System.out.println("update complete~");
	}
	
	public static void main(String [] args){
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:/applicationContext*.xml");
		UpdateLanguage main = applicationContext.getBean(UpdateLanguage.class);
		main.start();
	}

}
