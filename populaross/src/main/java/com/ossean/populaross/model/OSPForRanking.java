package com.ossean.populaross.model;

import org.springframework.stereotype.Component;

@Component
public class OSPForRanking {
	private int id;
	private String name;
	private int download_num;
	private int view_num_local;
	private int relative_memos_num;

	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public int getView_num_local() {
		return view_num_local;
	}
	public void setView_num_local(int view_num_local) {
		this.view_num_local = view_num_local;
	}
	
	public int getRelative_memos_num() {
		return relative_memos_num;
	}
	public void setRelative_memos_num(int relative_memos_num) {
		this.relative_memos_num = relative_memos_num;
	}
}
