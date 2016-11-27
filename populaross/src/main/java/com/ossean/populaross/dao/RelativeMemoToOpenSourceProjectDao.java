package com.ossean.populaross.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.ossean.populaross.model.RelativeMemoToOpenSourceProject;


public interface RelativeMemoToOpenSourceProjectDao {
	
	
	@Select("SELECT memo_type,source FROM ${targetTableName} where id=#{memo_id};")
	public Map<String,String> getMemoTypeSource(@Param("memo_id") int memo_id,
			@Param("targetTableName" )String targetTableName);
	
	//获取爬取时间  extracted_time
	@Select("select extracted_time from ${targetTableName} where id=#{memo_id}")
	public String getCrawledTime(
			@Param("memo_id") int memo_id,
			@Param("targetTableName" )String targetTableName);
	
	//项目所有的回复数
	@Select("SELECT SUM(replies_num) as sumreply FROM ${targetTableName} where osp_id=#{osp_id}")
	public int getSumReplyNum(
				@Param("osp_id") int osp_id,
				@Param("targetTableName") String targetTableName);
	
	//项目时间区间的浏览数
//	@Select("SELECT osp_id,relative_memo_id,view_num_crawled,created_time,crawled_time FROM ${targetTableName} where osp_id=#{osp_id}")
//	public List<RelativeMemoToOpenSourceProject> getSumViewNum(
//				@Param("osp_id") int osp_id,
//				@Param("targetTableName") String targetTableName);
	
	
	//项目所有的浏览数和回复数
	@Select("SELECT SUM(replies_num) as sumreply,SUM(view_num_crawled) as sumview FROM ${targetTableName} where osp_id=#{osp_id}")
	public Map<String,Integer> getSumReplyView(
			@Param("osp_id") int osp_id,
			@Param("targetTableName") String targetTableName);
	
	@Select("select * from ${targetTableName} where osp_id = #{osp_id} ")
	public List<RelativeMemoToOpenSourceProject> getResultByOspID(
				@Param("osp_id") int osp_id,
				@Param("targetTableName") String targetTableName);
	
	
	@Select("SELECT count(*) FROM ${targetTableName} where relative_memo_id=#{rm_id} and match_weight > 2")
	public int getRelativeOspNum_HighWeight(@Param("targetTableName") String targetTableName, @Param("rm_id") int rm_id);
	
	
	@Select("SELECT count(*) FROM ${targetTableName} where relative_memo_id=#{rm_id}")
	public int getRelativeOspNum(@Param("targetTableName") String targetTableName, @Param("rm_id") int rm_id);

//	//向rm2osp表插入数据
//	@Insert("insert into ${targetTableName} (osp_id,relative_memo_id,match_weight,replies_num,view_num_crawled,memo_type,created_time,match_time,crawled_time) values (#{item.osp_id},#{item.relative_memo_id},#{item.match_weight},#{item.replies_num},#{item.view_num_crawled},#{item.memo_type},#{item.created_time},#{item.match_time},#{item.crawled_time})")
//	public void insertRm2Osp(@Param("targetTableName") String targetTableName, @Param("item") RelativeMemoToOpenSourceProject item);
	
//	// 读取项目id对应的匹配权重较大的所有关联的帖子
//	@Select("select * from ${targetTableName} where osp_id = #{osp_id} and match_weight > 2 and created_time>'2015-01-01 00:00:00' and created_time<'2016-01-01 00:00:00'")
//	public List<RelativeMemoToOpenSourceProject> getHighWeightMatchResult(
//			@Param("osp_id") int osp_id,
//			@Param("targetTableName") String targetTableName);
//	
//	// 读取表格内所有的数据
//			@Select("select * from ${targetTableName}")
//	public List<RelativeMemoToOpenSourceProject> getAllDataSet(
//					@Param("targetTableName") String targetTableName);
//	
	// 读取项目id对应的所有关联的帖子
	@Select("select * from ${targetTableName} where osp_id = #{osp_id}")
	public List<RelativeMemoToOpenSourceProject> getMatchRelativeMemo(
			@Param("osp_id") int osp_id,
			@Param("targetTableName") String targetTableName);
	
	// 读取项目id在一定时间区间对应的所有关联的帖子
	@Select("select * from ${targetTableName} where osp_id = #{osp_id} and created_time>'2015-01-01 00:00:00' and created_time<'2016-11-01 00:00:00'")
	public List<RelativeMemoToOpenSourceProject> getMatchRelativeMemoWithInterval(
			@Param("osp_id") int osp_id,
			@Param("targetTableName") String targetTableName);
}
