package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.dao.DbcpConnection;
import com.sist.vo.BoardVO;

import oracle.net.aso.c;
public class BoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static BoardDAO dao;
	private DbcpConnection dbConn = new DbcpConnection();
	
	public static BoardDAO newInstance() {
		if(dao==null) dao = new BoardDAO();
		return dao;
	}
	
	public List<BoardVO> boardListData(int page){
		List<BoardVO> list = new ArrayList<BoardVO>(); // list에 값을 채워서 브라우저로 전송
		//																			=> Model에서 처리 => Controller가 전송
		try {
			conn = dbConn.getConnection();
			String sql = "select no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD') , hit, num "
					+ "	   from (select no,subject,name,regdate , hit, rownum as num "
					+ "				from (select no,subject,name,regdate,hit "
					+ "						from board order by no desc)) "
					+ "	   where num between ? and ?";
			ps = conn.prepareStatement(sql);
			int rowSize=10;
			int start=(rowSize*page)-(rowSize-1);
			int end = (rowSize*page);
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setHit(rs.getInt(5));
				vo.setRownum(rs.getInt(6));
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
	// 총 페이지 구하기(번호 빠짐 없이(삭제할때))
	public int boardRowCount() {
		int total=0;
		try {
			conn = dbConn.getConnection();
			String sql="select count(*) from board";
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
	//글쓰기
	public void boardInsert(BoardVO vo) {
		try {
			conn = dbConn.getConnection();
			String sql="insert into board values( board_no_seq.nextval,?,?,?,?,sysdate,0 ) ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			
			ps.executeUpdate(); // commit() INSERT / UPDATE / DELETE
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
	}
	/*
	 *     화면 (JSP)
	 *     		= 오라클에 저장 데이터 => 80%
	 *     			=> 공유된 데이터 => SQL
	 *     		= 크롤링 / 공공데이터 포털 / SNS => API
	 *     
	 *     		1. 1차 => 데이터베이스 사용 ,  MVC이해 (구조 / 동작) , 자바스크립트
	 *     			*** AWS
	 *     		2. 2차 => Spring이해 / 기능 (보안 , 스케쥴러 . . .) , MyBatis , 최신 Front => Vue
	 *     			*** AWS
	 *     	    3. 3차 => 신기술 : Spring-Boot , MySQL , JPA
	 *     								=> Redux , React-Query
	 *     			*** 해봤다
	 */
	// 상세보기
	public BoardVO boardDetailData(int no) {
		BoardVO vo = new BoardVO();
		try {
			conn = dbConn.getConnection();
			String sql = "update board set "
					+ "	  hit = hit+1 "
					+ "	  where no="+no;
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
			
			sql = "select no,name,subject,content,hit,TO_CHAR(regdate,'YYYY-MM-DD') "
					+ "from board "
					+ "where no="+no;
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setHit(rs.getInt(5));
			vo.setDbday(rs.getString(6));
			rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
		return vo;
	}
	// 수정
	public BoardVO boardUpdateData(int no) {
		BoardVO vo = new BoardVO();
		try {
			conn = dbConn.getConnection();
			String sql = "select no,name,subject,content "
					+ "	   from board "
					+ "	   where no="+no;
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
		return vo;
	}
	public boolean boardUpdate(BoardVO vo) {
		boolean bCheck=false;
		try {
			conn = dbConn.getConnection();
			String sql="select pwd from board where no="+vo.getNo();
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			rs.close();
			if(db_pwd.equals(vo.getPwd())) {
				bCheck=true;
				sql="update board set "
						+ " name=?,subject=?,content=? "
						+ " where no=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getName());
				ps.setString(2, vo.getSubject());
				ps.setString(3, vo.getContent());
				ps.setInt(4, vo.getNo());
				ps.executeUpdate();
			} 
		} catch (Exception ex) {
			ex.printStackTrace();// 에러 확인
		} finally {
			dbConn.disConnection(conn, ps);
		}
		return bCheck;
	}
	public boolean boardDelete(int no,String pwd) {
		boolean bCheck=false;
		try {
			conn = dbConn.getConnection();
			String sql="select pwd from board where no="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			rs.close();
			if(db_pwd.equals(pwd)) {
				bCheck=true;
				sql="delete  from board where no="+no;
				ps=conn.prepareStatement(sql);
				ps.executeUpdate();
			} 
		} catch (Exception ex) {
			ex.printStackTrace();// 에러 확인
		} finally {
			dbConn.disConnection(conn, ps);
		}
		return bCheck;
	}
	/*
	 * 		try {
				conn = dbConn.getConnection();
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				dbConn.disConnection(conn, ps);
			}
	 */
}
