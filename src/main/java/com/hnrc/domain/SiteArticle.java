package com.hnrc.domain;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

public class SiteArticle implements Serializable {
    private static final long serialVersionUID = 916419361245L;
    private int id;
    private int boardId;
    private String subject;
    private String name;
    private String contents;
    private int hits;

    private String imgPath;
    private Date regDatetime;
    private Date modDatetime;

    private String sDate;
    private String eDate;

    private int file;
    private List<MultipartFile> files;

    private List<SiteBoardFile> boardFiles;
    private boolean fixed; // 공지사항




    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public int getBoardId() {
        return boardId;
    }

    public void setBoardId(int boardId) {
        this.boardId = boardId;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getsDate() {
        return sDate;
    }

    public void setsDate(String sDate) {
        this.sDate = sDate;
    }

    public String geteDate() {
        return eDate;
    }

    public void seteDate(String eDate) {
        this.eDate = eDate;
    }

    public String getContents() {
        /*contents = contents.replaceAll("\r\n", "<br/>");
        contents = contents.replaceAll("\n", "<br/>");*/
        return contents;
    }

    public String getClearContents(){
        String clearContents = contents.replaceAll("<figure[^>]*>.*?</figure>", "");
        return clearContents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public int getHits() {
        return hits;
    }

    public void setHits(int hits) {
        this.hits = hits;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public Date getRegDatetime() {
        return regDatetime;
    }

    public void setRegDatetime(Date regDatetime) {
        this.regDatetime = regDatetime;
    }

    public Date getModDatetime() {
        return modDatetime;
    }

    public void setModDatetime(Date modDatetime) {
        this.modDatetime = modDatetime;
    }


    public int getFile() {
        return file;
    }

    public void setFile(int file) {
        this.file = file;
    }

    public List<MultipartFile> getFiles() {
        return files;
    }

    public void setFiles(List<MultipartFile> files) {
        this.files = files;
    }

    public List<SiteBoardFile> getBoardFiles() {
        return boardFiles;
    }

    public void setBoardFiles(List<SiteBoardFile> boardFiles) {
        this.boardFiles = boardFiles;
    }

    public boolean isFixed() {
        return fixed;
    }

    public void setFixed(boolean fixed) {
        this.fixed = fixed;
    }



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getKoreanRegDateTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREAN);
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
        return sdf.format(regDatetime);

    }

    public String getKoreanYMD() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREAN);
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
        return sdf.format(regDatetime);

    }
    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
