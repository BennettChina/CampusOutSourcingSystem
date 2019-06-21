package com.coss.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.coss.model.CustomInfoBean;
import com.coss.model.GoodBean;
import com.coss.model.GoodsAttribute;
import com.coss.model.ShopsAttribute;
import com.coss.util.JDBCUtils;

/**
 * 
 * @comment 商品的Dao层
 * 
 * @author 召
 * 
 * @date 2019年4月2日 下午9:33:37
 * 
 * @version 1.0.0
 * 
 */
public class ShopsDao {
	public List<GoodsAttribute> list = new ArrayList<GoodsAttribute>();
	public List<ShopsAttribute> list1 = new ArrayList<ShopsAttribute>();
	public List<ShopsAttribute> list2 = new ArrayList<ShopsAttribute>();
	String cId;// 用来保存添加的商家的id

	// 查找商品的状态，用以分配是否上推荐
	public List<GoodsAttribute> findGoodsByStatus() {
		String sql = "select goods.gId gid,goods.gname,goods.price,goods.cId cid,goods.foodImg,shop.shopName from goods,shop where goods.status= ? and shop.status = ? and goods.cId = shop.cId GROUP BY gId";
		GoodsAttribute ga = new GoodsAttribute();
		list = JDBCUtils.search(sql, GoodsAttribute.class, ga.getRECOMMEND(),ShopsAttribute.getVerified());
		Iterator<GoodsAttribute> goods = list.iterator();
		while(goods.hasNext()) {
			GoodsAttribute good = goods.next();
			good.setState("已推荐");
		}
		return list;
	}
	
	// 通过商家类型查找
	public List<ShopsAttribute> findGoodsByType(ShopsAttribute shops) {
		String sql = "select shopName,logo from shop where type= ? and rId = (select rId from restaurant where rName = ?) and status = ?";
		list1 = JDBCUtils.search(sql, ShopsAttribute.class, shops.getType(),shops.getRname(),ShopsAttribute.getVerified());
		return list1;
	}

	// 通过商品名查找商家
	public List<ShopsAttribute> searchByName(ShopsAttribute shops) {
		String sql = "select shop.shopName,shop.logo,restaurant.rName rname from shop,restaurant where cId=(select cId from goods where gname = ?) and shop.rId = restaurant.rId and shop.status = ?";
		list1 = JDBCUtils.search(sql, ShopsAttribute.class, shops.getShopName(),ShopsAttribute.getVerified());
		return list1;
	}

	// 通过商家名查找商家信息
	public List<ShopsAttribute> findShopsByShopName(ShopsAttribute shops) {
		String sql = "select shop.shopName,shop.logo,shop.addr,restaurant.rName rname from shop,restaurant where shopName= ? and shop.rId = restaurant.rId and shop.status = ?";
		list1 = JDBCUtils.search(sql, ShopsAttribute.class, shops.getShopName(),ShopsAttribute.getVerified());
		return list1;
	}

	// 通过商家ID查找商家信息
	public List<ShopsAttribute> findShopsBycId(ShopsAttribute shops) {
		String sql = "select shopName,logo,addr from shop where cId = ?";
		list1 = JDBCUtils.search(sql, ShopsAttribute.class, shops.getCid());
		return list1;
	}

	// 通过商家名查找商品信息
	public List<GoodsAttribute> findGoodsByShopName(GoodsAttribute goods) {
		String sql = "select gname,foodImg,price from goods where cId=(select cId from shop where shopName = ?)";
		list = JDBCUtils.search(sql, GoodsAttribute.class, goods.getShopName());
		return list;
	}

	// 通过商家ID查找商品信息
	public List<GoodsAttribute> findGoodsBycId(GoodsAttribute goods) {
		String sql = "select gname,foodImg,price,gId gid from goods where cId= ?";
		list = JDBCUtils.search(sql, GoodsAttribute.class, goods.getCid());
		return list;
	}

	// 通过商家所属餐厅的ID号查找商家
	public List<ShopsAttribute> findGoodsByrId(ShopsAttribute shops) {
		String sql = "select shop.shopName,shop.logo,shop.rId rid,restaurant.rName rname from shop,restaurant where"
				+ " shop.rId= restaurant.rId and restaurant.rId = ? and shop.status = ?";
		list1 = JDBCUtils.search(sql, ShopsAttribute.class, shops.getRid(),ShopsAttribute.getVerified());
		return list1;
	}

	// 查找餐厅的名字
	public List<ShopsAttribute> findRestaurantByrId(ShopsAttribute shops) {
		String sql = "select rId rid,rName rname from restaurant where rId= ?";
		list2 = JDBCUtils.search(sql, ShopsAttribute.class, shops.getRid());
		return list2;
	}

	// 通过餐厅名查找商家信息
	public List<ShopsAttribute> findByrName(ShopsAttribute shops) {
		String sql = "select rId rid,logo,shopName from shop where rId = (select rId from restaurant where rName = ?) and status = ?";
		list1 = JDBCUtils.search(sql, ShopsAttribute.class, shops.getRname(),ShopsAttribute.getVerified());
		return list1;
	}

	// 更新商品的价格
	
	/**
	 * 
	 *  未实现
	 * @throws Exception 
	 * 
	 * */
	
