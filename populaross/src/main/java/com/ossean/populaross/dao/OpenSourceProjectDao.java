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
	
	@Select("select count(*) from ${table} where filtration = 2")
	public int getOspNum(@Param("table") String table);
		
	// 读取一定数量的项目信息
	@Select("select * from ${table} where id>=#{start} and filtration=2 limit #{size}")
	public List<OpenSourceProject> getProjectsByBatch(@Param("table") String table,
			@Param("start") int start,@Param("size") int size);
	
	// 读取一定数量的项目信息
	@Select("select * from ${table} where id>#{start} and id<=#{stop} and filtration=2 limit #{size}")
	public List<OpenSourceProject> getProjectsByBatchWithInterval(@Param("table") String table,
			@Param("start") int start,@Param("stop") int stop ,@Param("size") int size);
	
	// 读取一定数量的项目信息
	@Select("select * from ${table} where filtration=2 limit #{startId},#{size}")
	public List<OpenSourceProject> getProjectsByBatchWithLimit(@Param("table") String table,
			@Param("startId") int startId,@Param("size") int size);

	
	@Update("update ${table} set composite_score  = #{score},relative_memos_num  = #{relative_memos_num}  where id = #{prjId}")
	public void updateOpenSourceProjectScore(@Param("table") String table,@Param("prjId") int prjId,@Param("score") double score,@Param("relative_memos_num") int  relative_memos_num);
	
	@Update("update ${table} set composite_score  = #{score},relative_memos_num  = #{relative_memos_num} where name = #{name}")
	public void updateOpenSourceProjectWithName(@Param("table") String table,@Param("name") String name,@Param("score") double score,@Param("relative_memos_num") int  relative_memos_num);
}
