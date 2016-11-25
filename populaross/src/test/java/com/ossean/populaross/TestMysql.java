package com.ossean.populaross;
import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import com.ossean.populaross.dao.OpenSourceProjectDao;
import com.ossean.populaross.main.CalCompositeScore;
import com.ossean.populaross.model.OpenSourceProject;

@Component
public class TestMysql{
	
	@Resource
	private static  OpenSourceProjectDao ospDao;
	@Qualifier("calCompositeScore")
	@Autowired
	private CalCompositeScore calCompositeScore;
	public  List<OpenSourceProject> getBatch(){
		return ospDao.getProjectsByBatch(0, 10);
	}
	public static void main(String args[]){
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"classpath*:/applicationContext*.xml");
		TestMysql a = applicationContext.getBean(TestMysql.class);
		List<OpenSourceProject> list = a.getBatch();
		System.out.println(list.size());
	}
	/*@Test
	public void test(){
		List<OpenSourceProject> list = ospDao.getProjectsByBatch(0,10);
		System.out.println(list.size());
		System.out.println(list.get(2).getName());
	}*/
	/*
	 * @Resource
	private ListHtmlDao listHtmlDao;
	public List<ListHtml> getBatch(){
		return listHtmlDao.getBatch("freecode_html_list", 0 , 4);
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"spring/applicationContext*.xml");
		MybatisTest mbt = applicationContext.getBean(MybatisTest.class);
		List<ListHtml> list= mbt.getBatch();
		for(ListHtml html : list){
			System.out.println(html.toString());
		}
		System.out.println(list.size());
	}
	 */

}
