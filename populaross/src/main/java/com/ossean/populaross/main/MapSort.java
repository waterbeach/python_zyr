package com.ossean.populaross.main;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

public class MapSort {
	
	public static Map<String, Integer> sort(Map<String, Integer> oldMap){
		ArrayList<Map.Entry<String, Integer>> list = new ArrayList<Map.Entry<String, Integer>>(oldMap.entrySet());  
        Collections.sort(list, new Comparator<Map.Entry<String, Integer>>() {  
  
            public int compare(Entry<String, Integer> arg0,  
                    Entry<String, Integer> arg1) {  
                if(arg0.getValue() - arg1.getValue() > 0)
                	return -1;
                else if(arg0.getValue() - arg1.getValue() < 0)
                	return 1;
                else
                	return 0;
            }  
        });  
        Map<String,Integer> newMap = new LinkedHashMap<String,Integer>();  
        for (int i = 0; i < list.size(); i++) {  
            newMap.put(list.get(i).getKey(), list.get(i).getValue());  
        }  
        return newMap;  
	}

}
