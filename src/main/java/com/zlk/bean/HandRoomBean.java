package com.zlk.bean;

public class HandRoomBean {
    private Integer handId;

    private String handName;

    private Double handPrice;

    private String pName;

    private String handAddress;

    private Integer handNumber;

    private String handImg;

    private String handDescribe;

    private Integer handAge;

    private Integer handColnum;

    @Override
    public String toString() {
        return "HandRoomBean{" +
                "handId=" + handId +
                ", handName='" + handName + '\'' +
                ", handPrice=" + handPrice +
                ", pName='" + pName + '\'' +
                ", handAddress='" + handAddress + '\'' +
                ", handNumber=" + handNumber +
                ", handImg='" + handImg + '\'' +
                ", handDescribe='" + handDescribe + '\'' +
                ", handAge=" + handAge +
                ", handColnum=" + handColnum +
                '}';
    }

    public Integer getHandId() {
        return handId;
    }

    public void setHandId(Integer handId) {
        this.handId = handId;
    }

    public String getHandName() {
        return handName;
    }

    public void setHandName(String handName) {
        this.handName = handName == null ? null : handName.trim();
    }

    public Double getHandPrice() {
        return handPrice;
    }

    public void setHandPrice(Double handPrice) {
        this.handPrice = handPrice;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName == null ? null : pName.trim();
    }

    public String getHandAddress() {
        return handAddress;
    }

    public void setHandAddress(String handAddress) {
        this.handAddress = handAddress == null ? null : handAddress.trim();
    }

    public Integer getHandNumber() {
        return handNumber;
    }

    public void setHandNumber(Integer handNumber) {
        this.handNumber = handNumber;
    }

    public String getHandImg() {
        return handImg;
    }

    public void setHandImg(String handImg) {
        this.handImg = handImg == null ? null : handImg.trim();
    }

    public String getHandDescribe() {
        return handDescribe;
    }

    public void setHandDescribe(String handDescribe) {
        this.handDescribe = handDescribe == null ? null : handDescribe.trim();
    }

    public Integer getHandAge() {
        return handAge;
    }

    public void setHandAge(Integer handAge) {
        this.handAge = handAge;
    }

    public Integer getHandColnum() {
        return handColnum;
    }

    public void setHandColnum(Integer handColnum) {
        this.handColnum = handColnum;
    }
}