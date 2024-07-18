package com.sist.dao;

import java.sql.*;
import java.util.*;
import javax.sql.*;
import javax.naming.*;

public class EmpDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static EmpDAO dao;
	
	// 싱글턴
	public static EmpDAO newInstance() {
		if(dao==null) dao= new EmpDAO();
		return dao;
	}
	
	public void getConnection() {
		try {
			Context init = new InitialContext();
			Context c = (Context)init.lookup("java://comp//env"); 
			DataSource ds = (DataSource)c.lookup("jdbc/oracle");
			conn = ds.getConnection(); 
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		} catch (Exception ex) {}
	}
	public List<EmpVO> empListData(){
		List<EmpVO> list = new ArrayList<EmpVO>();
		try {
			getConnection();
			String sql="select empno , ename , job , sal , hiredate "
					+ "	 from emp ";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				EmpVO vo = new EmpVO();
				vo.setEmpno(rs.getInt(1));
				vo.setEname(rs.getString(2));
				vo.setJob(rs.getString(3));
				vo.setSal(rs.getInt(4));
				vo.setHiredate(rs.getDate(5));
				
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
}
