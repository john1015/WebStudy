package com.sist.dao;

import java.util.*;
import com.sist.database.DataBaseConnection;
import java.sql.*;

public class goodsDAO {
    private Connection conn;
    private PreparedStatement ps;
    private DataBaseConnection dbConn = new DataBaseConnection();
    private static goodsDAO dao;
    private String[] mode = {"","goods_all", "goods_best", "goods_new", "GOODS_SPECIAL"};
    
    public static goodsDAO newInstance() {
        if (dao == null) dao = new goodsDAO();
        return dao;
    }
    
    public List<goodsVO> goodsFindData(String name, int page) {
        List<goodsVO> list = new ArrayList<goodsVO>();
        try {
            conn = dbConn.getConnection();
            String sql = "select no, goods_name, goods_poster, num "
                       + "from (select no, goods_name, goods_poster, rownum as num "
                       + "      from (select no, goods_name, goods_poster "
                       + "            from goods_all "
                       + "            where goods_name like '%'||?||'%')) "
                       + "where num between ? and ?";
            ps = conn.prepareStatement(sql);
            int rowSize = 12;
            int start = (rowSize * page) - (rowSize - 1);
            int end = rowSize * page;
            
            ps.setString(1, name);
            ps.setInt(2, start);
            ps.setInt(3, end);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                goodsVO vo = new goodsVO();
                vo.setNo(rs.getInt(1));
                vo.setName(rs.getString(2));
                vo.setPoster(rs.getString(3).replace("https", "http"));
                list.add(vo);
            }
            rs.close();
        } catch (Exception ex) {
            System.out.println("======== goodsFindData 오류 ==========");
            ex.printStackTrace();
        } finally {
            dbConn.disConnection(conn, ps);
        }
        return list;
    }

    public int goodsFindTotalPage(int no) {
        int total = 0;
        try {
            conn = dbConn.getConnection();
            String sql = "select ceil(count(*)/12.0) "
                       + "from goods_all "
                       + "where no like '%'||?||'%'";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, no);
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
    
    public List<goodsVO> goodsListData(int type, int page) {
        List<goodsVO> list = new ArrayList<goodsVO>();
        try {
            conn = dbConn.getConnection();
            String sql = "select no, goods_name, goods_poster, num "
                       + "from (select no, goods_name, goods_poster, rownum as num "
                       + "      from (select no, goods_name, goods_poster "
                       + "            from " + mode[type] + ")) "
                       + "where num between ? and ?";
            ps = conn.prepareStatement(sql);
            int rowSize = 12;
            int start = (rowSize * page) - (rowSize - 1);
            int end = rowSize * page;
            
            ps.setInt(1, start);
            ps.setInt(2, end);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                goodsVO vo = new goodsVO();
                vo.setNo(rs.getInt(1));
                vo.setName(rs.getString(2));
                vo.setPoster(rs.getString(3).replace("https", "http"));
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
    
    public int goodsListTotalPage(int type) {
        int total = 0;
        try {
            conn = dbConn.getConnection();
            String sql = "select ceil(count(*)/12.0) "
                       + "from " + mode[type];
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
    public goodsVO goodsDetailData(int no,int type){
		goodsVO vo = new goodsVO();
		try {
			conn = dbConn.getConnection();
			String sql = "UPDATE "+mode[type]+ " SET "
					+ "	 hit = hit+1 "
					+ "	where no=? ";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
			
			sql="select no,goods_name,goods_sub,goods_discount,goods_price,goods_first_price,goods_poster ,goods_delivery "
					+ "from " + mode[type] +
					 " where no = ? ";
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
