package com.duogesi.entities.huodai;

import java.util.List;

public class addition {
    private int addition_id;
    private String category;
    private int price;
    private int user_id;
    private String country;
    private List ccmails;

    public List getCcmails() {
        return ccmails;
    }

    public void setCcmails(List ccmails) {
        this.ccmails = ccmails;
    }

    public int getAddition_id() {
        return addition_id;
    }

    public void setAddition_id(int addition_id) {
        this.addition_id = addition_id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
