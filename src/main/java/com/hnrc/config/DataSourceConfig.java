package com.hnrc.config;


import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;

@Configuration
public class DataSourceConfig {

    @Value("${jdbc.url}")
    private String url;
    @Value("${jdbc.username}")
    private String username;
    @Value("${jdbc.password}")
    private String password;

    @Bean
    public DataSource dataSource() {

        HikariConfig config = new HikariConfig();
        config.setMinimumIdle(12); //최소 커넥션 개수
        config.setMaximumPoolSize(300); //최대 커넥션 개수
        config.setConnectionTimeout(10000); //풀에서 connection을 얻을 때 최대 대기 시간 10초
        config.setDriverClassName("com.mysql.cj.jdbc.Driver");
        config.setJdbcUrl(url);
        config.setUsername(username);
        config.setPassword(password);
        return new HikariDataSource(config);
    }

    @Bean
    public DataSourceTransactionManager transactionManager() {
        return new DataSourceTransactionManager(dataSource());
    }


}
