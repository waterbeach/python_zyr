package com.ossean.populaross.main;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import com.ossean.populaross.dao.OpenSourceProjectDao;
import com.ossean.populaross.dao.RelativeMemoToOpenSourceProjectDao;
import com.ossean.populaross.model.OpenSourceProject;
import com.ossean.populaross.model.RelativeMemoToOpenSourceProject;
import com.ossean.populaross.util.GetTime;

@Component("calCompositeScore")
public class CalCompositeScore {
	
	@Resource
	private  OpenSourceProjectDao ospDao;
	@Resource
	private RelativeMemoToOpenSourceProjectDao rmToOspDao;
	
	private RelativeMemoToOpenSourceProject rmToOsp;
	
	private static String sourceTableName = "open_source_projects";
	private static String targetTableName = "open_source_projects";
	private static String pointerTableName = "edd_pointers";
	private static String relativeMemosTableName = "relative_memos";
	private static int batchSize = 500;
	
	private List<RelativeMemoToOpenSourceProject> rmToOspList;
	private Logger logger = LoggerFactory.getLogger(getClass());
	private Logger logger1 = LoggerFactory.getLogger("cost_time");
	

	//(reply+view/t)*1/m
	public void calMatchScore(OpenSourceProject osp){
		int relativeOspNum;
		int replyNum,viewNum,monthNum;
        int ospId = osp.getId();
        int relativeMemoId;
        double scoreForOsp = 0;
        
        long startTime = System.currentTimeMillis();
		
		
logger.info("ospid : "+ospId);
		//和项目相关的帖子列表
		rmToOspList =  getRelativeMemoList(osp.getId());
		for(int j=0;j<rmToOspList.size();j++){
			rmToOsp = rmToOspList.get(j);
			relativeMemoId = rmToOsp.getRelative_memo_id();
logger.info("memo_id : "+relativeMemoId);
			//和帖子相关的项目数目
			relativeOspNum = getRelativeOspNum(rmToOsp.getRelative_memo_id());
			replyNum = rmToOsp.getReplies_num();
			viewNum = rmToOsp.getView_num_crawled();
			monthNum = GetTime.getMonth(rmToOsp.getCreated_time(),rmToOspDao.getCrawledTime(relativeMemoId, relativeMemosTableName));
			scoreForOsp += (double)(replyNum+(double)viewNum/monthNum)/relativeOspNum;				
logger.info("memo_id : "+relativeMemoId+"; relative osp num:"+relativeOspNum+"; reply num: "+replyNum+"; view num: "+viewNum+"; month num:"+monthNum+"score:"+scoreForOsp);
		}
		BigDecimal b = new BigDecimal(scoreForOsp); 
		double score = b.setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();
		//插表操作
		ospDao.updateOpenSourceProjectScore(ospId, score);
logger.info("calculate score for osp_id: "+ospId+" score: "+score+"\n"
		+"relative memos num: "+rmToOspList.size()+"\n"
		+"cost time: "+(System.currentTimeMillis()-startTime)/60000+" minutes");
	}
	
	
	public int getRelativeOspNum_HighWeight(int memoId){
		int count=0;
		String tableName;
		for(int i=1;i<=70;i++){
			tableName = "relative_memo_to_open_source_projects_" + i;
			count+=rmToOspDao.getRelativeOspNum_HighWeight(tableName, memoId);
		}
		return count;
	}
	
	public int getRelativeOspNum(int memoId){
		int count=0;
		String tableName;
		for(int i=1;i<=70;i++){
			tableName = "relative_memo_to_open_source_projects_" + i;
			count+=rmToOspDao.getRelativeOspNum(tableName, memoId);
		}
		return count;
	}
	

	
	public static void main(String [] args){
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"applicationContext*.xml");
		CalCompositeScore main = applicationContext.getBean(CalCompositeScore.class);
		main.start();
	    }
	
	public void start(){
		
		int startId;
		OpenSourceProject openSourcePrj = null;
		while(true){
			long startTime = System.currentTimeMillis();
			int maxId = ospDao.getMaxId(sourceTableName);
			startId = readPointer(pointerTableName, sourceTableName, targetTableName);
			if(startId > maxId){
				try {
					logger.info("影响力分数已经计算完毕,sleep 10 minutes");
					Thread.sleep(600*1000L);
					continue;
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
			List<OpenSourceProject> osplist = ospDao.getProjectsByBatch(startId, batchSize);
//			if(osplist.size()==0){
//				try {
//					logger.info("所有项目计算完毕,sleep 10 minutes");
//					Thread.sleep(600*1000L);
//					continue;
//				} catch (InterruptedException e) {
//					e.printStackTrace();
//				}
//			}
			for(int i = 0;i<osplist.size();i++){
				openSourcePrj = osplist.get(i);
				calMatchScore(openSourcePrj);
				ospDao.updatePointer(pointerTableName, sourceTableName, targetTableName, openSourcePrj.getId()+1);
			}
			logger1.info("calculate score for "+osplist.size()+" projects"
					+"cost time: "+(System.currentTimeMillis()-startTime)/60000+" minutes");
			
		}
	}
	//读指针
    public int readPointer(String table, String source, String target){
		int pointer = 1;
		try {
			pointer = ospDao.getPointer(table, source, target);
		} catch(Exception e) {
			logger.info("No such pointer! Create one");
			ospDao.insertPointer(table, source, target, pointer);
		}
		return pointer;
	}
    
	public static String getTargetTable(int ospId){
		String targetTableName = "";
		if(ospId >= 770000){
			targetTableName = "relative_memo_to_open_source_projects_70";
		}
		else{
			int a = 1 + ospId/11000;
			targetTableName = "relative_memo_to_open_source_projects_" + a;
		}
		return targetTableName;
	}
	
	public List<RelativeMemoToOpenSourceProject> getRelativeMemoList(int ospId){
		List<RelativeMemoToOpenSourceProject> rmList;
		String targetTableName = getTargetTable(ospId);
		rmList = rmToOspDao.getMatchRelativeMemo(ospId,targetTableName);
		return rmList;
	}
}
	
		
		
	
    
	
	

