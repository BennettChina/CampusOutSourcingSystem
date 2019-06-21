package com.coss.model;

import java.sql.Timestamp;

/**

*@comment 顾客的信息类

*@author 召

*@date 2019年4月29日 下午4:51:38

*@version 1.0.0

*/
public class CustomInfoBean {
	
	private static final String RECEIVED = "已接收";//已接收
	private static final String RECEIVE = "待收件";//已接收
	
	private String goodName;// 购买的商品名
	private Double goodPrice;// 购买的商品单价
	private Integer goodCount;// 购买商品的数量
	private String addr;//商家的地址
	private String id;//顾客信息表的id
	private String username;//顾客的名字
	private String telphone;//顾客的手机号
	private String address;//顾客的收餐地址
	private String demand;//顾客的需求
	private Timestamp time;//订单的下单时间
	private String shopName;//购买的商品的商家
	private String foodImg;//商品的logo
	private String status;//订单状态
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTelphone() {
		return telphone;
	}
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDemand() {
		return demand;
	}
	public void setDemand(String demand) {
		this.demand = demand;
	}
	
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	public Double getGoodPrice() {
		return goodPrice;
	}
	public void setGoodPrice(Double goodPrice) {
		this.goodPrice = goodPrice;
	}
	public Integer getGoodCount() {
		return goodCount;
	}
	public void setGoodCount(Integer goodCount) {
		this.goodCount = goodCount;
	}
	
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getFoodImg() {
		return foodImg;
	}
	public void setFoodImg(String foodImg) {
		this.foodImg = foodImg;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public static String getReceived() {
		return RECEIVED;
	}
	public static String getReceive() {
		return RECEIVE;
	}
	@Override
	public String toString() {
		return "CustomInfoBean [goodName=" + goodName + ", goodPrice=" + goodPrice + ", goodCount=" + goodCount
				+ ", addr=" + addr + ", id=" + id + ", username=" + username + ", telphone=" + telphone + ", address="
				+ address + ", demand=" + demand + ", time=" + time + ", shopName=" + shopName + ", foodImg=" + foodImg
				+ ", status=" + status + "]";
	}
}
