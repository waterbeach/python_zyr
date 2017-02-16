package com.ossean.populaross.model;

import java.util.List;

public class RelativeMemoToOpenSourceProject {
	
	private int id;
	private int osp_id;
	private int relative_memo_id;
	private float match_weight;
	private int replies_num;
	private int view_num_crawled;
	private String memo_type;
	private String created_time;
	private String match_time;
	private String crawled_time;
	
	

	public String getCrawled_time() {
		return crawled_time;
	}
	public void setCrawled_time(String crawled_time) {
		this.crawled_time = crawled_time;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getMatch_time() {
		return match_time;
	}
	public void setMatch_time(String match_time) {
		this.match_time = match_time;
	}
	public int getOsp_id() {
		return osp_id;
	}
	public void setOsp_id(int osp_id) {
		this.osp_id = osp_id;
	}
	public int getRelative_memo_id() {
		return relative_memo_id;
	}
	public void setRelative_memo_id(int relative_memo_id) {
		this.relative_memo_id = relative_memo_id;
	}
	public float getMatch_weight() {
		return match_weight;
	}
	public void setMatch_weight(float match_weight) {
		this.match_weight = match_weight;
	}
	public String getCreated_time() {
		return created_time;
	}
	public void setCreated_time(String created_time) {
		this.created_time = created_time;
	}

	public int getReplies_num() {
		return replies_num;
	}
	public void setReplies_num(int replies_num) {
		this.replies_num = replies_num;
	}
	public int getView_num_crawled() {
		return view_num_crawled;
	}
	public void setView_num_crawled(int view_num_crawled) {
		this.view_num_crawled = view_num_crawled;
	}
	public String getMemo_type() {
		return memo_type;
	}
	public void setMemo_type(String memo_type) {
		this.memo_type = memo_type;
	}
	

}
