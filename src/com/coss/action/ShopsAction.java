package com.coss.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.coss.dao.ShopsDao;
import com.coss.model.CustomInfoBean;
import com.coss.model.GoodsAttribute;
import com.coss.model.ShopsAttribute;
import com.coss.model.UserAttribute;
import com.coss.util.GetTag;
import com.coss.util.JDBCUtils;
import com.opensymphony.xwork2.ActionSupport;

public class ShopsAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private ShopsAttribute sa = new ShopsAttribute();
	private GoodsAttribute ga = new GoodsAttribute();
	
	private ShopsDao sd = new ShopsDao();
	private List<GoodsAttribute> list = new ArrayList<GoodsAttribute>();
	private List<ShopsAttribute> list1 = new ArrayList<ShopsAttribute>();
	private List<ShopsAttribute> list2 = new ArrayList<ShopsAttribute>();
	public String rName;
	public int id;
	private String username;// 获取session里登录后的用户名
	private int tag;//获取session里登录后的tag
	private File logo; // 得到上传的文件
	private File[] foodImg; // 得到上传的文件
	private String[] gname;// 用来存放前端传来的商品名
	private double[] price;// 用来存放前端传来的商品价格
	String flag = SUCCESS;// 用于存放返回值;
	private String announcement;

	private String status;//定义一个商家的字符串类型的状态

	private List<GoodsAttribute> goods;
	
	public List<GoodsAttribute> getGoods() {
		return goods;
	}

	public void setGoods(List<GoodsAttribute> goods) {
		this.goods = goods;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAnnouncement() {
		return announcement;
	}

	public void setAnnouncement(String announcement) {
		this.announcement = announcement;
	}

	public ShopsAttribute getSa() {
		return sa;
	}

	public void setSa(ShopsAttribute sa) {
		this.sa = sa;
	}

	public GoodsAttribute getGa() {
		return ga;
	}

	public void setGa(GoodsAttribute ga) {
		this.ga = ga;
	}

	public List<GoodsAttribute> getList() {
		return list;
	}

	public void setList(List<GoodsAttribute> list) {
		this.list = list;
	}

	public List<ShopsAttribute> getList1() {
		return list1;
	}

	public void setList1(List<ShopsAttribute> list1) {
		this.list1 = list1;
	}

	public List<ShopsAttribute> getList2() {
		return list2;
	}

	public void setList2(List<ShopsAttribute> list2) {
		this.list2 = list2;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public File getLogo() {
		return logo;
	}

	public void setLogo(File logo) {
		this.logo = logo;
	}

	public File[] getFoodImg() {
		return foodImg;
	}

	public void setFoodImg(File[] foodImg) {
		this.foodImg = foodImg;
	}

	public String[] getGname() {
		return gname;
	}

	public void setGname(String[] gname) {
		this.gname = gname;
	}

	public double[] getPrice() {
		return price;
	}

	public void setPrice(double[] price) {
		this.price = price;
	}

	public int getTag() {
		return tag;
	}

	public void setTag(int tag) {
		this.tag = tag;
	}

	//查找已被推荐的商品
	public String findGoodsByStatus(){
		list = sd.findGoodsByStatus();
		String sql = "select distinct ci.id,cg.addr,ci.username,ci.address from custom_goods cg,customInfo ci where cg.id = ci.id";
		List<CustomInfoBean> list3 = JDBCUtils.search(sql, CustomInfoBean.class);
		announcement = list3.get(0).getAddr()+"➡"+list3.get(0).getAddress()+"--->待配送";
		//获取登录用户的标签判断是否需要还需要登录
		HttpSession session = ServletActionContext.getRequest().getSession();
		if (session.getAttribute("username") == null) {
			username = "还未登录，请登录";
			tag = -1;
		} else {
			username = (String) session.getAttribute("username") + ",已登录";
			tag = (int) session.getAttribute("tag");
		}
		return flag;
	}

	//通过餐厅的id值查找其包含的所有已通过审核的商家
	public String findGoodsByrId() throws Exception {
		// 现获取参数
		HttpServletRequest request = ServletActionContext.getRequest();
		//获取登录用户的标签判断是否需要还需要登录
		tag = GetTag.getTag();
		String rId = request.getParameter("rId");// 字符串
		sa.setRid(Integer.parseInt(rId));
		list1 = sd.findGoodsByrId(sa);
		if(!list1.isEmpty()) {
			rName = list1.get(0).getRname();
			id = list1.get(0).getRid();
		}
		return flag;
	}

	//通过商家的类型查找商家
	public String findGoodsByType() {
		// 现获取参数
		HttpServletRequest request = ServletActionContext.getRequest();
		//获取登录用户的标签判断是否需要还需要登录
		tag = GetTag.getTag();
		String type = request.getParameter("type");// 字符串
		String rName = request.getParameter("rName");// 字符串
		sa.setType(type);
		sa.setRname(rName);
		list1 = sd.findGoodsByType(sa);
		return flag;
	}

	//查找页面所处的餐厅名字
	public String findByrName() {
		// 现获取参数
		HttpServletRequest request = ServletActionContext.getRequest();
		//获取登录用户的标签判断是否需要还需要登录
		tag = GetTag.getTag();
		String rName = request.getParameter("rName");// 字符串
		sa.setRname(rName);
		list1 = sd.findByrName(sa);
		return flag;
	}

	//用于搜索栏的查找商家
	public String searchByName() {
		//获取登录用户的标签判断是否需要还需要登录
		tag = GetTag.getTag();
		list1 = sd.searchByName(sa);
		if(list1.isEmpty()) {
			list1 = sd.findShopsByShopName(sa);
		}
		for (int i = 0; i < list1.size(); i++) {
			rName = list1.get(i).getRname();
		}
		return flag;
	}

	//用于详情页的根据商家的名字查找其对应的所有商品
	public String findGoodsByShopName() {
		HttpServletRequest request = ServletActionContext.getRequest();
		//获取登录用户的标签判断是否需要还需要登录
		tag = GetTag.getTag();
		String shopName = request.getParameter("shopName");// 字符串
		sa.setShopName(shopName);
		ga.setShopName(shopName);
		list = sd.findGoodsByShopName(ga);
		list1 = sd.findShopsByShopName(sa);
		return flag;
	}

	//用于首页的根据cid查找商家、商品
	public String findGoodsBycId() {
		HttpServletRequest request = ServletActionContext.getRequest();
		//获取登录用户的标签判断是否需要还需要登录
		tag = GetTag.getTag();
		String cId = request.getParameter("cId");// 字符串
		ga.setCid(cId);
		sa.setCid(cId);
		list = sd.findGoodsBycId(ga);
		list1 = sd.findShopsBycId(sa);
		return flag;
	}

	// 添加商家、商品
	public String insertShops() {
		ServletContext sc = ServletActionContext.getServletContext();
		//通过session里的username找到对应的uid，用此uid作为该商家的shop表的uid字段。
		HttpSession session = ServletActionContext.getRequest().getSession();
		String username = (String) session.getAttribute("username");
		String sql = "select uId uid from user where uname = ?";
		List<UserAttribute> user = JDBCUtils.search(sql, UserAttribute.class, username);
		String uid = user.get(0).getUid();
		sa.setUid(uid);
		
		String url = sc.getRealPath("/");
		String logoUrl = "imgs/shopLogo/";
		String foodImgUrl = "imgs/foodImg/";
		String logoSrc = fileWriter(logo, url, logoUrl, "jpg");
		sa.setLogo(logoSrc);
		if (sa.getAddr().contains("龙湖")) {
			sa.setRid(1);
		} else if (sa.getAddr().contains("榕苑")) {
			sa.setRid(2);
		} else if (sa.getAddr().contains("北区新")) {
			sa.setRid(3);
		} else {
			sa.setRid(4);
		}
		list1 = sd.insertShops(sa);
		for (int i = 0; i < gname.length; i++) {
			ga.setGname(gname[i]);
			ga.setPrice(price[i]);
			String foodImgSrc = fileWriter(foodImg[i], url, foodImgUrl, "jpg");
			ga.setFoodImg(foodImgSrc);
			sd.insertGoods(ga);
		}
		list = sd.findGoodsByUname(username);
		return flag;
	}

	public String fileWriter(File flie, String url, String url2, String fileType) {
		// 用系统的毫秒数作为新的文件名
		String fileName = "" + System.currentTimeMillis();
		try (FileInputStream fis = new FileInputStream(flie);
				FileOutputStream fos = new FileOutputStream(url + url2 + fileName + "." + fileType);) {
			byte[] b = new byte[1024];
			int len = 0;
			while ((len = fis.read(b)) != -1) {
				fos.write(b, 0, len);
				fos.flush();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return url2 + fileName + "." + fileType;
	}
	
	//通过商家的审核
	public String allow() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		username = (String) session.getAttribute("username");
		String cid = request.getParameter("cid");
		sa.setCid(cid);
		sd.allow(sa);
		list1 = sd.findShopsByStatus();
		return SUCCESS;
	}
	//删除商家
	public String deleteShop() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		username = (String) session.getAttribute("username");
		String cid = request.getParameter("cid");
		sa.setCid(cid);
		sd.deleteShop(sa);
		list1 = sd.findShopsByStatus();
		return SUCCESS;
	}
	//管理页的搜索栏的查找某商家
	public String searchShops() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		username = (String) session.getAttribute("username");
		list1 = sd.searchShops(sa);
		return SUCCESS;
	}
	
	//商家申请菜品被推荐
	public String apply() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		username = (String) session.getAttribute("username");
		String gid = request.getParameter("gid");
		ga.setGid(gid);
		sd.apply(ga);
		list = sd.findGoodsByUname(username);
		return SUCCESS;
	}
	
	//商家更新商品价格
	public String updatePrice() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		username = (String) session.getAttribute("username");
		String gid = request.getParameter("gid");
		String price = request.getParameter("price");
		ga.setGid(gid);
		ga.setPrice(Double.parseDouble(price));
		sd.updatePrice(ga);
		list = sd.findGoodsByUname(username);
		return SUCCESS;
	}
	
	//商家删除商品
	public String deleteGood() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		username = (String) session.getAttribute("username");
		String gid = request.getParameter("gid");
		ga.setGid(gid);
		sd.deleteGood(ga);
		list = sd.findGoodsByUname(username);
		return SUCCESS;
	}
	
	//查找某商家的所有商品
	public String findGoodsByUname() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		username = (String) session.getAttribute("username");
		list = sd.findGoodsByUname(username);
		return SUCCESS;
	}
	
	//查找所有未审核的商家推荐的商品和已推荐的商品
	public String reviewGoods() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		username = (String) session.getAttribute("username");
		list = sd.reviewGoods();
		goods = sd.findGoodsByStatus();
		return SUCCESS;
	}
	
	//查找所有未审核的商家
	public String reviewShops() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		username = (String) session.getAttribute("username");
		list1 = sd.findShopsByStatus();
		return SUCCESS;
	}
	
	//通过商品的审核
	public String allowGood() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		username = (String) session.getAttribute("username");
		String gid = request.getParameter("gid");
		ga.setGid(gid);
		sd.allowGood(ga);
		list = sd.reviewGoods();
		goods = sd.findGoodsByStatus();
		return SUCCESS;
	}
	
	//移除商品的推荐状态
	public String remove() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		username = (String) session.getAttribute("username");
		String gid = request.getParameter("gid");
		ga.setGid(gid);
		sd.remove(ga);
		list = sd.reviewGoods();
		goods = sd.findGoodsByStatus();
		return SUCCESS;
	}
	
	//超管删除商品
	public String deleteGood2() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		username = (String) session.getAttribute("username");
		String gid = request.getParameter("gid");
		ga.setGid(gid);
		sd.deleteGood(ga);
		list = sd.reviewGoods();
		goods = sd.findGoodsByStatus();
		return SUCCESS;
	}
	
}
