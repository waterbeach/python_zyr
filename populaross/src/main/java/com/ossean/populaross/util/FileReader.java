package com.ossean.populaross.util;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;


public class FileReader {
	
	public static List<String> read(String path){
		List<String> result = new ArrayList<String>();
		InputStream inputStream;
		try {
			inputStream = new FileInputStream(path);
			InputStreamReader reader = new InputStreamReader(inputStream);
			BufferedReader bufferedReader = new BufferedReader(reader);
			String line;
			try {
				while((line = bufferedReader.readLine()) != null){
					result.add(line);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				bufferedReader.close();
				reader.close();
				inputStream.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	
	public static Map<String, String[]> readReturnMap(String path){
		Map<String, String[]> result = new HashMap<String, String[]>();
		InputStream inputStream;
		try {
			inputStream = new FileInputStream(path);
			InputStreamReader reader = new InputStreamReader(inputStream);
			BufferedReader bufferedReader = new BufferedReader(reader);
			String line;
			try {
				while((line = bufferedReader.readLine()) != null){
					String[] tmp = line.split(" ");
					String[] tmp2 = new String[3];
					tmp2[0] = tmp[1];//name
					tmp2[1] = tmp[2];//tag
					tmp2[2] = tmp[3];//description
					result.put(tmp[0], tmp2);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				bufferedReader.close();
				reader.close();
				inputStream.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
