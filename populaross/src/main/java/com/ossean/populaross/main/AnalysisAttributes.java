package com.ossean.populaross.main;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import com.ossean.populaross.dao.OpenSourceProjectDao;
import com.ossean.populaross.dao.RelativeMemoToOpenSourceProjectDao;
import com.ossean.populaross.model.OpenSourceProjectForRank;
import com.ossean.populaross.model.RelativeMemoToOpenSourceProject;
import com.ossean.populaross.util.FileOperation;
import com.ossean.populaross.util.GetTime;

@Component
public class AnalysisAttributes {
	
	@Resource
	private RelativeMemoToOpenSourceProjectDao rmToOspDao;
	@Resource
	private  OpenSourceProjectDao ospDao;
	
	private List<RelativeMemoToOpenSourceProject> rm2ospList;
	private RelativeMemoToOpenSourceProject rm2osp;
	private static String relativeMemosTableName = "relative_memos";
	private static Logger logger = LoggerFactory.getLogger("prj_sort");
	
	public List<OpenSourceProjectForRank> getAllAttributes(String [] ospList){
		List<OpenSourceProjectForRank> list = new ArrayList<OpenSourceProjectForRank>();
		int ospId;
		int memoId;
		String ospName;
		String createdTime,crawledTime;
		int beforeReply,afterReply;
		double beforeView,afterView;
		Map<String,String> memosource;
		OpenSourceProjectForRank ospForRank;
		
		for(int i=0;i<ospList.length;i++){
			 
			 ospForRank = new OpenSourceProjectForRank();
			 ospId = Integer.parseInt(ospList[i].split("#")[1]);
			 ospName = ospList[i].split("#")[0];
logger.info("prj Id: "+ospId);
logger.info("prj name: "+ospName);
			 ospForRank.setOsp_id(ospId);
			 ospForRank.setName(ospName);
			 String targetTableName = getTargetTable(ospId);
			 rm2ospList = rmToOspDao.getMatchRelativeMemoWithInterval(ospId,targetTableName);
			 for(int j=0;j<rm2ospList.size();j++){
				 
				 rm2osp = rm2ospList.get(j);
				 memoId = rm2osp.getRelative_memo_id();
				 memosource = rmToOspDao.getMemoTypeSource(memoId,relativeMemosTableName);
logger.info(memoId+" "+memosource+"----------");
				 if(memosource.get("source")==null||memosource.equals(""))
					 continue;
				 int view = rm2osp.getView_num_crawled();
				 createdTime = rm2osp.getCreated_time();
				 crawledTime = rmToOspDao.getCrawledTime(memoId, relativeMemosTableName);
				 if(createdTime==null || createdTime.equals("")||crawledTime==null||crawledTime.equals(""))
					 continue;
				 int t = GetTime.getMonth(createdTime, crawledTime);
				 if(memosource.get("source").equals("stackoverflow")){
					 beforeView = ospForRank.getStackOverFlowViewNum();
					 beforeReply = ospForRank.getStackOverFlowReplyNum();
					 ospForRank.setStackOverFlowReplyNum(beforeReply+rm2osp.getReplies_num());
					 ospForRank.setStackOverFlowViewNum(beforeView+(double)(view)/t);
				 }
				 else if(memosource.get("source").equals("oschina question")){
					 beforeView = ospForRank.getOschinaTopicViewNum();
					 beforeReply = ospForRank.getOschinaTopicReplyNum();
					 ospForRank.setOschinaTopicReplyNum(beforeReply+rm2osp.getReplies_num());
					 ospForRank.setOschinaTopicViewNum(beforeView+(double)(view)/t);
				 }
				 else if(memosource.get("source").equals("csdn_bbs"))
					{
						 beforeView = ospForRank.getCsdnbbsViewNum();
						 beforeReply = ospForRank.getCsdnbbsReplyNum();
						 ospForRank.setCsdnbbsReplyNum(beforeReply+rm2osp.getReplies_num());
						 ospForRank.setCsdnbbsViewNum((double)beforeView+(view)/t);
				 }
				 else if(memosource.get("source").equals("csdn ask")){
						 beforeView = ospForRank.getCsdnaskViewNum();
						 beforeReply = ospForRank.getCsdnaskReplyNum();
						 ospForRank.setCsdnaskReplyNum(beforeReply+rm2osp.getReplies_num());
						 ospForRank.setCsdnaskViewNum(beforeView+(double)(view)/t);
				 }
				 else if(memosource.get("source").equals("csdn blog")){
						 beforeView = ospForRank.getCsdnBlogViewNum();
						 beforeReply = ospForRank.getCsdnBlogReplyNum();
						 ospForRank.setCsdnBlogReplyNum(beforeReply+rm2osp.getReplies_num());
						 ospForRank.setCsdnBlogViewNum(beforeView+(double)(view)/t);
				 }
				 else if(memosource.get("source").equals("cnblogs question")){
					     beforeView = ospForRank.getCnblogsTopicViewNum();
						 beforeReply = ospForRank.getCnblogsTopicReplyNum();
						 ospForRank.setCnblogsTopicReplyNum(beforeReply+rm2osp.getReplies_num());
						 ospForRank.setCnblogsTopicViewNum(beforeView+(double)(view)/t);
				  }
				  else if(memosource.get("source").equals("51cto_blog")){
					     beforeView = ospForRank.get_51cto_blogViewNum();
						 beforeReply = ospForRank.get_51cto_blogReplyNum();
						 ospForRank.set_51cto_blogReplyNum(beforeReply+rm2osp.getReplies_num());
						 ospForRank.set_51cto_blogViewNum(beforeView+(double)(view)/t);
				  }
				  else if(memosource.get("source").equals("dewen question")){
					     beforeView = ospForRank.getDewenTopicViewNum();
						 beforeReply = ospForRank.getDewenTopicReplyNum();
						 ospForRank.setDewenTopicReplyNum(beforeReply+rm2osp.getReplies_num());
						 ospForRank.setDewenTopicViewNum(beforeView+(view)/t);
				  }
				  else if(memosource.get("source").equals("博客园 新闻")){
					     beforeView = ospForRank.getBokeyuanViewNum();
						 beforeReply = ospForRank.getBokeyuanReplyNum();
						 ospForRank.setBokeyuanReplyNum(beforeReply+rm2osp.getReplies_num());
						 ospForRank.setBokeyuanViewNum(beforeView+(view)/t);
				  }

			 }
			 String insertStr =ospForRank.getOsp_id()+" "+ospForRank.getName()+" "+"qid:1"+" "+"1:"+ospForRank.getStackOverFlowViewNum()+" "+"2:"+ospForRank.getStackOverFlowReplyNum()+" "+"3:"+ospForRank.getOschinaTopicViewNum()+" "+"4:"+ospForRank.getOschinaTopicReplyNum()
						+" "+"5:"+ospForRank.getCsdnBlogViewNum()+" "+"6:"+ospForRank.getCsdnBlogReplyNum()+" "+"7:"+ospForRank.getCsdnbbsViewNum()+" "+"8:"+ospForRank.getCsdnbbsReplyNum()+" "+"9:"+ospForRank.getCsdnaskViewNum()+" "+"10:"
						+ospForRank.getCsdnaskReplyNum()+" "+"11:"+ospForRank.getCnblogsTopicViewNum()+" "+"12:"+ospForRank.getCnblogsTopicReplyNum()+" "+"13:"
						+ospForRank.get_51cto_blogViewNum()+" "+"14:"+ospForRank.get_51cto_blogReplyNum()+" "+"15:"+ospForRank.getBokeyuanViewNum()+" "+"16:"+ospForRank.getBokeyuanReplyNum()+" "+"17:"+ospForRank.getDewenTopicViewNum()+" "+"18:"+ospForRank.getDewenTopicReplyNum()+"\n";
			 logger.info(insertStr);
			 list.add(ospForRank);
		}
		return list;
	}
	
