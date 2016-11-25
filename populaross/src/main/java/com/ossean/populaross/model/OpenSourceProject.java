package com.ossean.populaross.model;

public class OpenSourceProject {
	

	private int id;
	private String url;
	private String name;
	private String source;
	private int filration;
	private int followers_num;
	private String language;
	private int download_num;
	private int view_num_crawled;
	private String category;
	private String crawled_time;
	private int view_num_local;
	private String created_at;
	private String updated_at;
	private int ossean_score;
	private int relative_memos_num;
	private String created_time;
	private String updated_time;
	private String tags;

	public String getUrl(){
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
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
	
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public int getFilration() {
		return filration;
	}
	public void setFilration(int filration) {
		this.filration = filration;
	}
	public int getFollowers_num() {
		return followers_num;
	}
	public void setFollowers_num(int followers_num) {
		this.followers_num = followers_num;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public int getDownload_num() {
		return download_num;
	}
	public void setDownload_num(int download_num) {
		this.download_num = download_num;
	}
	public int getView_num_crawled() {
		return view_num_crawled;
	}
	public void setView_num_crawled(int view_num_crawled) {
		this.view_num_crawled = view_num_crawled;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCrawled_time() {
		return crawled_time;
	}
	public void setCrawled_time(String crawled_time) {
		this.crawled_time = crawled_time;
	}
	public int getView_num_local() {
		return view_num_local;
	}
	public void setView_num_local(int view_num_local) {
		this.view_num_local = view_num_local;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}
	public int getOssean_score() {
		return ossean_score;
	}
	public void setOssean_score(int ossean_score) {
		this.ossean_score = ossean_score;
	}
	public int getRelative_memos_num() {
		return relative_memos_num;
	}
	public void setRelative_memos_num(int relative_memos_num) {
		this.relative_memos_num = relative_memos_num;
	}
	public String getCreated_time() {
		return created_time;
	}
	public void setCreated_time(String created_time) {
		this.created_time = created_time;
	}
	public String getUpdated_time() {
		return updated_time;
	}
	public void setUpdated_time(String updated_time) {
		this.updated_time = updated_time;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	
}
