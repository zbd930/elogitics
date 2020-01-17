package com.duogesi.Utils;

import com.duogesi.entities.chehang.order;
import com.duogesi.entities.huodai.Ship;
import org.springframework.stereotype.Component;

@Component
public class Swtich {

    public Ship swtich_schdule(Ship ship) {
        switch (ship.getStatus()) {
            case 0:
                ship.setStatu("未拼柜");
                return ship;
            case 1:
                ship.setStatu("已装柜");
                return ship;
            case 2:
                ship.setStatu("报关中");
                return ship;
            case 3:
                ship.setStatu("开船");
                return ship;
            case 4:
                ship.setStatu("货到港");
                return ship;
            case 5:
                ship.setStatu("查验中");
                return ship;
            case 6:
                ship.setStatu("已完成");
                return ship;
        }
        return null;
    }
    public String switch_country(String country){
        switch (country){
            case "American":
                return "美国";
            case "Europe":
                return "欧洲";
            case "Canada":
                return "加拿大";
            case "Japan":
                return "日本";
        }return null;
    }

    public String switch_mudigang(String origin){
        switch (origin){
            case "west":
                return "美西";
            case "east":
                return "美东";
            case "middle":
                return "美中";
            case "YVR":
                return "温哥华";
            case "YYC":
                return "卡尔加里";
            case "YYZ":
                return "多伦多";
            case "YOW":
                return "渥太华";
            case ("英国"):
                return "英国";
            case ("德国"):
                return "德国";
            case ("法国"):
                return "法国";
            case ("卢森堡"):
                return "卢森堡";
            case ("荷兰"):
                return "荷兰";
            case ("比利时"):
                return "比利时";
            case ("爱尔兰"):
                return "爱尔兰";
            case ("西班牙"):
                return "西班牙";
            case ("意大利"):
                return "意大利";
            case ("奥地利"):
                return "奥地利";
            case ("丹麦"):
                return "丹麦";
            case ("捷克"):
                return "捷克";
            case ("zone1"):
                return "一号区域";
            case ("zone2"):
                return "二号区域";
            case ("zone3"):
                return "三号区域";
             case "Japan":
                return "日本";
             case ("其他"):
                return "其他";
        }
        return null;
    }
    public String switch_countres(String country){
        switch (country){
            case "American":
                return "美国";
            case "Europe":
                return "欧洲";
            case "Japan":
                return "日本";
            case "Canada":
                return "加拿大";
        }return null;
    }
    public order swtich_order(order order){
        switch (order.getStatus()){
            case 0:
                order.setStatu("已下单");
                return order;
            case 1:
                order.setStatu("车行已接单");
                return order;
            case 2:
                order.setStatu("已送达货代公司仓库");
                return order;
            case 3:
                order.setStatu("运输中");
                return order;
            case 4:
                order.setStatu("等待客户自送仓库");
                return order;
            case 5:
                order.setStatu("待评价");
                return order;
            case 6:
                order.setStatu("已到达目的地");
                return order;
        }
        return null;
    }
    public String switch_way(int origin){
        switch (origin){
            case 0:
                return "空派";
            case 1:
                return "海派";
            case 2:
                return "美森";
            case 3:
                return "空派(直飞)";
            case 4:
                return "空派(敏感)";
        }
        return null;
    }
}