	public static void insertRankListToFile(List<OpenSourceProjectForRank> list,String filepath,int qid){
		int length = list.size();
		int orderNum = length;
		String insertStr="";
		OpenSourceProjectForRank ospForRank = new OpenSourceProjectForRank();
		for(int i=0;i<length;i++){
			ospForRank = list.get(i);
			insertStr += orderNum+" "+"qid:"+qid+" "+"1:"+ospForRank.getStackOverFlowViewNum()+" "+"2:"+ospForRank.getStackOverFlowReplyNum()+" "+"3:"+ospForRank.getOschinaTopicViewNum()+" "+"4:"+ospForRank.getOschinaTopicReplyNum()
					+" "+"5:"+ospForRank.getCsdnBlogViewNum()+" "+"6:"+ospForRank.getCsdnBlogReplyNum()+" "+"7:"+ospForRank.getCsdnbbsViewNum()+" "+"8:"+ospForRank.getCsdnbbsReplyNum()+" "+"9:"+ospForRank.getCsdnaskViewNum()+" "+"10:"
					+ospForRank.getCsdnaskReplyNum()+" "+"11:"+ospForRank.getCnblogsTopicViewNum()+" "+"12:"+ospForRank.getCnblogsTopicReplyNum()+" "+"13:"
					+ospForRank.get_51cto_blogViewNum()+" "+"14:"+ospForRank.get_51cto_blogReplyNum()+" "+"15:"+ospForRank.getBokeyuanViewNum()+" "+"16:"+ospForRank.getBokeyuanReplyNum()+" "+"17:"+ospForRank.getDewenTopicViewNum()+" "+"18:"+ospForRank.getDewenTopicReplyNum()+"\n";
			orderNum--;
		}
		FileOperation.contentToTxt(filepath, insertStr);
		
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
	
	public static void main(String[] args) {
          ApplicationContext application = new ClassPathXmlApplicationContext("applicationContext*.xml");
          AnalysisAttributes a = application.getBean(AnalysisAttributes.class);
          String fileNamePath = "filename.txt";
          String outFilePath = "train.txt";
          
          String filename = FileOperation.readFile(fileNamePath);
          String[] fileList = filename.split(",");
          for(int i=0;i<fileList.length;i++){
        	  String ospName = FileOperation.readFile(fileList[i]);
              String[] ospList = ospName.split(",");
              logger.info(ospList[0]);
              List<OpenSourceProjectForRank> rm2ospList = a.getAllAttributes(ospList);
              logger.info("--------"+rm2ospList.size());
         	  insertRankListToFile(rm2ospList, outFilePath, i+1);
          }
          
          
          
	}

}
