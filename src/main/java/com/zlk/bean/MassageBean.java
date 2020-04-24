package com.zlk.bean;

public class MassageBean {
    private Integer masId;

    private String aName;

    private String pName;

    private String mas;

    @Override
    public String toString() {
        return "MassageBean{" +
                "masId=" + masId +
                ", aName='" + aName + '\'' +
                ", pName='" + pName + '\'' +
                ", mas='" + mas + '\'' +
                '}';
    }

    public Integer getMasId() {
        return masId;
    }

    public void setMasId(Integer masId) {
        this.masId = masId;
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

    public String getMas() {
        return mas;
    }

    public void setMas(String mas) {
        this.mas = mas == null ? null : mas.trim();
    }
}