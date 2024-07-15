package com.sist.dao;

import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class SeoulDAO {

	private Connection conn;
	private PreparedStatement ps;
	private static SeoulDAO dao;
	
	public static SeoulDAO newInstance() {
		if(dao==null) dao=new SeoulDAO();
		return dao;
	}
	// 미리 생성된 Connection의 주소를 읽어서 사용
	// ====== TomCat에 의해 생성된다
	// POOL => 10 (maxIdle) 
	public void getConnection() {
		try {
			Context init = new InitialContext(); //탐색기 열기
			Context c = (Context)init.lookup("java://comp//env");
			DataSource ds = (DataSource)c.lookup("jdbc/oracle");
			conn = ds.getConnection();
			// 보안 (server.xml은 서버관리자만 볼 수 있다)
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	// 반환 => POOL (Connection객체 관리 영역)
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn !=null) conn.close();
		} catch (Exception ex) {}
	}
	public List<LocationVO> seoulLocationListData(int page){
		List<LocationVO> list = new ArrayList<LocationVO>();
		try {
			getConnection();
			String sql = "select no , title , poster , num "
					+ "	   from (select no , title , poster , rownum as num "
					+ "			   from (select /*+ INDEX_ASC(seoul_location sl_no_pk)*/no , title , poster "
					+ "   					    from seoul_location )) "
					+ "	   where num between ? and ?";
			ps=conn.prepareStatement(sql);
			int rowSize=12;
			int start = (rowSize*page)-(rowSize-1);
			int end = rowSize*page;
			
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
			disConnection();
		}
		return list;
	}
	public int seoulLocationTotalPage() {
		int total=0;
		try {
			getConnection();
			String sql="select ceil(count(*)/12.0) from seoul_location ";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return total;
	}
}
