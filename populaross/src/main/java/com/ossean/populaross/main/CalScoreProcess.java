package com.ossean.populaross.main;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import com.ossean.populaross.dao.OpenSourceProjectDao;
import com.ossean.populaross.dao.RelativeMemoToOpenSourceProjectDao;

@Component
public class CalScoreProcess {
	
	@Resource
	private  OpenSourceProjectDao ospDao;
	@Resource
	private RelativeMemoToOpenSourceProjectDao rmToOspDao;
	
	private static Logger logger = Logger.getLogger(CalScoreProcess.class);
	public static Map<String,Boolean> gatherState = new HashMap<String,Boolean>(); //
	private ExecutorService pool = Executors.newFixedThreadPool(20);
	private static String sourceTableName = TableName.sourceTableName;
	private static int batchThreadSize=150000;
    
	public void start(){
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:/applicationContext*.xml");
		//while(true){
			long startTime = System.currentTimeMillis();
			int maxId = ospDao.getMaxId(sourceTableName);
			int loop = maxId/batchThreadSize+1;
			if (maxId % batchThreadSize == 0)
				loop = maxId/batchThreadSize;
			//每个线程处理150000个项目
			for(int i = 0;i < loop;i++){
				Boolean state = gatherState.get("PrjThread"+(i+1));
				if(state == null || state == false){
					gatherState.put("PrjThread"+(i+1), true);
				}
				else if(state == true){
					continue;
				}
				CalScoreThread calScoreThread = (CalScoreThread)applicationContext.getBean("calScoreThread");
				
				if(i==(loop-1))
					calScoreThread.setParameters(i*batchThreadSize,maxId,"PrjThread"+(i+1));
				else
					calScoreThread.setParameters(i*batchThreadSize,(i+1)*batchThreadSize,"PrjThread"+(i+1));
				pool.execute(calScoreThread);
			}
			logger.info("current env thread nums: "+((ThreadPoolExecutor)pool).getActiveCount());
//			try {
//				logger.info(".......sleeping......");
//				Thread.sleep(20000);
//			} catch (InterruptedException e) {
//				logger.error(e);
//			}
			System.out.println("已经开启所有的子线程");  
	        pool.shutdown();  
	        System.out.println("shutdown()：启动一次顺序关闭，执行以前提交的任务，但不接受新任务。");  
	        while(true){  
	            if(pool.isTerminated()){  
	                System.out.println("所有的子线程都结束了！");
	                System.out.println("cost time: "+(System.currentTimeMillis()-startTime)/1000+"seconds");
	                break;  
	            }
	            try {
	            	logger.info(".......sleeping......");
					Thread.sleep(10*60*000);
				} catch (InterruptedException e) {
					e.printStackTrace();
					logger.error(e);
				}    
	        }  
			System.gc();  //手动垃圾回收
		//}
		
	}
	
	public static void main(String[] args) throws InterruptedException {
		
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:/applicationContext*.xml");
		CalScoreProcess main = applicationContext.getBean(CalScoreProcess.class);
		main.start();
	}

}
