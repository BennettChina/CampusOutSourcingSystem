package com.coss.util;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.commons.dbcp2.BasicDataSourceFactory;

/**
 * 
 * @comment 数据库工具类
 * 
 * @author 召
 * 
 * @date 2019年4月28日 上午10:03:48
 * 
 * @version 1.0.0
 * 
 */
public class JDBCUtils {

	// 定义数据库连接池
	private static BasicDataSource bds;
	static {
		Properties dbcpInfo = new Properties();
		try (InputStream is = JDBCUtils.class.getClassLoader().getResourceAsStream("dbcp.properties");) {
			// 加载流
			dbcpInfo.load(is);
			// 创建dataSource对象
			bds = BasicDataSourceFactory.createDataSource(dbcpInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @return 获取到的数据库连接
	 * @throws Exception
	 * 
	 * @exception ClassNotFondException
	 * 
	 * @Author 召
	 * 
	 * @Date 2019年4月28日 上午10:11:00
	 * 
	 * @since 1.0.0
	 * 
	 */
	public static Connection getConnect() throws Exception {
		return bds.getConnection();
	}

	/**
	 * 
	 * @param sql
	 * @param args
	 * @return 通用增删改影响到的数据库的列数-----不考虑事务
	 * @throws Exception
	 * 
	 * @exception IOException、Exception
	 * 
	 * @Author 召
	 * 
	 * @Date 2019年4月28日 上午10:20:05
	 * 
	 * @since 1.0.0
	 * 
	 */
	public static int update(String sql, Object... args) {
		int row = 0;
		try(Connection con = getConnect();
			PreparedStatement pst = con.prepareStatement(sql);){
			for (int i = 0; i < args.length; i++) {
				pst.setObject(i + 1, args[i]);
			}
			row = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}

	/**
	 * 
	 * @param con
	 * @param sql
	 * @param args
	 * @return 通用增删改的影响的列数----考虑事物
	 * @throws Exception
	 * 
	 * @exception
	 * 
	 * 				@Author
	 *                召
	 * 
	 * @Date 2019年4月28日 上午11:26:40
	 * 
	 * @since 1.0.0
	 * 
	 */
	public static int update(Connection con, String sql, Object... args) {
		int row = 0;
		try(PreparedStatement pst = con.prepareStatement(sql);){
			for (int i = 0; i < args.length; i++) {
				pst.setObject(i + 1, args[i]);
			}
			row = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}

	/**
	 * 
	 * @param sql
	 * @param clazz
	 * @param args
	 * @return 通用查询的结果集----不考虑事务
	 * @throws Exception
	 * 
	 * @exception
	 * 
	 * 				@Author
	 *                召
	 * 
	 * @Date 2019年4月28日 上午11:20:41
	 * 
	 * @since 1.0.0
	 * 
	 */
	public static <T> List<T> search(String sql, Class<T> clazz, Object... args) {
		List<T> list = new ArrayList<>();
		try(Connection con = getConnect();
			PreparedStatement pst = con.prepareStatement(sql);){
			for (int i = 0; i < args.length; i++) {
				pst.setObject(i + 1, args[i]);
			}
			ResultSet rs = pst.executeQuery();
			// 获取查询结果集的元数据
			ResultSetMetaData rsmd = rs.getMetaData();
			// 获取结果集的列数
			int columnCount = rsmd.getColumnCount();
			while (rs.next()) {
				T t = clazz.newInstance();
				for (int i = 0; i < columnCount; i++) {
					String fieldName = rsmd.getColumnLabel(i + 1);
					// 查询的列名必须与类的属性名一致
					Field field = clazz.getDeclaredField(fieldName);
					field.setAccessible(true);
					Object value = rs.getObject(fieldName);
					if (value != null) {
						field.set(t, value);
					}
				}
				list.add(t);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 
	 * @param con
	 * @param sql
	 * @param clazz
	 * @param args
	 * @return 通用查询的结果集----考虑事务
	 * @throws Exception
	 * 
	 * @exception
	 * 
	 * 				@Author
	 *                召
	 * 
	 * @Date 2019年4月28日 上午11:25:19
	 * 
	 * @since 1.0.0
	 * 
	 */
	public static <T> List<T> search(Connection con, String sql, Class<T> clazz, Object... args) {
		List<T> list = new ArrayList<>();
		try(PreparedStatement pst = con.prepareStatement(sql);){
			for (int i = 0; i < args.length; i++) {
				pst.setObject(i + 1, args[i]);
			}
			ResultSet rs = pst.executeQuery();
			// 获取查询结果集的元数据
			ResultSetMetaData rsmd = rs.getMetaData();
			// 获取结果集的列数
			int columnCount = rsmd.getColumnCount();
			while (rs.next()) {
				T t = clazz.newInstance();
				for (int i = 0; i < columnCount; i++) {
					String fieldName = rsmd.getColumnLabel(i + 1);
					// 查询的列名必须与类的属性名一致
					Field field = clazz.getDeclaredField(fieldName);
					field.setAccessible(true);
					Object value = rs.getObject(fieldName);
					if (value != null) {
						field.set(t, value);
					}
				}
				list.add(t);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
