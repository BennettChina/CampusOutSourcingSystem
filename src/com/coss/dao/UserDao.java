package com.coss.dao;

import java.util.ArrayList;
import java.util.List;

import com.coss.model.UserAttribute;
import com.coss.util.JDBCUtils;

/**
 * 
 * @comment
 * 
 * @author 召
 * 
 * @date 2019年4月3日 上午9:46:13
 * 
 * @version 1.0.0
 * 
 */
public class UserDao {

	private List<UserAttribute> list = new ArrayList<UserAttribute>();

	// 普通用户的注册
	public int register(UserAttribute ua) {
		String sql = "insert into user values(?,?,?,?)";
		int row = JDBCUtils.update(sql, ua.getUid(), ua.getUname(), ua.getPswd(), UserAttribute.getPersonal());
		return row;
	}

	// 通用登录
	public List<UserAttribute> login(UserAttribute ua) {

		String sql = "select uId uid,uName uname,pswd,tag from user where uId= ? and pswd= ?";
		list = JDBCUtils.search(sql, UserAttribute.class, ua.getUid(),ua.getPswd());
		return list;
	}

	//商家注册
	public int merchantRegister(UserAttribute ua) {
		String sql = "insert into user values(?,?,?,?)";
		int row = JDBCUtils.update(sql, ua.getUid(),ua.getUname(),ua.getPswd(),UserAttribute.getMerchant());
		return row;
	}

	//管理员注册
	public int masterRegister(UserAttribute ua) {
		String sql = "insert into user values(?,?,?,?)";
		int row = JDBCUtils.update(sql, ua.getUid(),ua.getUname(),ua.getPswd(),UserAttribute.getAdmin());
		return row;
	}
	
}
