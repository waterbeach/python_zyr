package com.ossean.populaross.model;

public class OpenSourceProjectForRank {
/*对于每一个社区，按帖子类型划分
 * 51cto_blog
 * cnblogs
 * CSDN
 * DEWEN
 * linuxtone
 * OSChina
 * PhpChina
 * slashdot
 * StackOverflow
 * ITeye
 */ 
	int osp_id;
	String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	int stackOverFlowReplyNum;
	int stackOverFlowViewNum;
	int oschinaTopicReplyNum;
	int oschinaTopicViewNum;
	int _51cto_blogReplyNum;
	int _51cto_blogViewNum;
	int csdnBlogReplyNum;
	int csdnBlogViewNum;
	int csdnTopicReplyNum;
	int csdnTopicViewNum;
	int csdnNewsReplyNum;
	int csdnNewsViewNum;
	int cnblogsNewsReplyNum;
	int cnblogsNewsViewNum;
	int cnblogsTopicReplyNum;
	int cnblogsTopicViewNum;
	int dewenTopicReplyNum;
	int dewenTopicViewNum;
	int iteyeTopicReplyNum;
	int iteyeTopicViewNum;
	int iteyeBlogReplyNum;
	int iteyeBlogViewNum;
	int slashdotReplyNum;
	int slashdotViewNum;
	int linuxtoneReplyNum;
	int linuxtoneViewNum;
	int phpChinaReplyNum;
	int phpChinaViewNum;
	
