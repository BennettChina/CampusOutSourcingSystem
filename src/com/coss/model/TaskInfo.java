package com.coss.model;
/**

*@comment

*@author 召

*@date 2019年4月25日 上午11:01:07

*@version 1.0.0

*/
public class TaskInfo {
	private String userName;//用户下单的真实姓名
	private String sAddr;//用户下单的餐厅地址
	private String uAddr;//用户的收餐地址
	private String goodName;//用户购买商品的名字
	private int goodCount;//用户购买商品的数量
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getsAddr() {
		return sAddr;
	}
	public void setsAddr(String sAddr) {
		this.sAddr = sAddr;
	}
	public String getuAddr() {
		return uAddr;
	}
	public void setuAddr(String uAddr) {
		this.uAddr = uAddr;
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	public int getGoodCount() {
		return goodCount;
	}
	public void setGoodCount(int goodCount) {
		this.goodCount = goodCount;
	}
	public TaskInfo() {
		super();
	}
	public TaskInfo(String userName, String sAddr, String uAddr, String goodName, int goodCount) {
		super();
		this.userName = userName;
		this.sAddr = sAddr;
		this.uAddr = uAddr;
		this.goodName = goodName;
		this.goodCount = goodCount;
	}
	@Override
	public String toString() {
		return "TaskInfo [userName=" + userName + ", sAddr=" + sAddr + ", uAddr=" + uAddr + ", goodName=" + goodName
				+ ", goodCount=" + goodCount + "]";
	}
}
