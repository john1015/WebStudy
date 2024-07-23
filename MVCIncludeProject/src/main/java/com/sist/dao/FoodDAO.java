package com.sist.dao;

import java.util.*;
import java.nio.file.attribute.AclEntry;
import java.sql.*;
import com.sist.dao.*;

public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static FoodDAO dao;
	private DbcpConnection dbConn = new DbcpConnection();
	
	public static FoodDAO newInstance() {
		if(dao==null) dao=new FoodDAO();
		return dao;
	}
	public List<FoodVO> foodListData(int page){
		List<FoodVO> list = new ArrayList<FoodVO>();
		try {
			conn=dbConn.getConnection();
			String sql = "SELECT fno,name,poster,score,phone,address,num "
					+ "				     FROM (SELECT fno,name,poster,score,phone,address,rownum as num "
					+ "				     FROM (SELECT fno,name,poster,score,phone,address "
					+ "				     FROM food_house ORDER BY fno ASC)) "
					+ " where num between ? and ?";
			ps = conn.prepareStatement(sql);
			int rowSize = 20;
			int start = (rowSize*page)-(rowSize-1);
			int end = rowSize*page;
			
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				FoodVO vo = new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPoster(rs.getString(3));
				vo.setScore(rs.getDouble(4));
				vo.setPhone(rs.getString(5));
				vo.setAddress(rs.getString(6));
				
				list.add(vo);
			}
			rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
		return list;
	}
	public int foodTotalPage() {
		int total=0;
		try {
			conn=dbConn.getConnection();
			String sql = "select ceil(count(*)/20.0) from food_house";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
		return total;
	}
	public FoodVO foodDetailData(int fno) {
		FoodVO vo = new FoodVO();
		try {
			conn = dbConn.getConnection();
			String sql = "select fno,name,poster,phone,address,score,content,type,theme "
					+ "	  from food_house "
					+ "	  where fno="+fno;
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setFno(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setPoster(rs.getString(3));
			vo.setPhone(rs.getString(4));
			vo.setAddress(rs.getString(5));
			vo.setScore(rs.getDouble(6));
			vo.setContent(rs.getString(7));
			vo.setType(rs.getString(8));
			vo.setTheme(rs.getString(9));
			rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
		return vo;
	}
}
