package com.coss.util;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

/**

*@comment

*@author 召

*@date 2019年4月30日 下午6:08:26

*@version 1.0.0

*/
public class GetTag {
	public static int getTag() {
		int tag;
		HttpSession session = ServletActionContext.getRequest().getSession();
		if (session.getAttribute("username") == null) {
			tag = -1;
		} else {
			tag = (int) session.getAttribute("tag");
		}
		return tag;
	}
}
