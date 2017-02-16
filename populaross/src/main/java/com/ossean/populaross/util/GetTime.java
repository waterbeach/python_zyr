package com.ossean.populaross.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class GetTime {
       public static int getMonth(String created_time,String crawled_time){
		
	    	if(crawled_time==null || crawled_time.equals("") || created_time==null || created_time.equals(""))
	    		return 1;
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date created = null;
			Date crawler = null;
			try {
				created = df.parse(created_time);
				crawler = df.parse(crawled_time);
			} catch (ParseException e) {
				e.printStackTrace();
				System.out.println(created_time);
				System.out.println(crawled_time);
			}
			long diff = crawler.getTime() - created.getTime();
			int  days = (int) (diff/(1000*60*60*24));
			int months = days/30;
			//in a month
			if(months < 1)
				months=1;
			
			return months;
		
	}
    public static void main(String [] args){
    	int t = getMonth("2015-06-01 03:34:02.0","2015-11-03 11:29:42.0");
    	int t1 = getMonth("2015-04-01 03:34:02.0","2015-11-03 11:29:42.0");
    	System.out.println(t1);
    }

}
