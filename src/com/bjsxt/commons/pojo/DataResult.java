package com.bjsxt.commons.pojo;

/**
 * 前后台数据交互模板
 */
public class DataResult {
    //状态码： 200 成功  其他失败
    private int status;
    // 失败时服务器返回的消息
    private String msg;
    // 服务器返回给客户端的数据
    private Object data;

    public static DataResult ok(){
        DataResult dr = new DataResult();
        dr.setStatus(200);
        return dr;
    }

    public static DataResult ok(Object data){
        DataResult dr = new DataResult();
        dr.setStatus(200);
        dr.setData(data);
        return dr;
    }

    public static DataResult error(String msg){
        DataResult dr = new DataResult();
        dr.setStatus(400);
        dr.setMsg(msg);
        return dr;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
