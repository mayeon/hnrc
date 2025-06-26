package com.hnrc.repository;

import com.hnrc.domain.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

@Repository(value="userMapper")
@CacheNamespace
public interface UserMapper {

    @Select("select * from users where id = #{id}")
    User findOne(@Param("id") int id);

    @Select("select * from users where username = #{username} limit 1")
    User findByUsername(@Param("username") String username);


    @Select("select * from users where username = #{username} and password = #{password} limit 1")
    User findByUsernamePassword(@Param("username") String username, @Param("password") String password);


    @Insert("INSERT INTO users ( USERNAME, PASSWORD" +
            ") VALUES ( #{username}, #{password} " +
            ")")
    @Options(flushCache = Options.FlushCachePolicy.TRUE)
    @SelectKey(statement = "select @@identity", keyProperty = "id", before = false, resultType = int.class)
    void insert(User user);


    @Update("UPDATE users SET " +
            "USERNAME = #{username}, " +
            "password = #{password} " +
            "WHERE ID = #{id}")
    @Options(flushCache = Options.FlushCachePolicy.TRUE)
    void update(User user);

    @Update("UPDATE users SET password = #{password}, LAST_CHANGE = UTC_TIMESTAMP() WHERE ID = #{id}")
    @Options(flushCache = Options.FlushCachePolicy.TRUE)
    void updatePassword(User user);


}



