package com.coss.model;

import java.io.Serializable;

/**
 * 
 * @comment
 * 
 * @author 召
 * 
 * @date 2019年4月24日 下午3:06:25
 * 
 * @version 1.0.0
 * 
 */
public class GoodBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String goodName;// 购买的商品名
	private Double goodPrice;// 购买的商品单价
	private Integer goodCount;// 购买商品的数量
	private String id;//顾客信息表的id

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

	public GoodBean() {
		super();
	}

	public GoodBean(String goodName, Integer goodCount) {
		super();
		this.goodName = goodName;
		this.goodCount = goodCount;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "GoodBean [goodName=" + goodName + ", goodPrice=" + goodPrice + ", goodCount=" + goodCount + ", id=" + id
				+ "]";
	}
}
