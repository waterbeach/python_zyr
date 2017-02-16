package com.ossean.populaross.main;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.ComparatorUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import com.ossean.populaross.dao.OpenSourceProjectDao;
import com.ossean.populaross.dao.RelativeMemoToOpenSourceProjectDao;
import com.ossean.populaross.model.OSPForRanking;
import com.ossean.populaross.model.OpenSourceProject;
import com.ossean.populaross.model.OspRankingMemos;
import com.ossean.populaross.model.RelativeMemoToOpenSourceProject;
import com.ossean.populaross.util.FileOperation;

@Component
public class TestMysql {
	
	@Resource
	private  OpenSourceProjectDao ospDao;
	@Resource
	private  RelativeMemoToOpenSourceProjectDao rm2ospDao;
	private static List<OpenSourceProject> osplist;
	
	
	public List<OpenSourceProject> getOspBatch(){
		return ospDao.getProjectsByBatch("",1,10);
	}
	
	public void testgetSumReplyView(){
		Map<String,Integer> map = rm2ospDao.getSumReplyView(20,"");
		System.out.println("sum reply : "+map.get("sumreply"));
		System.out.println("sum view : "+map.get("sumview"));
		
	}
	
	public void getID(int osp_id){
		RelativeMemoToOpenSourceProject rm2osp;
		String tablename = getSourceTable(osp_id);
		List<RelativeMemoToOpenSourceProject> rm2osplist = rm2ospDao.getResultByOspID(osp_id,tablename);
		System.out.println("osp_id: "+osp_id+"relative memo nums: "+rm2osplist.size());
		for(int i=0;i<10;i++){
			rm2osp = rm2osplist.get(i);
			System.out.println(rm2osp.getRelative_memo_id()+rm2osp.getMatch_weight());
		}
	}
	
	public static void main(String args[]){
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"classpath:/applicationContext*.xml");
		TestMysql a = applicationContext.getBean(TestMysql.class);
    	osplist = a.getOspBatch();

	    System.out.println(osplist.get(1).getCreated_time());
		//a.getID(20);
		
	}
	
	public static String getSourceTable(int osp_id){
		String targetTableName = "";
		if (osp_id < 500) {
			targetTableName = "relative_memo_to_open_source_projects_1";
		}
		else if (osp_id >= 500 && osp_id < 1000) {
			targetTableName = "relative_memo_to_open_source_projects_2";
		}
		else if (osp_id >= 1000 && osp_id < 1500) {
			targetTableName = "relative_memo_to_open_source_projects_3";
		}
		else if (osp_id >= 1500 && osp_id < 2000) {
			targetTableName = "relative_memo_to_open_source_projects_4";
		}
		else if (osp_id >= 2000 && osp_id < 3000) {
			targetTableName = "relative_memo_to_open_source_projects_5";
		}
		else if (osp_id >= 3000 && osp_id < 5000) {
			targetTableName = "relative_memo_to_open_source_projects_6";
		}
		else if (osp_id >= 5000 && osp_id < 7500) {
			targetTableName = "relative_memo_to_open_source_projects_7";
		}
		else if (osp_id >= 7500 && osp_id < 10000) {
			targetTableName = "relative_memo_to_open_source_projects_8";
		}
		else if (osp_id >= 10000 && osp_id < 310000) {
			int a = 7 + osp_id/5000;
			targetTableName = "relative_memo_to_open_source_projects_" + a;
		}
		else if (osp_id >= 310000) {
			targetTableName = "relative_memo_to_open_source_projects_70";
		}
		return targetTableName;
		//return "highcharts";
	}
 

}
