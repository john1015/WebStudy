package com.sist.dao;

import java.util.*;

import com.sist.database.DataBaseConnection;

import java.sql.*;

/*
 * 		1. 오라클 연결 => TCP
 * 			Connection : Socket
 * 							  ===== IP / PORT
 * 		2. SQL문장 전송 / 수신
 * 			PreparedStatement : BufferedReader / OutputStream
 * 												|						| executeQuery , executeUpdate
 * 											ResultSet => 브라우저 전송 : List / VO
 * 		=======================================
 * 									요청  ===> 요청값 받기 (request) => BufferedReader
 * 			브라우저		<==========>      서버 (DAO , JSP)
 * 									응답 (HTML)
 * 									response : OutputStream
 * 			네트워크 : 서버 / 클라이언트
 * 						  |
 * 						오라클 / 웹(톰캣)
 * 			순서 => SQL문장 주력
 * 
 * 
 * 			1.JSP
 * 			   ===
 * 				1) 오라클로부터 데이터 읽기
 * 					<%
 * 						
 * 					%>
 * 				2) 데이터를 HTML 출력
 */

public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private DataBaseConnection dbConn = new DataBaseConnection();
	private static FoodDAO dao;
	private String[] mode = {"","한식" , "중식" , "양식" , "일식"};
	
	
	public static FoodDAO newInstance(){
		if(dao==null) dao = new FoodDAO();
		return dao;
	}
	
	public List<FoodVO> foodFindData (String addr , int page){
		List<FoodVO> list= new ArrayList<FoodVO>();
		try {
			conn = dbConn.getConnection();
			String sql="select fno,name,poster,num "
					+ "	from (select fno,name,poster,rownum as num "
					+ "  			 from (select fno,name,poster "
					+ "						from food_house "
					+ "						where address like '%'||?||'%' )) "
					+ "	where num between ? and ? ";
			ps= conn.prepareStatement(sql);
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1);
			int end = (rowSize*page);
			
			ps.setString(1, addr);
			ps.setInt(2, start);
			ps.setInt(3, end);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				FoodVO vo = new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPoster(rs.getString(3).replace("https", "http"));
				list.add(vo);
			}
			rs.close();
		} catch (Exception ex) {
			System.out.println("======== foodFindData오류 ==========");
			ex.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
		return list;
	}
	public int foodFindTotalPage(String addr) {
		int total=0;
		try {
			conn = dbConn.getConnection();
			String sql =" select ceil(count(*)/12) "
					+ "	   from food_house "
					+ "	   where address like '%'||?||'%'";
			ps = conn.prepareStatement(sql);
			ps.setString(1, addr);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
					rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return total;
	}
	/*
	 * 종류별 분리 50~60 : SELECT
	 * 
	 * INSERT : 게시판, 글쓰기 ,댓글 ,회원가입 ,장바구니 ,예약
	 * UPDATE : 게시판수정 , 댓글 수정 , 외원가입 , 장바구니 수정 , 예약 수정
	 * DELETE : 게시판 삭제 , 댓글 삭제 , 회원가입 탈퇴 , 장바구니 취소 , 예약 취소
	 * 나머지 SELECT
	 */
	
	public List<FoodVO> foodListData(int type,int page){
		List<FoodVO> list = new ArrayList<FoodVO>();
		
		try {
			conn = dbConn.getConnection();
			
			String sql="select fno , name ,poster , num "
					+ "	 from (select fno , name , poster  , rownum as num "
					+ "			 from (select fno , name , poster "
					+ "					  from food_house "
					+ "					  where type like '%'||?||'%')) "
					+ "    where num between ? and ? ";
			/*
			 * 			String sql="select fno , name ,poster , num "
					+ "	 from (select fno , name , poster  , rownum as num "
					+ "			 from (select fno , name , poster "
					+ "					  from food_house "
					+ "					  where regexp_like(type,?,?))) "
					+ "    where num between ? and ? ";
			
			 */
			ps = conn.prepareStatement(sql);
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			
			//?에 값을 채운다
			ps.setString(1, mode[type]);
			ps.setInt(2, start);
			ps.setInt(3, end);
			// => 전체 / 베스트 / 특가 / 신상품 => 각각 테이블이 만들어져 있다
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				
				FoodVO vo = new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPoster(rs.getString(3).replace("https", "http"));
				list.add(vo);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
		return list;
	}
	
	public int foodListTotalPage(int type){
		int total=0;
		try {
			conn = dbConn.getConnection();
			
			String sql = "select ceil(count(*)/12.0) "
					+ "	   from food_house "
					+ "	   where type like '%'||?||'%'";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mode[type]);
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
}
