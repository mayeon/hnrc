package com.hnrc.repository;

import com.hnrc.domain.SiteFile;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SiteFileMapper {


    @Select("select * from site_file where id = #{fileId}")
    SiteFile findOne(@Param("fileId") int fileId);

    @Select("select * from site_file where  type = #{type} order by id desc limit 1")
    SiteFile findBySiteIdType(@Param("type") String type);

    @Select("select * from site_file where type = #{type}")
    List<SiteFile> findBannerByType( @Param("type") String type);


    @Insert("insert into site_file ( name, path,reg_datetime, type) values (#{name}, #{path},UTC_TIMESTAMP(), #{type})")
    @SelectKey(statement = "select @@identity", keyProperty = "id", before = false, resultType = int.class)
    @Options(flushCache = Options.FlushCachePolicy.TRUE)
    void insert(SiteFile siteFile);

    @Delete("DELETE FROM site_file WHERE type = #{type}")
    void deleteBySiteIdType(@Param("type") String type);

    @Delete("DELETE FROM site_file WHERE id = ${id}")
    void deleteById(@Param("id") int id);

    @Update("UPDATE `site_file` SET"+
            "`name` = #{name},"+
            "`path` = #{path},"+
            "`type` = #{type}"+
            "WHERE `id` = #{id}")
    @Options(flushCache = Options.FlushCachePolicy.TRUE)
    void update(SiteFile siteFile);
}
