package com.duogesi.entities.huodai;

public class xiaobao {

    private int xiaobao_id;
    private String desc;
    private String country;
    private String timetable;
    private String detail;
    private int  user_id;

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getXiaobao_id() {
        return xiaobao_id;
    }

    public void setXiaobao_id(int xiaobao_id) {
        this.xiaobao_id = xiaobao_id;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getTimetable() {
        return timetable;
    }

    public void setTimetable(String timetable) {
        this.timetable = timetable;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    @Override
    public String toString() {
        return "xiaobao{" +
                "xiaobao_id=" + xiaobao_id +
                ", desc='" + desc + '\'' +
                ", country='" + country + '\'' +
                ", timetable='" + timetable + '\'' +
                ", detail='" + detail + '\'' +
                ", user_id=" + user_id +
                '}';
    }
}
