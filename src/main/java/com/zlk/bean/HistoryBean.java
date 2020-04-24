package com.zlk.bean;

public class HistoryBean {
    private Integer hId;

    private String houseName;

    private String aName;

    private String pName;

    private Double price;

    private String houseImg;

    @Override
    public String toString() {
        return "HistoryBean{" +
                "hId=" + hId +
                ", houseName='" + houseName + '\'' +
                ", aName='" + aName + '\'' +
                ", pName='" + pName + '\'' +
                ", price=" + price +
                ", houseImg='" + houseImg + '\'' +
                '}';
    }

    public Integer gethId() {
        return hId;
    }

    public void sethId(Integer hId) {
        this.hId = hId;
    }

    public String getHouseName() {
        return houseName;
    }

    public void setHouseName(String houseName) {
        this.houseName = houseName == null ? null : houseName.trim();
    }

    public String getaName() {
        return aName;
    }

    public void setaName(String aName) {
        this.aName = aName == null ? null : aName.trim();
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName == null ? null : pName.trim();
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getHouseImg() {
        return houseImg;
    }

    public void setHouseImg(String houseImg) {
        this.houseImg = houseImg == null ? null : houseImg.trim();
    }
}