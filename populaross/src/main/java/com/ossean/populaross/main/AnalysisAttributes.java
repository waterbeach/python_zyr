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
	private Logger logger = LoggerFactory.getLogger("prj_sort");
	
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
//System.out.println("prj Id: "+ospId);
//System.out.println("prj name: "+ospName);
			 ospForRank.setOsp_id(ospId);
			 ospForRank.setName(ospName);
			 String targetTableName = getTargetTable(ospId);
			 rm2ospList = rmToOspDao.getMatchRelativeMemoWithInterval(ospId,targetTableName);
			 for(int j=0;j<rm2ospList.size();j++){
				 
				 rm2osp = rm2ospList.get(j);
				 memoId = rm2osp.getRelative_memo_id();
				 memosource = rmToOspDao.getMemoTypeSource(memoId,relativeMemosTableName);
//System.out.println(memoId+" "+memosource+"----------");				 
				 int view = rm2osp.getView_num_crawled();
				 createdTime = rm2osp.getCreated_time();
				 crawledTime = rmToOspDao.getCrawledTime(memoId, relativeMemosTableName);
				 if(createdTime==null || createdTime.equals("")||crawledTime==null||crawledTime.equals(""))
					 continue;
				 int t = GetTime.getMonth(createdTime, crawledTime);
				 if(memosource.get("source").equals("StackOverflow")){
					 beforeView = ospForRank.getStackOverFlowViewNum();
					 beforeReply = ospForRank.getStackOverFlowReplyNum();
					 ospForRank.setStackOverFlowReplyNum(beforeReply+rm2osp.getReplies_num());
					 ospForRank.setStackOverFlowViewNum(beforeView+(double)(view)/t);
				 }
				 else if(memosource.get("source").equals("OSChina")){
					 beforeView = ospForRank.getOschinaTopicViewNum();
					 beforeReply = ospForRank.getOschinaTopicReplyNum();
					 ospForRank.setOschinaTopicReplyNum(beforeReply+rm2osp.getReplies_num());
					 ospForRank.setOschinaTopicViewNum(beforeView+(double)(view)/t);
				 }
				 else if(memosource.get("source").equals("CSDN")){
					 if (memosource.get("memo_type").equals("news")){
						 beforeView = ospForRank.getCsdnNewsViewNum();
						 beforeReply = ospForRank.getCsdnNewsReplyNum();
						 ospForRank.setCsdnNewsReplyNum(beforeReply+rm2osp.getReplies_num());
						 ospForRank.setCsdnNewsViewNum((double)beforeView+(view)/t);
					 }
					 else if(memosource.get("memo_type").equals("topic")||memosource.get("memo_type").equals("posts")){
						 beforeView = ospForRank.getCsdnTopicViewNum();
						 beforeReply = ospForRank.getCsdnTopicReplyNum();
						 ospForRank.setCsdnTopicReplyNum(beforeReply+rm2osp.getReplies_num());
						 ospForRank.setCsdnTopicViewNum(beforeView+(double)(view)/t);
					 }
					 else if(memosource.get("memo_type").equals("blogs")||memosource.get("memo_type").equals("blog")){
						 beforeView = ospForRank.getCsdnBlogViewNum();
						 beforeReply = ospForRank.getCsdnBlogReplyNum();
						 ospForRank.setCsdnBlogReplyNum(beforeReply+rm2osp.getReplies_num());
						 ospForRank.setCsdnBlogViewNum(beforeView+(double)(view)/t);
					 }
					 
				  }
				  else if(memosource.get("source").equals("cnblogs")){
					  if (memosource.get("memo_type").equals("news")){
						     beforeView = ospForRank.getCnblogsNewsViewNum();
							 beforeReply = ospForRank.getCnblogsNewsReplyNum();
							 ospForRank.setCnblogsNewsReplyNum(beforeReply+rm2osp.getReplies_num());
							 ospForRank.setCnblogsNewsViewNum(beforeView+(double)(view)/t);
					  }
					  else if(memosource.get("memo_type").equals("topic")||memosource.get("memo_type").equals("posts")){
					     beforeView = ospForRank.getCnblogsTopicViewNum();
						 beforeReply = ospForRank.getCnblogsTopicReplyNum();
						 ospForRank.setCnblogsTopicReplyNum(beforeReply+rm2osp.getReplies_num());
						 ospForRank.setCnblogsTopicViewNum(beforeView+(double)(view)/t);
				     }
				  }
				  else if(memosource.get("source").equals("ITeye")){
					  if (memosource.get("memo_type").equals("blogs")||memosource.get("memo_type").equals("blog")){
						     beforeView = ospForRank.getIteyeBlogViewNum();
							 beforeReply = ospForRank.getIteyeBlogReplyNum();
							 ospForRank.setIteyeBlogReplyNum(beforeReply+rm2osp.getReplies_num());
							 ospForRank.setIteyeBlogViewNum(beforeView+(double)(view)/t);
					  }
					  else if(memosource.get("memo_type").equals("topic")||memosource.get("memo_type").equals("posts")){
					     beforeView = ospForRank.getIteyeTopicViewNum();
						 beforeReply = ospForRank.getIteyeTopicReplyNum();
						 ospForRank.setIteyeTopicReplyNum(beforeReply+rm2osp.getReplies_num());
						 ospForRank.setIteyeTopicViewNum(beforeView+(double)(view)/t);
				     }
				  }
				  else if(memosource.get("source").equals("51cto_blog")){
					     beforeView = ospForRank.get_51cto_blogViewNum();
						 beforeReply = ospForRank.get_51cto_blogReplyNum();
						 ospForRank.set_51cto_blogReplyNum(beforeReply+rm2osp.getReplies_num());
						 ospForRank.set_51cto_blogViewNum(beforeView+(double)(view)/t);
				  }
//				  else if(memosource.get("source").equals("DEWEN")){
//					     beforeView = ospForRank.getDewenTopicViewNum();
//						 beforeReply = ospForRank.getDewenTopicReplyNum();
//						 ospForRank.setDewenTopicReplyNum(beforeReply+rm2osp.getReplies_num());
//						 ospForRank.setDewenTopicViewNum(beforeView+(view)/t);
//				  }
//				  else if(memosource.get("source").equals("slashdot")){
//					     beforeView = ospForRank.getSlashdotViewNum();
//						 beforeReply = ospForRank.getSlashdotReplyNum();
//						 ospForRank.setSlashdotReplyNum(beforeReply+rm2osp.getReplies_num());
//						 ospForRank.setSlashdotViewNum(beforeView+(view)/t);
//				  }
//				  else if(memosource.get("source").equals("linuxtone")){
//					     beforeView = ospForRank.getLinuxtoneViewNum();
//						 beforeReply = ospForRank.getLinuxtoneReplyNum();
//						 ospForRank.setLinuxtoneReplyNum(beforeReply+rm2osp.getReplies_num());
//						 ospForRank.setLinuxtoneViewNum(beforeView+(view)/t);
//				  }
//				  else if(memosource.get("source").equals("PhpChina")){
//					     beforeView = ospForRank.getPhpChinaViewNum();
//						 beforeReply = ospForRank.getPhpChinaReplyNum();
//						 ospForRank.setPhpChinaReplyNum(beforeReply+rm2osp.getReplies_num());
//						 ospForRank.setPhpChinaViewNum(beforeView+(view)/t);
//				  }
			 }
			 String insertStr =ospForRank.getOsp_id()+" "+ospForRank.getName()+" "+"qid:1"+" "+"1:"+ospForRank.getStackOverFlowViewNum()+" "+"2:"+ospForRank.getStackOverFlowReplyNum()+" "+"3:"+ospForRank.getOschinaTopicViewNum()+" "+"4:"+ospForRank.getOschinaTopicReplyNum()
						+" "+"5:"+ospForRank.getCsdnBlogViewNum()+" "+"6:"+ospForRank.getCsdnBlogReplyNum()+" "+"7:"+ospForRank.getCsdnNewsViewNum()+" "+"8:"+ospForRank.getCsdnNewsReplyNum()+" "+"9:"+ospForRank.getCsdnTopicViewNum()+" "+"10:"
						+ospForRank.getCsdnTopicReplyNum()+" "+"11:"+ospForRank.getIteyeBlogViewNum()+" "+"12:"+ospForRank.getIteyeBlogReplyNum()+" "+"13:"+ospForRank.getIteyeTopicViewNum()+" "+"14:"+ospForRank.getIteyeTopicReplyNum()
						+" "+"15:"+ospForRank.getCnblogsNewsViewNum()+" "+"16:"+ospForRank.getCnblogsNewsReplyNum()+" "+"17:"+ospForRank.getCnblogsTopicViewNum()+" "+"18:"+ospForRank.getCnblogsTopicReplyNum()
						+" "+"19:"+ospForRank.get_51cto_blogViewNum()+" "+"20:"+ospForRank.get_51cto_blogReplyNum()+"\n";
			 logger.info(insertStr);
			 list.add(ospForRank);
		}
		return list;
	}
	
	public static void insertRankListToFile(List<OpenSourceProjectForRank> list,String filepath,int qid){
		int length = list.size();
		int orderNum = length;
		String insertStr="";
		OpenSourceProjectForRank ospForRank;
		for(int i=0;i<length;i++){
			ospForRank = list.get(i);
			insertStr += orderNum+" "+"qid:"+qid+" "+"1:"+ospForRank.getStackOverFlowViewNum()+" "+"2:"+ospForRank.getStackOverFlowReplyNum()+" "+"3:"+ospForRank.getOschinaTopicViewNum()+" "+"4:"+ospForRank.getOschinaTopicReplyNum()
					+" "+"5:"+ospForRank.getCsdnBlogViewNum()+" "+"6:"+ospForRank.getCsdnBlogReplyNum()+" "+"7:"+ospForRank.getCsdnNewsViewNum()+" "+"8:"+ospForRank.getCsdnNewsReplyNum()+" "+"9:"+ospForRank.getCsdnTopicViewNum()+" "+"10:"
					+ospForRank.getCsdnTopicReplyNum()+" "+"11:"+ospForRank.getIteyeBlogViewNum()+" "+"12:"+ospForRank.getIteyeBlogReplyNum()+" "+"13:"+ospForRank.getIteyeTopicViewNum()+" "+"14:"+ospForRank.getIteyeTopicReplyNum()
					+" "+"15:"+ospForRank.getCnblogsNewsViewNum()+" "+"16:"+ospForRank.getCnblogsNewsReplyNum()+" "+"17:"+ospForRank.getCnblogsTopicViewNum()+" "+"18:"+ospForRank.getCnblogsTopicReplyNum()
					+" "+"19:"+ospForRank.get_51cto_blogViewNum()+" "+"20:"+ospForRank.get_51cto_blogReplyNum()+"\n";
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
              List<OpenSourceProjectForRank> rm2ospList = a.getAllAttributes(ospList);
System.out.println("--------"+rm2ospList.size());
         	  insertRankListToFile(rm2ospList, outFilePath, i+1);
          }
          
          
          
	}

}
