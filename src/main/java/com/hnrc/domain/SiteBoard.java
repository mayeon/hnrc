package com.hnrc.domain;

import java.io.Serializable;

public class SiteBoard implements Serializable {
    private static final long serialVersionUID = 9091162712419361245L;
    private int id;
    private String name;

    private String nameKor;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNameKor() {
        return nameKor;
    }

    public void setNameKor(String nameKor) {
        this.nameKor = nameKor;
    }
}
