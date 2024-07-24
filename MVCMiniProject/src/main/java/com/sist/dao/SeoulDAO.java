package com.sist.dao;

import java.util.*;
import java.sql.*;
import com.sist.dao.DbcpConnection;
import com.sist.vo.LocationVO;

public class SeoulDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static SeoulDAO dao;
	private DbcpConnection dbConn = new DbcpConnection();
	private final int ROWSIZE=20;
	
	public static SeoulDAO newInstance() {
		if(dao==null) dao = new SeoulDAO();
		return dao;
	}
	
	public List<LocationVO> seoulTop12()
	   {
		   List<LocationVO> list=new ArrayList<LocationVO>();
		   try
		   {
			   conn=dbConn.getConnection();
			   String sql="SELECT no,title,poster,rownum "
					     +"FROM (SELECT no,title,poster "
					     +"FROM seoul_location) "
					     +"WHERE rownum<=12";
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   LocationVO vo=new LocationVO();
				   vo.setNo(rs.getInt(1));
				   vo.setTitle(rs.getString(2));
				   vo.setPoster(rs.getString(3));
				   list.add(vo);
			   }
			   rs.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   dbConn.disConnection(conn, ps);
		   }
		   return list;
	   }
	public List<LocationVO> locationListData(int page){
		List<LocationVO> list = new ArrayList<LocationVO>();
		try {
			conn = dbConn.getConnection();
			String sql = "select no,title,poster,num "
					+ "	   from (select no,title,poster,rownum as num "
					+ "				from (select no,title,poster "
					+ "						 from seoul_location order by no asc)) "
					+ "	   where num between ? and ? ";
			ps = conn.prepareStatement(sql);
			
			int start = (ROWSIZE*page)-(ROWSIZE-1);
			int end = ROWSIZE*page;
			
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				LocationVO vo = new LocationVO();
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
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
	
	public int locationTotalPage() {
		int total=0;
		try {
			conn = dbConn.getConnection();
			String sql = "select ceil(count(*)/"+ROWSIZE+") from seoul_location";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
		return total;
	}
}
