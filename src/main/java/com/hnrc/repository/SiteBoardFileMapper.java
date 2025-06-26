package com.hnrc.repository;

import com.hnrc.domain.SiteBoardFile;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by kyeongseokjeong on 30/09/2019.
 */

@Repository
@CacheNamespace
public interface SiteBoardFileMapper {

    @Insert("INSERT INTO site_board_file (ARTICLE_ID, NAME, PATH) VALUES (#{articleId}, #{name}, #{path})")
    //    @SelectKey(statement = "select @@identity", keyProperty = "fileId", before = false, resultType = int.class)
    void insert(SiteBoardFile boardFile);

    @Select("SELECT * FROM site_board_file WHERE article_id = #{articleId}")
    List<SiteBoardFile> findByArticleId(@Param("articleId") int articleId);

    @Select("SELECT * FROM site_board_file WHERE article_id = #{articleId} LIMIT 1")
    SiteBoardFile findImage(@Param("articleId") int articleId);

    @Select("SELECT * FROM site_board_file WHERE article_id = #{articleId} AND id = #{fileId}")
    SiteBoardFile findPathByArticleIdAndFileId(@Param("articleId") int articleId, @Param("fileId") int fileId);

    @Select("SELECT * FROM site_board_file WHERE id = #{fileId}")
    SiteBoardFile findOne(@Param("fileId") int fileId);

    @Select("SELECT * FROM site_board_file WHERE article_id = #{articleId}")
    List<SiteBoardFile> findAll(@Param("articleId") int articleId);

    @Delete("DELETE FROM site_board_file WHERE id = #{fileId}")
    void delete(SiteBoardFile siteBoardFile);

    @Delete("DELETE FROM site_board_file WHERE article_id = #{articleId}")
    void deleteByArticle(@Param("articleId") int articleId);

    @Select("SELECT id FROM site_board_file order by reg_datetime desc limit 1")
    int findFileId();

    @Select(" SELECT path FROM site_board_file where article_id = #{articleId} LIMIT 1;")
    String findImageByArticleId(@Param("articleId") int articleId);

}



