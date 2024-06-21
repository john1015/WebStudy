package com.sist.dao;

import java.util.*;
import java.sql.*;

public class GoodsDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	private static GoodsDAO dao;
	
	
	public GoodsDAO() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (Exception ex) {
		} 
	}
	
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL,"hr","happy");
		} catch (Exception ex) {}
	}
	
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		} catch (Exception ex) {}
	}
	
	public static GoodsDAO newInstance() {
		if(dao==null) dao = new GoodsDAO();
		return dao;
	}
	
	// 기능 설정
	// 상품 목록 출력
	public List<GoodsVO> goodsListData(int page){
		List<GoodsVO> list = new ArrayList<GoodsVO>();
		try {
			getConnection();
			String sql = "select goods_name , goods_poster , num "
					+ "from (select goods_name,goods_poster, rownum as num "
					+ "from (select goods_name , goods_poster "
					+ "from goods_all order by no ASC)) "
					+ "where num between ? and ? ";
			ps = conn.prepareStatement(sql);
			int rowSize = 12;
			int start = (rowSize*page) - (rowSize-1);
			int end = rowSize*page;
			
			// ?에 값을 채운다
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				GoodsVO vo = new GoodsVO();
				vo.setName(rs.getString(1));
				vo.setPoster(rs.getString(2));
				list.add(vo);
			}
			rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
		return list;
	}
	
	// 총페이지
	public int goodsTotalPage() {
		int total=0;
		try {
			getConnection();
			String sql = "select CEIL(count(*)/12.0) from goods_all ";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
		return total;
	}
}
