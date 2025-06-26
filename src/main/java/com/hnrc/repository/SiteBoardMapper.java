package com.hnrc.repository;


import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import com.hnrc.domain.SiteArticle;
import com.hnrc.domain.SiteBoard;

import java.util.List;

@Repository
@CacheNamespace
public interface SiteBoardMapper {
    @Select("SELECT * FROM `site_board` WHERE name_Eng = #{name} limit 1")
    SiteBoard findByPageName(@Param("name") String boardName);


    @Select("SELECT * FROM `site_board` WHERE id = #{boardId} limit 1")
    SiteBoard findByBoardId(@Param("boardId") int boardId);

    @Select("SELECT count(*) FROM `site_article` WHERE board_id = #{boardId} order by reg_datetime desc")
    int countArticleByBoardId(@Param("boardId") int boardId);

    @Select("SELECT count(*) FROM `site_article` WHERE board_id = #{boardId} order by reg_datetime desc")
    int findArticleByBoardIdLength(@Param("boardId") int boardId);

    @Select("SELECT * FROM `site_article` WHERE board_id = #{boardId} order by reg_datetime desc LIMIT 9 OFFSET #{offset};")
    List<SiteArticle> findArticleByBoardIdLimit10(@Param("boardId") int boardId, @Param("offset") int offset);

    @Select("SELECT * FROM `site_article` WHERE board_id = #{boardId} order by reg_datetime desc")
    List<SiteArticle> findArticleByBoardId(@Param("boardId") int boardId);

    @Select("SELECT * FROM `site_article` WHERE board_id = #{boardId} and fixed = 1 order by reg_datetime desc")
    List<SiteArticle> findArticleByBoardIdFixed(@Param("boardId") int boardId);

    @Select("SELECT * FROM `site_article` WHERE board_id = #{boardId} and fixed = 0 order by reg_datetime desc")
    List<SiteArticle> findArticleByBoardIdFixed0(@Param("boardId") int boardId);

    @Select("SELECT * FROM `site_article` WHERE board_id = #{boardId} order by reg_datetime desc limit ${limit}")
    List<SiteArticle> findLatestArticleByBoardIdLimit(@Param("boardId") int boardId, @Param("limit") int limit);

    @Select("SELECT * FROM `site_article` WHERE board_id = #{boardId} order by fixed desc, reg_datetime desc")
    List<SiteArticle> findLatestArticleOrderByFixedAndRegAll(@Param("boardId") int boardId);

    @Select("SELECT * FROM `site_article` WHERE board_id = #{boardId} order by reg_datetime asc")
    List<SiteArticle> findAllArticleByBoardId(@Param("boardId") int boardId);


    @Select("SELECT * FROM `site_article` WHERE id = #{articleId}")
    SiteArticle findArticleByArticleId(@Param("articleId")int articleId);

    @Select("SELECT * FROM `site_article` WHERE board_id = #{boardId} limit 1")
    SiteArticle findArticleOneByBoardId(@Param("boardId") int boardId);

    @Select("SELECT nameKor FROM `site_board` WHERE id = #{boardId}")
    String findBoardNameByArticle(@Param("boardId") int boardId);


    @Select("SELECT name FROM `site_board` WHERE id = #{boardId}")
    String findBoardNameOByArticle(@Param("boardId") int boardId);


    @Update("UPDATE site_article SET " +
            "hits = #{hit} WHERE id = #{articleId}")
    void updateArticleHits(@Param("articleId") int articleId, @Param("hit") int hit);

    @Insert("INSERT INTO site_article ("+
            "`board_id`, " +
            "`subject`, " +
            "`name`, " +
            "`s_date`, " +
            "`e_date`, " +
            "`contents`, " +
            "`fixed`, " +
            "`reg_datetime`) " +
            "VALUES (" +
            "#{boardId}, " +
            "#{subject}, " +
            "#{name}, " +
            "#{sDate}, " +
            "#{eDate}, " +
            "#{contents}, " +
            "#{fixed}, " +
            "UTC_TIMESTAMP());")
    @SelectKey(statement = "select @@identity", keyProperty = "id", before = false, resultType = int.class)
    @Options(flushCache = Options.FlushCachePolicy.TRUE)
    void insert(SiteArticle siteArticle);


    @Update("UPDATE `site_article` SET " +
            " `subject` = #{subject}," +
            " `contents` = #{contents}," +
            " `name` = #{name}," +
            " `s_date` = #{sDate}," +
            " `e_date` = #{eDate}," +
            " `mod_datetime` = now()," +
            " `fixed` = #{fixed}" +
            " WHERE id = #{id}")
    @Options(flushCache = Options.FlushCachePolicy.TRUE)
    void update(SiteArticle siteArticle);

    @Delete("DELETE FROM `site_article` WHERE id = #{id}")
    @Options(flushCache = Options.FlushCachePolicy.TRUE)
    void deleteById(@Param("id") int id);

    @Update("UPDATE site_article SET file=#{num} WHERE id =#{id}")
    void updateFile(@Param("num") int num, @Param("id") int id);
}
