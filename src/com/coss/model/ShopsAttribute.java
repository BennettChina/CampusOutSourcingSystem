package com.coss.model;

/**
 * 
 * @comment 商品的属性类
 * 
 * @author 召
 * 
 * @date 2019年4月2日 下午9:33:17
 * 
 * @version 1.0.0
 * 
 */
public class ShopsAttribute {
	private static final String VERIFY = "待审核";//未审核
	private static final String VERIFIED = "已审核";//已审核
	
	private String cid;// 商品的ID;
	private String shopName;// 商家的名字
	private String addr;// 商家的地址
	private String logo;// 用来存放商家logo图(地址)
	private String type;// 存放商家类型
	private int rid;// 商家所属的餐厅ID
	private String rname;//餐厅名字
	private String status;//商家的状态
	private String uid;//商家的uid字段

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public static String getVerify() {
		return VERIFY;
	}

	public static String getVerified() {
		return VERIFIED;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	@Override
	public String toString() {
		return "ShopsAttribute [cid=" + cid + ", shopName=" + shopName + ", addr=" + addr + ", logo=" + logo + ", type="
				+ type + ", rid=" + rid + ", rname=" + rname + ", status=" + status + ", uid=" + uid + "]";
	}
	
}