	// 添加商家
	public List<ShopsAttribute> insertShops(ShopsAttribute shops) {
		String sql = "insert into shop values (?,?,?,?,?,?,?,?)";
		cId = "s"+System.currentTimeMillis();
		JDBCUtils.update(sql, cId,shops.getRid(),shops.getShopName(),shops.getType(),shops.getAddr(),shops.getLogo(),ShopsAttribute.getVerify(),shops.getUid());
		ShopsAttribute shop = new ShopsAttribute();
		shop.setShopName(shops.getShopName());
		shop.setAddr(shops.getAddr());
		list1.add(shop);
		return list1;
	}

	// 添加商品
	public void insertGoods(GoodsAttribute goods) {
		String sql = "insert into goods values (?,?,?,?,?,?)";
		String gId = "g"+(System.currentTimeMillis() + 1000);
		JDBCUtils.update(sql, gId,goods.getGname(),goods.getPrice(),goods.getFoodImg(),goods.getNORMAL(),cId);
	}
	//查找所有未通过审核的商家
	public List<ShopsAttribute> findShopsByStatus() {
		String sql = "select cId cid,logo,shopName,type,status from shop where status = ?";
		list1 = JDBCUtils.search(sql, ShopsAttribute.class,ShopsAttribute.getVerify());
		return list1;
	}

	//通过商家审核
	public void allow(ShopsAttribute sa) {
		String sql = "update shop set status = ? where cId = ?";
		JDBCUtils.update(sql,ShopsAttribute.getVerified(),sa.getCid());
	}

	//删除指定商家
	public void deleteShop(ShopsAttribute sa) {
		String sql = "delete from shop where cId = ?";
		JDBCUtils.update(sql, sa.getCid());
	}

	//查找某商家
	public List<ShopsAttribute> searchShops(ShopsAttribute sa) {
		String sql = "select cId cid,logo,shopName,type,status from shop where shopName = ?";
		list1 = JDBCUtils.search(sql, ShopsAttribute.class, sa.getShopName());
		return list1;
	}

	//商家申请菜品上推荐
	public void apply(GoodsAttribute ga) {
		String sql = "update goods set status = ? where gId = ?";
		JDBCUtils.update(sql, ga.getAPPLY(),ga.getGid());
	}

	//查找商家所有商品
	public List<GoodsAttribute> findGoodsByUname(String username) {
		String sql = "select g.gId gid,g.gname,g.price,g.foodImg,g.status,g.cId cid,s.shopName "
				+ "from goods g,shop s where s.uId = (select uId from user where uname = ?) and s.cId = g.cId";
		list = JDBCUtils.search(sql, GoodsAttribute.class, username);
		Iterator<GoodsAttribute> goods = list.iterator();
		while(goods.hasNext()) {
			GoodsAttribute good = goods.next();
			if(good.getStatus() == good.getNORMAL()) {
				good.setState("未被推荐");
			}else if(good.getStatus() == good.getRECOMMEND()) {
				good.setState("已被推荐");
			}else {
				good.setState("申请推荐中");
			}
		}
		return list;
	}

	//删除商品
	public void deleteGood(GoodsAttribute ga) {
		//String sql = "delete from goods where gId = ?";
		String sql = "update goods set status = ? where gId = ?";
		JDBCUtils.update(sql, ga.getNORMAL(),ga.getGid());
	}

	//更新商品的价格
	public void updatePrice(GoodsAttribute ga) {
		String sql = "update goods set price = ? where gId = ?";
		JDBCUtils.update(sql, ga.getPrice(),ga.getGid());
	}

	
	//查找未审核商家推荐的商品
	public List<GoodsAttribute> reviewGoods() {
		String sql = "select gId gid,gname,price,foodImg,status,cId cid"
				+ " from goods where status = ?";
		GoodsAttribute ga = new GoodsAttribute();
		list = JDBCUtils.search(sql, GoodsAttribute.class,ga.getAPPLY());
		Iterator<GoodsAttribute> goods = list.iterator();
		while(goods.hasNext()) {
			GoodsAttribute good = goods.next();
			good.setState("待审核");
		}
		return list;
	}

	//通过商品的审核
	public void allowGood(GoodsAttribute ga) {
		String sql = "update goods set status = ? where gId = ?";
		JDBCUtils.update(sql,ga.getRECOMMEND(),ga.getGid());
	}

	//移除商品的推荐状态
	public void remove(GoodsAttribute ga) {
		String sql = "update goods set status = ? where gId = ?";
		JDBCUtils.update(sql,ga.getNORMAL(),ga.getGid());
	}
	
	public void InsertInfo(List<CustomInfoBean> tmpInfo,String demand,List<GoodBean> tmpGoods,String addr) {
		String sql = "insert into customInfo values(?,?,?,?,?,?)";
		String sql2 = "insert into custom_goods values(?,?,?,?,?)";
		
		String id = "" + System.currentTimeMillis();
		String name = tmpInfo.get(0).getUsername();
		String tel = tmpInfo.get(0).getTelphone();
		String address = tmpInfo.get(0).getAddress();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(new Date());
		JDBCUtils.update(sql, id, name, tel, address, demand,time);
		
		for (int i = 0; i < tmpGoods.size(); i++) {
			JDBCUtils.update(sql2, tmpGoods.get(i).getGoodName().trim(), tmpGoods.get(i).getGoodCount(),
					tmpGoods.get(i).getGoodPrice(), id, addr);
		}
	}
}
