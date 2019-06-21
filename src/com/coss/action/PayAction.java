package com.coss.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.coss.dao.ShopsDao;
import com.coss.dao.TaskDao;
import com.coss.model.CustomInfoBean;
import com.coss.model.GoodBean;
import com.coss.util.GetTag;
import com.coss.util.JDBCUtils;
import com.opensymphony.xwork2.ActionSupport;

public class PayAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String data;
	private List<GoodBean> goods;// 接收json对象
	private static String addr;// 接收商家的地址
	private String address;// 用来使用商家地址
	private double total;// 存放总价
	private List<CustomInfoBean> list = new ArrayList<>();// 用来存放商品的名字和数量
	private CustomInfoBean cib = new CustomInfoBean();
	private int tag;//用于存放用户的tag
	TaskDao td = new TaskDao();
	private static List<GoodBean> tmpGoods = new ArrayList<>();
	private static List<CustomInfoBean> tmpInfo = new ArrayList<>();

	public String toPay() {
		goods = JSON.parseObject(data, new TypeReference<ArrayList<GoodBean>>() {
		});
		tmpGoods.addAll(goods);
		for (int i = 0; i < goods.size(); i++) {
			total += goods.get(i).getGoodPrice() * goods.get(i).getGoodCount();
		}
		tag = GetTag.getTag();
		return SUCCESS;
	}

	public String saveUserInfo() {
		tmpInfo.add(cib);
		goods = tmpGoods;
		for (int i = 0; i < goods.size(); i++) {
			total += goods.get(i).getGoodPrice() * goods.get(i).getGoodCount();
		}
		return SUCCESS;
	}

	public String Pay() {
		tag = GetTag.getTag();
		new ShopsDao().InsertInfo(tmpInfo, cib.getDemand(), tmpGoods, addr);
		list = td.sortTaskByTimeDesc();
		goods = td.searchGoods();
		return SUCCESS;
	}
	
	public String goTask() {
		tag = GetTag.getTag();
		list = td.sortTaskByTimeDesc();
		goods = td.searchGoods();
		return SUCCESS;
	}
	
	//接任务
	public String acceptTask() {
		tag = GetTag.getTag();
		HttpServletRequest request = ServletActionContext.getRequest();
		String name = request.getParameter("name");
		String sql = "delete from custominfo where username = ?";
		JDBCUtils.update(sql, name);
		list = td.sortTaskByTimeDesc();
		goods = td.searchGoods();
		return SUCCESS;
	}
	
	public String filterByRname() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String rName = "%"+request.getParameter("rName")+"%";
		tag = GetTag.getTag();
		if(rName.contains("全部餐厅")) {
			list = td.searchTaskByrName("");
		}else {
			list = td.searchTaskByrName(rName);
		}
		goods = td.searchGoods();
		return SUCCESS;
	}
	public String sortByTime() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String time = request.getParameter("time");
		if(time.equals("desc")) {
			list = td.sortTaskByTimeDesc();
		}else {
			list = td.sortTaskByTimeAsc();
		}
		tag = GetTag.getTag();
		goods = td.searchGoods();
		return SUCCESS;
	}
	public String searchTask() {
		String str = cib.getUsername().trim();
		list = td.searchTaskByshopName(str);
		if(list.isEmpty()) {
			list = td.searchTaskByUsername("%"+str+"%");
		}
		goods = td.searchGoods();
		return SUCCESS;
	}

	public String MyOrder() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		String uname = (String) session.getAttribute("username");
		list = td.searchMyOrder(uname);
		return SUCCESS;
	}
	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public List<GoodBean> getGoods() {
		return goods;
	}

	public void setGoods(List<GoodBean> goods) {
		this.goods = goods;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public List<CustomInfoBean> getList() {
		return list;
	}

	public void setList(List<CustomInfoBean> list) {
		this.list = list;
	}

	public CustomInfoBean getCib() {
		return cib;
	}

	public void setCib(CustomInfoBean cib) {
		this.cib = cib;
	}

	public int getTag() {
		return tag;
	}

	public void setTag(int tag) {
		this.tag = tag;
	}

}
