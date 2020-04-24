package com.zlk.bean;

public class AverageUserBean {
    private Integer aId;

    private String aName;

    private String aPwd;

    private String aImg;

    private String aEmil;

    private String aPhone;

    private String aAddress;

    @Override
    public String toString() {
        return "AverageUserBean{" +
                "aId=" + aId +
                ", aName='" + aName + '\'' +
                ", aPwd='" + aPwd + '\'' +
                ", aImg='" + aImg + '\'' +
                ", aEmil='" + aEmil + '\'' +
                ", aPhone='" + aPhone + '\'' +
                ", aAddress='" + aAddress + '\'' +
                '}';
    }

    public Integer getaId() {
        return aId;
    }

    public void setaId(Integer aId) {
        this.aId = aId;
    }

    public String getaName() {
        return aName;
    }

    public void setaName(String aName) {
        this.aName = aName;
    }

    public String getaPwd() {
        return aPwd;
    }

    public void setaPwd(String aPwd) {
        this.aPwd = aPwd;
    }

    public String getaImg() {
        return aImg;
    }

    public void setaImg(String aImg) {
        this.aImg = aImg;
    }

    public String getaEmil() {
        return aEmil;
    }

    public void setaEmil(String aEmil) {
        this.aEmil = aEmil;
    }

    public String getaPhone() {
        return aPhone;
    }

    public void setaPhone(String aPhone) {
        this.aPhone = aPhone;
    }

    public String getaAddress() {
        return aAddress;
    }

    public void setaAddress(String aAddress) {
        this.aAddress = aAddress;
    }
}