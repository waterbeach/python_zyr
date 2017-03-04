package com.ossean.populaross.main;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;

import com.ossean.populaross.dao.OpenSourceProjectDao;
import com.ossean.populaross.util.FileReader;


public class UpdateLanguage {
	@Resource
	private static OpenSourceProjectDao openSourceProjectDao;
	
	public static void main(String [] args){
		List<String> keywords = FileReader.read("./language.txt");//用于过滤类似于"Java","C++"这样的词
		for(String str : keywords){
			openSourceProjectDao.updateOpenSourceProjectWithName(TableName.targetTableName , str,0, 0);
		}
		System.out.println("update complete~");
	}

}
