package com.hnrc.repository;

import com.hnrc.domain.Comment;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentMapper {
    @Insert("INSERT INTO `comment`("+
            "`article_id`,"+
            "`content`,"+
            "`registered_date`"+
            ")VALUES("+
            "#{articleId},"+
            "#{content},"+
            "UTC_TIMESTAMP()"+
            ")")
    @SelectKey(statement = "select @@identity", keyProperty = "id", before = false, resultType = int.class)
    @Options(flushCache = Options.FlushCachePolicy.TRUE)
    void insert(Comment comment);

    @Update("UPDATE `comment`SET "+
            "`content` = #{content} "+
            "WHERE `id` = #{id}")
    @Options(flushCache = Options.FlushCachePolicy.TRUE)
    void update(Comment comment);


    @Select("SELECT * FROM `comment` where `id` = #{id}")
    Comment findOne(@Param("id") int id);



    @Select("SELECT * FROM `comment` where `article_id` = #{articleId} order by registered_date asc")
    List<Comment> findByArticleId(@Param("articleId") int articleId);


    @Select("SELECT count(*) FROM `comment` where `article_id` = #{articleId}")
    int countByArticleId(@Param("articleId") int articleId);

    @Delete("DELETE FROM `comment` WHERE id = #{id}")
    void delete(Comment comment);

}
