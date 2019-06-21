package com.coss.model;
/**

*@comment

*@author 召

*@date 2019年4月15日 下午8:58:01

*@version 1.0.0

*/
public class GoodsAttribute {
	
	private final int NORMAL = 0;// 正常状态
	private final int RECOMMEND = 1;// 被推荐状态
	private final int APPLY = 2;//申请推荐中
	
	private String gid;//定义商品ID
	private String gname;//定义商品名称
	private double price;//定义商品价格
	private String foodImg;//用来保存商品图片
	private int status;//定义商品状态（判断是否上推荐页）
	private String state;//定义商品的字符串类型的状态
	private String cid;//商品表中的cId与商家表的cId相等
	
	private String gsId;//定义商品商铺关系表的ID
	private String shopName;//用来存放通过SQL语句查找到的商品名
	private String user;//用来存放用户名
	
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getFoodImg() {
		return foodImg;
	}
	public void setFoodImg(String foodImg) {
		this.foodImg = foodImg;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getGsId() {
		return gsId;
	}
	public void setGsId(String gsId) {
		this.gsId = gsId;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public int getNORMAL() {
		return NORMAL;
	}
	public int getRECOMMEND() {
		return RECOMMEND;
	}
	
	public int getAPPLY() {
		return APPLY;
	}
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "GoodsAttribute [NORMAL=" + NORMAL + ", RECOMMEND=" + RECOMMEND + ", APPLY=" + APPLY + ", gid=" + gid
				+ ", gname=" + gname + ", price=" + price + ", foodImg=" + foodImg + ", status=" + status + ", state="
				+ state + ", cid=" + cid + ", gsId=" + gsId + ", shopName=" + shopName + ", user=" + user + "]";
	}
	
}