	public int getOsp_id() {
		return osp_id;
	}
	public void setOsp_id(int osp_id) {
		this.osp_id = osp_id;
	}
	public int getLinuxtoneReplyNum() {
		return linuxtoneReplyNum;
	}
	public void setLinuxtoneReplyNum(int linuxtoneReplyNum) {
		this.linuxtoneReplyNum = linuxtoneReplyNum;
	}
	public int getLinuxtoneViewNum() {
		return linuxtoneViewNum;
	}
	public void setLinuxtoneViewNum(int linuxtoneViewNum) {
		this.linuxtoneViewNum = linuxtoneViewNum;
	}
	public int getPhpChinaReplyNum() {
		return phpChinaReplyNum;
	}
	public void setPhpChinaReplyNum(int phpChinaReplyNum) {
		this.phpChinaReplyNum = phpChinaReplyNum;
	}
	public int getPhpChinaViewNum() {
		return phpChinaViewNum;
	}
	public void setPhpChinaViewNum(int phpChinaViewNum) {
		this.phpChinaViewNum = phpChinaViewNum;
	}
	public int getStackOverFlowReplyNum() {
		return stackOverFlowReplyNum;
	}
	public void setStackOverFlowReplyNum(int stackOverFlowReplyNum) {
		this.stackOverFlowReplyNum = stackOverFlowReplyNum;
	}
	public int getStackOverFlowViewNum() {
		return stackOverFlowViewNum;
	}
	public void setStackOverFlowViewNum(int stackOverFlowViewNum) {
		this.stackOverFlowViewNum = stackOverFlowViewNum;
	}
	public int getOschinaTopicReplyNum() {
		return oschinaTopicReplyNum;
	}
	public void setOschinaTopicReplyNum(int oschinaTopicReplyNum) {
		this.oschinaTopicReplyNum = oschinaTopicReplyNum;
	}
	public int getOschinaTopicViewNum() {
		return oschinaTopicViewNum;
	}
	public void setOschinaTopicViewNum(int oschinaTopicViewNum) {
		this.oschinaTopicViewNum = oschinaTopicViewNum;
	}
	public int get_51cto_blogReplyNum() {
		return _51cto_blogReplyNum;
	}
	public void set_51cto_blogReplyNum(int _51cto_blogReplyNum) {
		this._51cto_blogReplyNum = _51cto_blogReplyNum;
	}
	public int get_51cto_blogViewNum() {
		return _51cto_blogViewNum;
	}
	public void set_51cto_blogViewNum(int _51cto_blogViewNum) {
		this._51cto_blogViewNum = _51cto_blogViewNum;
	}
	public int getCsdnBlogReplyNum() {
		return csdnBlogReplyNum;
	}
	public void setCsdnBlogReplyNum(int csdnBlogReplyNum) {
		this.csdnBlogReplyNum = csdnBlogReplyNum;
	}
	public int getCsdnBlogViewNum() {
		return csdnBlogViewNum;
	}
	public void setCsdnBlogViewNum(int csdnBlogViewNum) {
		this.csdnBlogViewNum = csdnBlogViewNum;
	}
	public int getCsdnTopicReplyNum() {
		return csdnTopicReplyNum;
	}
	public void setCsdnTopicReplyNum(int csdnTopicReplyNum) {
		this.csdnTopicReplyNum = csdnTopicReplyNum;
	}
	public int getCsdnTopicViewNum() {
		return csdnTopicViewNum;
	}
	public void setCsdnTopicViewNum(int csdnTopicViewNum) {
		this.csdnTopicViewNum = csdnTopicViewNum;
	}
	public int getCsdnNewsReplyNum() {
		return csdnNewsReplyNum;
	}
	public void setCsdnNewsReplyNum(int csdnNewsReplyNum) {
		this.csdnNewsReplyNum = csdnNewsReplyNum;
	}
	public int getCsdnNewsViewNum() {
		return csdnNewsViewNum;
	}
	public void setCsdnNewsViewNum(int csdnNewsViewNum) {
		this.csdnNewsViewNum = csdnNewsViewNum;
	}
	public int getCnblogsNewsReplyNum() {
		return cnblogsNewsReplyNum;
	}
	public void setCnblogsNewsReplyNum(int cnblogsNewsReplyNum) {
		this.cnblogsNewsReplyNum = cnblogsNewsReplyNum;
	}
	public int getCnblogsNewsViewNum() {
		return cnblogsNewsViewNum;
	}
	public void setCnblogsNewsViewNum(int cnblogsNewsViewNum) {
		this.cnblogsNewsViewNum = cnblogsNewsViewNum;
	}
	public int getCnblogsTopicReplyNum() {
		return cnblogsTopicReplyNum;
	}
	public void setCnblogsTopicReplyNum(int cnblogsTopicReplyNum) {
		this.cnblogsTopicReplyNum = cnblogsTopicReplyNum;
	}
	public int getCnblogsTopicViewNum() {
		return cnblogsTopicViewNum;
	}
	public void setCnblogsTopicViewNum(int cnblogsTopicViewNum) {
		this.cnblogsTopicViewNum = cnblogsTopicViewNum;
	}
	public int getDewenTopicReplyNum() {
		return dewenTopicReplyNum;
	}
	public void setDewenTopicReplyNum(int dewenTopicReplyNum) {
		this.dewenTopicReplyNum = dewenTopicReplyNum;
	}
	public int getDewenTopicViewNum() {
		return dewenTopicViewNum;
	}
	public void setDewenTopicViewNum(int dewenTopicViewNum) {
		this.dewenTopicViewNum = dewenTopicViewNum;
	}
	public int getIteyeTopicReplyNum() {
		return iteyeTopicReplyNum;
	}
	public void setIteyeTopicReplyNum(int iteyeTopicReplyNum) {
		this.iteyeTopicReplyNum = iteyeTopicReplyNum;
	}
	public int getIteyeTopicViewNum() {
		return iteyeTopicViewNum;
	}
	public void setIteyeTopicViewNum(int iteyeTopicViewNum) {
		this.iteyeTopicViewNum = iteyeTopicViewNum;
	}
	public int getIteyeBlogReplyNum() {
		return iteyeBlogReplyNum;
	}
	public void setIteyeBlogReplyNum(int iteyeBlogReplyNum) {
		this.iteyeBlogReplyNum = iteyeBlogReplyNum;
	}
	public int getIteyeBlogViewNum() {
		return iteyeBlogViewNum;
	}
	public void setIteyeBlogViewNum(int iteyeBlogViewNum) {
		this.iteyeBlogViewNum = iteyeBlogViewNum;
	}
	public int getSlashdotReplyNum() {
		return slashdotReplyNum;
	}
	public void setSlashdotReplyNum(int slashdotReplyNum) {
		this.slashdotReplyNum = slashdotReplyNum;
	}
	public int getSlashdotViewNum() {
		return slashdotViewNum;
	}
	public void setSlashdotViewNum(int slashdotViewNum) {
		this.slashdotViewNum = slashdotViewNum;
	}
	
	
	


}
