package com.sist.dao;

import java.util.*;
import java.sql.*;
import com.sist.database.*;

public class goodsDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static goodsDAO dao;
	private DataBaseConnection dbConn = new DataBaseConnection();
	
	public static goodsDAO newInstance() {
		if(dao==null) dao= new goodsDAO();
		return dao;
	}
	/*
	 *  * NO                NOT NULL NUMBER(38)     
GOODS_NAME                 VARCHAR2(4000) 
GOODS_SUB                  VARCHAR2(4000) 
GOODS_PRICE                VARCHAR2(4000) 
GOODS_DISCOUNT             NUMBER(38)     
GOODS_FIRST_PRICE          VARCHAR2(4000) 
GOODS_DELIVERY             VARCHAR2(4000) 
GOODS_POSTER               VARCHAR2(4000) 
HIT                        NUMBER(38)     
	 */
	public List<goodsVO> goodsListData(int page){
		List<goodsVO> list = new ArrayList<goodsVO>();
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT no,goods_poster,goods_name,num "
					+ "FROM (SELECT no,goods_poster,goods_name,rownum as num  "
					+ "    FROM (SELECT no,goods_poster,goods_name FROM goods_all order by no))  "
					+ "        WHERE num BETWEEN ? AND ? ";
			ps= conn.prepareStatement(sql);
			int rowSize = 12;
			int start = (rowSize * page) - (rowSize - 1);
			int end = rowSize * page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				goodsVO vo = new goodsVO();
				vo.setNo(rs.getInt(1));
				vo.setPoster(rs.getString(2).replace("https","http"));
				vo.setName(rs.getString(3));
				
				list.add(vo);
			}
			rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		
		return list;
	}
	
	public int goodsTotalPage() {
		int total=0;
		try {
			conn=dbConn.getConnection();
			String sql = "SELECT CEIL(COUNT(*)/12.0) FROM goods_all ";
			
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return total;
	}
	
	public goodsVO goodsDetailData(int no){
		goodsVO vo = new goodsVO();
		try {
			conn = dbConn.getConnection();
			String sql = "UPDATE goods_all SET "
					+ "	 hit = hit+1 "
					+ "	where no=? ";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
			
			sql="select no,goods_name,goods_sub,goods_discount,goods_price,goods_first_price,goods_poster ,goods_delivery"
					+ " from goods_all "
					+ "where no = ? ";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSub(rs.getString(3));
			vo.setDiscount(rs.getInt(4));
			vo.setPrice(rs.getString(5));
			vo.setFirstprice(rs.getString(6));
			vo.setPoster(rs.getString(7).replace("https","http"));
			vo.setDelivery(rs.getString(8));
			
			rs.close();
			
			
		} catch (Exception ex) {
			System.out.println("===== goodsDetailData() 오류 =====");
			ex.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
		return vo;
	}
}


















