package com.zlk.bean;

public class PropertyUserBean {
    private Integer pId;

    private String pName;

    private String pPwd;

    private String pImg;

    private String pCompany;

    private String pEmil;

    private String pPhone;

    private String pAddress;

    @Override
    public String toString() {
        return "PropertyUserBean{" +
                "pId=" + pId +
                ", pName='" + pName + '\'' +
                ", pPwd='" + pPwd + '\'' +
                ", pImg='" + pImg + '\'' +
                ", pCompany='" + pCompany + '\'' +
                ", pEmil='" + pEmil + '\'' +
                ", pPhone='" + pPhone + '\'' +
                ", pAddress='" + pAddress + '\'' +
                '}';
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpPwd() {
        return pPwd;
    }

    public void setpPwd(String pPwd) {
        this.pPwd = pPwd;
    }

    public String getpImg() {
        return pImg;
    }

    public void setpImg(String pImg) {
        this.pImg = pImg;
    }

    public String getpCompany() {
        return pCompany;
    }

    public void setpCompany(String pCompany) {
        this.pCompany = pCompany;
    }

    public String getpEmil() {
        return pEmil;
    }

    public void setpEmil(String pEmil) {
        this.pEmil = pEmil;
    }

    public String getpPhone() {
        return pPhone;
    }

    public void setpPhone(String pPhone) {
        this.pPhone = pPhone;
    }

    public String getpAddress() {
        return pAddress;
    }

    public void setpAddress(String pAddress) {
        this.pAddress = pAddress;
    }
}