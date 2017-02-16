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
	int stackOverFlowReplyNum;
	double stackOverFlowViewNum;
	int oschinaTopicReplyNum;
	double oschinaTopicViewNum;
	int _51cto_blogReplyNum;
	double _51cto_blogViewNum;
	int csdnBlogReplyNum;
	double csdnBlogViewNum;
	int csdnaskReplyNum;
	double csdnaskViewNum;
	int csdnbbsReplyNum;
	double csdnbbsViewNum;
	int cnblogsTopicReplyNum;
	double cnblogsTopicViewNum;
	int dewenTopicReplyNum;
	double dewenTopicViewNum;
	int bokeyuanReplyNum;
	double bokeyuanViewNum;
//	int iteyeTopicReplyNum;
//	double iteyeTopicViewNum;
//	int iteyeBlogReplyNum;
//	double iteyeBlogViewNum;
//	int slashdotReplyNum;
//	double slashdotViewNum;
//	int linuxtoneReplyNum;
//	double linuxtoneViewNum;
//	int phpChinaReplyNum;
//	double phpChinaViewNum;
	public int getOsp_id() {
		return osp_id;
	}
	public void setOsp_id(int osp_id) {
		this.osp_id = osp_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getStackOverFlowReplyNum() {
		return stackOverFlowReplyNum;
	}
	public void setStackOverFlowReplyNum(int stackOverFlowReplyNum) {
		this.stackOverFlowReplyNum = stackOverFlowReplyNum;
	}
	public double getStackOverFlowViewNum() {
		return stackOverFlowViewNum;
	}
	public void setStackOverFlowViewNum(double stackOverFlowViewNum) {
		this.stackOverFlowViewNum = stackOverFlowViewNum;
	}
	public int getOschinaTopicReplyNum() {
		return oschinaTopicReplyNum;
	}
	public void setOschinaTopicReplyNum(int oschinaTopicReplyNum) {
		this.oschinaTopicReplyNum = oschinaTopicReplyNum;
	}
	public double getOschinaTopicViewNum() {
		return oschinaTopicViewNum;
	}
	public void setOschinaTopicViewNum(double oschinaTopicViewNum) {
		this.oschinaTopicViewNum = oschinaTopicViewNum;
	}
	public int get_51cto_blogReplyNum() {
		return _51cto_blogReplyNum;
	}
	public void set_51cto_blogReplyNum(int _51cto_blogReplyNum) {
		this._51cto_blogReplyNum = _51cto_blogReplyNum;
	}
	public double get_51cto_blogViewNum() {
		return _51cto_blogViewNum;
	}
	public void set_51cto_blogViewNum(double _51cto_blogViewNum) {
		this._51cto_blogViewNum = _51cto_blogViewNum;
	}
	public int getCsdnBlogReplyNum() {
		return csdnBlogReplyNum;
	}
	public void setCsdnBlogReplyNum(int csdnBlogReplyNum) {
		this.csdnBlogReplyNum = csdnBlogReplyNum;
	}
	public double getCsdnBlogViewNum() {
		return csdnBlogViewNum;
	}
	public void setCsdnBlogViewNum(double csdnBlogViewNum) {
		this.csdnBlogViewNum = csdnBlogViewNum;
	}
	public int getCsdnaskReplyNum() {
		return csdnaskReplyNum;
	}
	public void setCsdnaskReplyNum(int csdnaskReplyNum) {
		this.csdnaskReplyNum = csdnaskReplyNum;
	}
	public double getCsdnaskViewNum() {
		return csdnaskViewNum;
	}
	public void setCsdnaskViewNum(double csdnaskViewNum) {
		this.csdnaskViewNum = csdnaskViewNum;
	}
	public int getCsdnbbsReplyNum() {
		return csdnbbsReplyNum;
	}
	public void setCsdnbbsReplyNum(int csdnbbsReplyNum) {
		this.csdnbbsReplyNum = csdnbbsReplyNum;
	}
	public double getCsdnbbsViewNum() {
		return csdnbbsViewNum;
	}
	public void setCsdnbbsViewNum(double csdnbbsViewNum) {
		this.csdnbbsViewNum = csdnbbsViewNum;
	}
	public int getCnblogsTopicReplyNum() {
		return cnblogsTopicReplyNum;
	}
	public void setCnblogsTopicReplyNum(int cnblogsTopicReplyNum) {
		this.cnblogsTopicReplyNum = cnblogsTopicReplyNum;
	}
	public double getCnblogsTopicViewNum() {
		return cnblogsTopicViewNum;
	}
	public void setCnblogsTopicViewNum(double cnblogsTopicViewNum) {
		this.cnblogsTopicViewNum = cnblogsTopicViewNum;
	}
	public int getDewenTopicReplyNum() {
		return dewenTopicReplyNum;
	}
	public void setDewenTopicReplyNum(int dewenTopicReplyNum) {
		this.dewenTopicReplyNum = dewenTopicReplyNum;
	}
	public double getDewenTopicViewNum() {
		return dewenTopicViewNum;
	}
	public void setDewenTopicViewNum(double dewenTopicViewNum) {
		this.dewenTopicViewNum = dewenTopicViewNum;
	}
	public int getBokeyuanReplyNum() {
		return bokeyuanReplyNum;
	}
	public void setBokeyuanReplyNum(int bokeyuanReplyNum) {
		this.bokeyuanReplyNum = bokeyuanReplyNum;
	}
	public double getBokeyuanViewNum() {
		return bokeyuanViewNum;
	}
	public void setBokeyuanViewNum(double bokeyuanViewNum) {
		this.bokeyuanViewNum = bokeyuanViewNum;
	}
//	public int getIteyeTopicReplyNum() {
//		return iteyeTopicReplyNum;
//	}
//	public void setIteyeTopicReplyNum(int iteyeTopicReplyNum) {
//		this.iteyeTopicReplyNum = iteyeTopicReplyNum;
//	}
//	public double getIteyeTopicViewNum() {
//		return iteyeTopicViewNum;
//	}
//	public void setIteyeTopicViewNum(double iteyeTopicViewNum) {
//		this.iteyeTopicViewNum = iteyeTopicViewNum;
//	}
//	public int getIteyeBlogReplyNum() {
//		return iteyeBlogReplyNum;
//	}
//	public void setIteyeBlogReplyNum(int iteyeBlogReplyNum) {
//		this.iteyeBlogReplyNum = iteyeBlogReplyNum;
//	}
//	public double getIteyeBlogViewNum() {
//		return iteyeBlogViewNum;
//	}
//	public void setIteyeBlogViewNum(double iteyeBlogViewNum) {
//		this.iteyeBlogViewNum = iteyeBlogViewNum;
//	}
//	public int getSlashdotReplyNum() {
//		return slashdotReplyNum;
//	}
//	public void setSlashdotReplyNum(int slashdotReplyNum) {
//		this.slashdotReplyNum = slashdotReplyNum;
//	}
//	public double getSlashdotViewNum() {
//		return slashdotViewNum;
//	}
//	public void setSlashdotViewNum(double slashdotViewNum) {
//		this.slashdotViewNum = slashdotViewNum;
//	}
//	public int getLinuxtoneReplyNum() {
//		return linuxtoneReplyNum;
//	}
//	public void setLinuxtoneReplyNum(int linuxtoneReplyNum) {
//		this.linuxtoneReplyNum = linuxtoneReplyNum;
//	}
//	public double getLinuxtoneViewNum() {
//		return linuxtoneViewNum;
//	}
//	public void setLinuxtoneViewNum(double linuxtoneViewNum) {
//		this.linuxtoneViewNum = linuxtoneViewNum;
//	}
//	public int getPhpChinaReplyNum() {
//		return phpChinaReplyNum;
//	}
//	public void setPhpChinaReplyNum(int phpChinaReplyNum) {
//		this.phpChinaReplyNum = phpChinaReplyNum;
//	}
//	public double getPhpChinaViewNum() {
//		return phpChinaViewNum;
//	}
//	public void setPhpChinaViewNum(double phpChinaViewNum) {
//		this.phpChinaViewNum = phpChinaViewNum;
//	}
	
	
	
	


}
