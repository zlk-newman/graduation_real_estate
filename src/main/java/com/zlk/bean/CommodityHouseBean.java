package com.zlk.bean;

public class CommodityHouseBean {
    private Integer comId;

    private String comName;

    private Double comPrice;

    private String pName;

    private String comAddress;

    private Integer comNumber;

    private String comImg;

    private String comDescribe;

    private Integer comColnum;

    @Override
    public String toString() {
        return "CommodityHouseBean{" +
                "comId=" + comId +
                ", comName='" + comName + '\'' +
                ", comPrice=" + comPrice +
                ", pName='" + pName + '\'' +
                ", comAddress='" + comAddress + '\'' +
                ", comNumber=" + comNumber +
                ", comImg='" + comImg + '\'' +
                ", comDescribe='" + comDescribe + '\'' +
                ", comColnum=" + comColnum +
                '}';
    }

    public Integer getComId() {
        return comId;
    }

    public void setComId(Integer comId) {
        this.comId = comId;
    }

    public String getComName() {
        return comName;
    }

    public void setComName(String comName) {
        this.comName = comName == null ? null : comName.trim();
    }

    public Double getComPrice() {
        return comPrice;
    }

    public void setComPrice(Double comPrice) {
        this.comPrice = comPrice;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName == null ? null : pName.trim();
    }

    public String getComAddress() {
        return comAddress;
    }

    public void setComAddress(String comAddress) {
        this.comAddress = comAddress == null ? null : comAddress.trim();
    }

    public Integer getComNumber() {
        return comNumber;
    }

    public void setComNumber(Integer comNumber) {
        this.comNumber = comNumber;
    }

    public String getComImg() {
        return comImg;
    }

    public void setComImg(String comImg) {
        this.comImg = comImg == null ? null : comImg.trim();
    }

    public String getComDescribe() {
        return comDescribe;
    }

    public void setComDescribe(String comDescribe) {
        this.comDescribe = comDescribe == null ? null : comDescribe.trim();
    }

    public Integer getComColnum() {
        return comColnum;
    }

    public void setComColnum(Integer comColnum) {
        this.comColnum = comColnum;
    }
}