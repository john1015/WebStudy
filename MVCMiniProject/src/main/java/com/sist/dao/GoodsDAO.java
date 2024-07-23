package com.sist.dao;

import com.sist.vo.*;
import java.util.*;
import java.sql.*;
import com.sist.dao.DbcpConnection;

public class GoodsDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static GoodsDAO dao;
	private DbcpConnection dbConn = new DbcpConnection();
	
	public static GoodsDAO newInstance() {
		if(dao==null) dao = new GoodsDAO();
		return dao;
	}
	
	public List<GoodsVO> goodsTop12(){
		List<GoodsVO> list = new ArrayList<GoodsVO>();
		try {
			conn=dbConn.getConnection();
			String sql="select no,goods_name,goods_poster,rownum "
					+ "	 from (select no,goods_name,goods_poster "
					+ "			  from Goods_All order by hit desc) "
					+ "	 where rownum<=12";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				GoodsVO vo = new GoodsVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPoster(rs.getString(3));
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
}
