package com.coss.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.coss.dao.ShopsDao;
import com.coss.dao.UserDao;
import com.coss.model.ShopsAttribute;
import com.coss.model.UserAttribute;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 
 * @comment 用户的业务逻辑层
 * 
 * @author 召
 * 
 * @date 2019年4月17日 下午9:14:21
 * 
 * @version 1.0.0
 * 
 */
public class UserAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// 对用户的属性类进行实例化
	UserAttribute ua = new UserAttribute();
	// 实例化用户的Dao层
	UserDao ud = new UserDao();
	ShopsDao sd = new ShopsDao();
	// 定义一个List接收Dao层方法传递过来的返回值
	List<UserAttribute> list = new ArrayList<>();
	List<ShopsAttribute> list1 = new ArrayList<>();
	String flag = SUCCESS;// 用于存放返回值
	private String username;//用于存储用户名
	

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	// 为属性类和Dao层添加set、get方法
	public UserAttribute getUa() {
		return ua;
	}

	public void setUa(UserAttribute ua) {
		this.ua = ua;
	}

	public UserDao getUd() {
		return ud;
	}

	public void setUd(UserDao ud) {
		this.ud = ud;
	}

	public List<UserAttribute> getList() {
		return list;
	}

	public void setList(List<UserAttribute> list) {
		this.list = list;
	}
	

	public List<ShopsAttribute> getList1() {
		return list1;
	}

	public void setList1(List<ShopsAttribute> list1) {
		this.list1 = list1;
	}

	// 普通用户注册方法
	public String register() {
		int row = ud.register(ua);
		if(row == 0) {
			//注册失败
			flag = ERROR;
		}
		return flag;
	}

	// 商家注册方法
	public String merchantRegister() {
		int row = ud.merchantRegister(ua);
		if(row == 0) {
			//注册失败
			flag = ERROR;
		}
		return flag;
	}
	// 管理员注册方法
	public String masterRegister() {
		int row = ud.masterRegister(ua);
		if(row == 0) {
			//注册失败
			flag = ERROR;
		}
		return flag;
	}

	// 用户登录方法
	public String login() {
		list = ud.login(ua);
		int tag = list.get(0).getTag();
		if (tag == UserAttribute.getPersonal()) {
			flag = "personal_login_suc";
		} else if (tag == UserAttribute.getAdmin()) {
			username = list.get(0).getUname();
			list1 = sd.findShopsByStatus();
			flag =  "admin_login_suc";
		} else if (tag == UserAttribute.getMerchant()) {
			flag = "merchant_login_suc";
		} else {
			flag = "login_err";
		}
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("username", list.get(0).getUname());
		session.setAttribute("tag", tag);
		return flag;
	}
}
