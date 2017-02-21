package com.ossean.populaross.main;


import java.math.BigDecimal;
import java.util.List;
import java.util.concurrent.CountDownLatch;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import com.ossean.populaross.dao.OpenSourceProjectDao;
import com.ossean.populaross.dao.RelativeMemoToOpenSourceProjectDao;
import com.ossean.populaross.model.OpenSourceProject;
import com.ossean.populaross.model.RelativeMemoToOpenSourceProject;
import com.ossean.populaross.util.GetTime;

@Component("calScoreThread")
@Scope("prototype")
public class CalScoreThread implements Runnable{
	
	@Resource
	private  OpenSourceProjectDao ospDao;
	@Resource
	private RelativeMemoToOpenSourceProjectDao rmToOspDao;
	
	private RelativeMemoToOpenSourceProject rmToOsp;
	
	private static String sourceTableName = TableName.sourceTableName;
	private static String targetTableName = TableName.targetTableName;
	private static String pointerTableName = TableName.pointerTableName;
	private static String relativeMemosTableName = TableName.relativeMemosTableName;
	private static int batchSize = 500;
	
	private List<RelativeMemoToOpenSourceProject> rmToOspList;
	private Logger logger = LoggerFactory.getLogger(getClass());
	private Logger logger1 = LoggerFactory.getLogger("cost_time");
	
	private int beginId;
	private int endId;
	private String threadName;
	
	public void setParameters(int beginId,int endId,String threadName) {
		this.beginId = beginId;
		this.endId = endId;
		this.threadName = threadName;
	}
	
	@Override
	public void run() {
		logger.info(threadName+" is begin~");
		int startId = beginId;
		int stopId = endId;
		OpenSourceProject openSourcePrj = null;
		Thread.currentThread().setName(threadName);
		long startTime = System.currentTimeMillis();
		while(true){
			if(startId >= stopId){
				logger.info(threadName+" 影响力分数已经计算完毕!");
				logger.info(threadName+" cost time: "+(System.currentTimeMillis()-startTime)/60000+" minutes");
				break;
			}
			if(ospDao.getProjectsByBatchWithInterval(sourceTableName,startId,stopId,batchSize) == null || 
					ospDao.getProjectsByBatchWithInterval(sourceTableName,startId,stopId,batchSize).size() ==0){
				logger.info(threadName+" 影响力分数已经计算完毕!");
				logger.info(threadName+" cost time: "+(System.currentTimeMillis()-startTime)/60000+" minutes");
				break;
			}
			
			List<OpenSourceProject> osplist = ospDao.getProjectsByBatchWithInterval(sourceTableName,startId,stopId,batchSize);
				
			for(int i = 0,len=osplist.size();i<len;i++){
				openSourcePrj = osplist.get(i);
				calMatchScore(openSourcePrj);
			}
			startId = openSourcePrj.getId();
			logger1.info(threadName+" :calculate score for "+osplist.size()+ " projects"
					+"cost time: "+(System.currentTimeMillis()-startTime)/60000+" minutes");
			
		}
		CalScoreProcess.gatherState.put(threadName, false);
		logger.info(threadName+" is stop");
		
	}

	//(reply+view/t)*1/m
	public void calMatchScore(OpenSourceProject osp){
		//int relativeOspNum = 0;
		int relativeMemosNum;
		int replyNum,viewNum,monthNum=1;
        int ospId = osp.getId();
        int relativeMemoId;
        double scoreForOsp = 0;
        
        long startTime = System.currentTimeMillis();
		
		
//logger.info(Thread.currentThread().getName()+" ospid : "+ospId);
		//和项目相关的帖子列表
		rmToOspList =  getRelativeMemoList(osp.getId());
		if(rmToOspList == null)
			relativeMemosNum = 0;
		else
			relativeMemosNum = rmToOspList.size();
		for(int j=0;j<rmToOspList.size();j++){
			rmToOsp = rmToOspList.get(j);
			relativeMemoId = rmToOsp.getRelative_memo_id();
//logger.info(Thread.currentThread().getName()+" memo_id : "+relativeMemoId);
			//和帖子相关的项目数目
			//relativeOspNum = getRelativeOspNum(rmToOsp.getRelative_memo_id());
			replyNum = rmToOsp.getReplies_num();
			viewNum = rmToOsp.getView_num_crawled();
			try{
			monthNum = GetTime.getMonth(rmToOsp.getCreated_time(),rmToOspDao.getCrawledTime(relativeMemoId, relativeMemosTableName));
			}catch(Exception e){
				System.out.println(rmToOsp.getId()+" ospid:"+rmToOsp.getOsp_id()+" "+ rmToOsp.getCreated_time());
				System.out.println("memoid:"+relativeMemoId +" | table "+relativeMemosTableName);
				System.out.println(e);
			}
//			if(relativeOspNum !=0)
//				scoreForOsp += (double)(replyNum+(double)viewNum/monthNum)/relativeOspNum;	
//			else
			scoreForOsp += (double)(replyNum+(double)viewNum/monthNum);
		}
		BigDecimal b = new BigDecimal(scoreForOsp); 
		double score = b.setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();
		//插表操作
		ospDao.updateOpenSourceProjectScore(targetTableName,ospId, score,relativeMemosNum);
		//ospDao.updateOpenSourceProjectMemosNum(targetTableName,ospId, relativeMemosNum);
//logger1.info(" calculate score for osp_id: "+ospId+" score: "+score+"\n"
//		+"relative memos num: "+rmToOspList.size()+"\n"
//		+"cost time: "+(System.currentTimeMillis()-startTime)/1000+" seconds");
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
	
		
		
	
    
	
	

