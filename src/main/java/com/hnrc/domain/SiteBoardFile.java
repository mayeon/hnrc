package com.hnrc.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by kyeongseokjeong on 30/09/2019.
 */
public class SiteBoardFile implements Serializable{

    private static final long serialVersionUID = 962738219361245L;
    private int id;
    private int articleId;
    private String name;
    private String path;
    private Date regDatetime;

    public int getFileId() {
        return id;
    }

    public void setFileId(int fileId) {
        this.id = id;
    }

    public int getArticleId() {
        return articleId;
    }

    public void setArticleId(int articleId) {
        this.articleId = articleId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Date getRegDatetime() {
        return regDatetime;
    }

    public void setRegDatetime(Date regDatetime) {
        this.regDatetime = regDatetime;
    }
}
