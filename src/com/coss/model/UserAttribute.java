package com.coss.model;
/**

*@comment  用户的属性类

*@author 召

*@date 2019年4月3日 上午9:26:34

*@version 1.0.0

*/
public class UserAttribute {
	private static final int ADMIN = 0;//管理员
	private static final int PERSONAL = 1;//一般用户
	private static final int MERCHANT = 2;//商家
	private String uname;//用户名
	private String pswd;//用户密码
	private String uid;//用户Id
	private int tag;//用户标签，区分管理员、普通用户、商家、快递员
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPswd() {
		return pswd;
	}
	public void setPswd(String pswd) {
		this.pswd = pswd;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public int getTag() {
		return tag;
	}
	public void setTag(int tag) {
		this.tag = tag;
	}
	public static int getAdmin() {
		return ADMIN;
	}
	public static int getPersonal() {
		return PERSONAL;
	}
	public static int getMerchant() {
		return MERCHANT;
	}
	@Override
	public String toString() {
		return "UserAttribute [uname=" + uname + ", pswd=" + pswd + ", uid=" + uid + ", tag=" + tag + "]";
	}
}
