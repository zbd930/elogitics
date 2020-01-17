package com.duogesi.xiaoxi;

import com.alibaba.fastjson.JSONObject;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class xiaoxi {

    private static  String appId="wx8301d95291e6b82a";

    private static String appSecret="6fa0d5d07cad8c6a472cf2f610b1bff6";
    /**
     * 根据微信id，secret获取access_token
     *
     */
    public String getAccessToken() {
        String tmpUrl = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" + appId
                + "&secret=" + appSecret + "";
        CloseableHttpClient httpCilent = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet(tmpUrl);
        try {
            HttpResponse httpResponse = httpCilent.execute(httpGet);
            if (httpResponse.getStatusLine().getStatusCode() == 200) {
                String entity = EntityUtils.toString(httpResponse.getEntity());
                AccessToken accessToken = JSONObject.parseObject(entity, AccessToken.class);
                return accessToken.getAccess_token();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                // 释放资源
                httpCilent.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "";
    }

    /**
     * 发送微信消息模板
     *
     */
    public String sendTemplate(String touser, String templateId, String clickurl, String[] fillData) {
        String tepUrl = "https://api.weixin.qq.com/cgi-bin/message/subscribe/send?access_token="
                + getAccessToken();
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(tepUrl);
        // 装配post请求参数
        JSONObject json = new JSONObject();
        json.put("touser", touser);
        json.put("template_id", templateId);
        json.put("emphasis_keyword", "keyword1.DATA");
        JSONObject dataJson = new JSONObject();
        for (int i = 0; i < fillData.length; i++) {
            JSONObject sonDateJson = new JSONObject();
            sonDateJson.put("value", fillData[i]);
            dataJson.put("keyword" + (i + 1), sonDateJson);
        }
        json.put("data", dataJson);
        String resultStr = "发送失败";
        try {
            StringEntity myEntity = new StringEntity(json.toJSONString(), ContentType.APPLICATION_JSON);
            // 设置post求情参数
            httpPost.setEntity(myEntity);
            HttpResponse httpResponse = httpClient.execute(httpPost);
            if (httpResponse.getStatusLine().getStatusCode() == 200) {
                // 发送成功
                String resutlEntity = EntityUtils.toString(httpResponse.getEntity());
                ResultTemplateDate resultTemplateDate = JSONObject.parseObject(resutlEntity, ResultTemplateDate.class);
                if (resultTemplateDate.getErrcode().equals("40003")) {
                    resultStr = "touser字段openid为空或者不正确";
                    return resultStr;
                }
                if (resultTemplateDate.getErrcode().equals("40037")) {
                    resultStr = "订阅模板id为空不正确";
                    return resultStr;
                }
                if (resultTemplateDate.getErrcode().equals("43101")) {
                    resultStr = "用户拒绝接受消息，如果用户之前曾经订阅过，则表示用户取消了订阅关系";
                    return resultStr;
                }
                if (resultTemplateDate.getErrcode().equals("47003")) {
                    resultStr = "模板参数不准确，可能为空或者不满足规则，errmsg会提示具体是哪个字段出错";
                    return resultStr;
                }
                if (resultTemplateDate.getErrcode().equals("41030")) {
                    resultStr = "page路径不正确，需要保证在现网版本小程序中存在，与app.json保持一致";
                    return resultStr;
                }
                resultStr = "ok";
                return resultStr;
            } else {
                // 发送失败
                return resultStr;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (httpClient != null) {
                    // 释放资源
                    httpClient.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return resultStr;
    }
}
