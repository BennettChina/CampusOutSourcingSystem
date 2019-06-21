package com.coss.dao;
/**

*@comment

*@author 召

*@date 2019年5月2日 下午12:45:50

*@version 1.0.0

*/

import java.util.ArrayList;
import java.util.List;

import com.coss.model.CustomInfoBean;
import com.coss.model.GoodBean;
import com.coss.util.JDBCUtils;

public class TaskDao {
	private List<CustomInfoBean> list = new ArrayList<>();
	private List<GoodBean> goods = new ArrayList<>();

	// 根据商家查找任务
	public List<CustomInfoBean> searchTaskByshopName(String shopName) {
		String sql = "select distinct ci.id,cg.addr,ci.username,ci.address,ci.time from custom_goods cg,customInfo ci where cg.id = ci.id and cg.addr = (select addr from shop where shopName = ?) order by ci.time desc";
		list = JDBCUtils.search(sql, CustomInfoBean.class, shopName);
		return list;
	}
	// 根据用户查找任务
	public List<CustomInfoBean> searchTaskByUsername(String username) {
		String sql = "select distinct ci.id,cg.addr,ci.username,ci.address,ci.time from custom_goods cg,customInfo ci where cg.id = ci.id and ci.username like ? order by ci.time desc";
		list = JDBCUtils.search(sql, CustomInfoBean.class, username);
		return list;
	}

	// 查找所有的被购买的商品
	public List<GoodBean> searchGoods() {
		String sql = "select cg.goodName,cg.goodCount,cg.id from custom_goods cg,customInfo ci where cg.id = ci.id";
		goods = JDBCUtils.search(sql, GoodBean.class);
		return goods;
	}

	//查找某餐厅的所有任务
	public List<CustomInfoBean> searchTaskByrName(String str) {
		String sql = "select distinct ci.id,cg.addr,ci.username,ci.address,ci.time from custom_goods cg,customInfo ci where cg.id = ci.id and cg.addr like ? order by ci.time desc";
		list = JDBCUtils.search(sql, CustomInfoBean.class, str);
		return list;
	}
	//将所有任务按时间降序排列
	public List<CustomInfoBean> sortTaskByTimeDesc() {
		String sql = "select distinct ci.id,cg.addr,ci.username,ci.address,ci.time from custom_goods cg,customInfo ci where cg.id = ci.id order by ci.time desc";
		list = JDBCUtils.search(sql, CustomInfoBean.class);
		return list;
	}
	//将所有任务按时间升序排列
	public List<CustomInfoBean> sortTaskByTimeAsc() {
		String sql = "select distinct ci.id,cg.addr,ci.username,ci.address,ci.time from custom_goods cg,customInfo ci where cg.id = ci.id order by ci.time";
		list = JDBCUtils.search(sql, CustomInfoBean.class);
		return list;
	}
	
	public List<CustomInfoBean> searchMyOrder(String uname){
		String sql = "select distinct ci.time,cg.goodName,cg.goodCount,cg.goodPrice,ci.username,s.shopName,ci.address,g.foodImg,ci.id "
				+ "from custom_goods cg,customInfo ci,shop s,goods g where cg.id = ci.id and s.addr = cg.addr " + 
				"and g.gname = cg.goodName"	+ " and ci.uid = (select uid from user where uName = ?) order by ci.time desc";
		list = JDBCUtils.search(sql, CustomInfoBean.class, uname);
		return list;
	}
}
