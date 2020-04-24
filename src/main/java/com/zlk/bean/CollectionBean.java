package com.zlk.bean;

public class CollectionBean {
    private Integer colId;

    private String colName;

    private String aName;

    private String colImg;

    @Override
    public String toString() {
        return "CollectionBean{" +
                "colId=" + colId +
                ", colName='" + colName + '\'' +
                ", aName='" + aName + '\'' +
                ", colImg='" + colImg + '\'' +
                '}';
    }

    public Integer getColId() {
        return colId;
    }

    public void setColId(Integer colId) {
        this.colId = colId;
    }

    public String getColName() {
        return colName;
    }

    public void setColName(String colName) {
        this.colName = colName == null ? null : colName.trim();
    }

    public String getaName() {
        return aName;
    }

    public void setaName(String aName) {
        this.aName = aName == null ? null : aName.trim();
    }

    public String getColImg() {
        return colImg;
    }

    public void setColImg(String colImg) {
        this.colImg = colImg == null ? null : colImg.trim();
    }
}