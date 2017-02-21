package com.ossean.populaross.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ossean.populaross.model.OSPForRanking;
import com.ossean.populaross.model.OpenSourceProject;
import com.ossean.populaross.model.OspRankingMemos;


public interface OpenSourceProjectDao {
	
	@Select("select id from ${table} where name=#{ospname}")
	public int getOspIdFromOSPByName(@Param("table") String table,@Param("ospname") String ospname);
	
	//INSERT POINTER
	@Insert("insert into ${table} (`SourceTableName`,`TargetTableName`,`Pointer`) values (#{SourceTableName},#{TargetTableName},#{Pointer})")
	public void insertPointer(@Param("table") String table, @Param("SourceTableName") String SourceTableName, @Param("TargetTableName") String TargetTableName, @Param("Pointer") int Pointer);
	
	//read pointer
	@Select("select Pointer from ${table} where SourceTableName=#{SourceTableName} and TargetTableName=#{TargetTableName}")
	public int getPointer(@Param("table") String table, @Param("SourceTableName") String SourceTableName, @Param("TargetTableName") String TargetTableName);
	
	@Update("update ${table} set Pointer=#{Pointer} where SourceTableName=#{SourceTableName} and TargetTableName=#{TargetTableName}")
	public void updatePointer(@Param("table") String table, @Param("SourceTableName") String SourceTableName, @Param("TargetTableName") String TargetTableName, @Param("Pointer") int Pointer);
	
	//读取表中最小id值
	@Select("select min(id) from ${table}")
	public int getMinId(@Param("table") String table);
		
	//读取表中最大id值
	@Select("select max(id) from ${table}")
	public int getMaxId(@Param("table") String table);
	
	@Select("select count(*) from ${table}")
	public int getOspNum(@Param("table") String table);
		
//	@Select("select name,relative_memos_num from open_source_projects where name=#{ospname}")
//	public OspRankingMemos getRelativeMemoNum(
//			@Param("ospname") String ospname);
//	
//	@Select("select id from open_source_projects where name=#{ospname}")
//	public int getOspIdFromOSP(
//			@Param("ospname") String ospname);
//	
//	@Select("select view_num from open_source_projects where id=#{id}")
//	public int getOspViewNumFromOSP(
//			@Param("id") int id);

	// 读取一定数量的项目信息
	@Select("select * from ${table} where id>=#{start} and filtration=2 limit #{size}")
	public List<OpenSourceProject> getProjectsByBatch(@Param("table") String table,
			@Param("start") int start,@Param("size") int size);
	
	// 读取一定数量的项目信息
	@Select("select * from ${table} where id>#{start} and id<=#{stop} and filtration=2 limit #{size}")
	public List<OpenSourceProject> getProjectsByBatchWithInterval(@Param("table") String table,
			@Param("start") int start,@Param("stop") int stop ,@Param("size") int size);

//	//更新项目标签字段tags和权重更高的标签字段tags_for_search
//	@Update("update open_source_projects set tags=#{tags}, tags_for_search = #{tagsForSearch} where id=#{id}")
//	public void updatePrjTags(@Param("id") int id,
//			@Param("tags") String tags,
//			@Param("tagsForSearch") String tagsForSearch);
//
//	// 对项目标签属性进行更新
//	@Update("update open_source_projects set tags=#{tags}, tags_for_search = #{tagsForSearch} where id=#{id}")
//	public void updateTagsOfProject(@Param("id") int id,
//			@Param("tags") String tags);

	// 批量获取项目
//	@Select("select id,source,url,filtration from open_source_projects limit #{batchSize}")
//	public List<OpenSourceProject> getBatchPrjs(
//			@Param("batchSize") int batchSize);
//
//	// filtration为1表示保留，为2表示之前保留的且已处理，为0表示不保留
//	@Update("update open_source_projects set filtration = #{filtration} where id = #{prjId}")
//	public void updateFiltratedPrj(@Param("prjId") int prjId,
//			@Param("filtration") int filtration);
//
//	@Update("UPDATE open_source_projects SET tags = ''")
//	public void emptyOspTags();
	
	@Update("update ${table} set composite_score  = #{score},relative_memos_num  = #{relative_memos_num}  where id = #{prjId}")
	public void updateOpenSourceProjectScore(@Param("table") String table,@Param("prjId") int prjId,@Param("score") double score,@Param("relative_memos_num") int  relative_memos_num);
	
	@Update("update ${table} set relative_memos_num  = #{relative_memos_num} where id = #{prjId}")
	public void updateOpenSourceProjectMemosNum(@Param("table") String table,@Param("prjId") int prjId,@Param("relative_memos_num") int  relative_memos_num);
}
