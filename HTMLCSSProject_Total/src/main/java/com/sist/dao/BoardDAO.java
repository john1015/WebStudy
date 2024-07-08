package com.sist.dao;

import java.util.*;
import java.sql.*;
import com.sist.database.*;

public class BoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static BoardDAO dao;
	private DataBaseConnection dbConn = new DataBaseConnection();
	private String[] mode = {"","이름" , "제목" , "내용" };
	//싱글턴
	public static BoardDAO newInstance() {
		if(dao==null) dao = new BoardDAO();
		return dao;
	}
	//기능
	//1.목록 => SELECT (페이지 나누기) => 인라인 뷰 => <table><a>
	public List<BoardVO> boardListData(int page){
		List<BoardVO> list= new ArrayList<BoardVO>();
		try {
			// 오라클 연결
			conn = dbConn.getConnection();
			String sql = "select no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD') , hit , num "
					+ "	   from (select no ,subject ,name, regdate , hit , rownum as num "
					+ "				from (select /*+ INDEX_DESC(board board_no_pk)*/ no,subject,name,regdate,hit "
					+ "						 from board)) "
					+ "	   where num between ? and ? ";
							 //order by 보다는 index_asc(테이블명 pk) => index는 pk,uk는 자동 생성
			// 오라클로 sql문장 전송
			ps = conn.prepareStatement(sql);
			// 실행전에 ? 가있는 경우 값을 채운다
			int rowSize=10;
			int start=(rowSize*page)-(rowSize-1); // rownum은 1번부터 시작
			int end = (rowSize*page);
			
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			// 실행을 요청하고 결과값을 받는다
			ResultSet rs = ps.executeQuery();
			while(rs.next()) { // rs.next()는 데이터 출력의 첫번째 위치에 cursor을 이동
				BoardVO vo = new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDb_day(rs.getString(4));
				vo.setHit(rs.getInt(5));
				
				list.add(vo);
			}
			rs.close();
		} catch (Exception ex) {
			System.out.println("========= boardListData 오류발생 =========");
			ex.printStackTrace();
		}finally {
			// 닫기 Connection => 계속 오라클을 연결한다
			dbConn.disConnection(conn, ps);
		}
		return list;
	}
	// 1-2 총페이지
	public int boardTotalPage() {
		int total=0;
		try {
			conn = dbConn.getConnection();
			
			String sql = "select count(*) from board";
			ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		} catch (Exception ex) {
			System.out.println("====== boardTotalPage() 오류 발생 =====");
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return total;
	}
	//2.상세보기 => SELECT (WHERE) => <table>
	public BoardVO boardDetailData(int no) {
		// 상세보기 => 반드시 Primary Key값을 넘겨준다 (중복이 없는 데이터)
		BoardVO vo = new BoardVO();
		try {
			conn = dbConn.getConnection();
			
			String sql ="update board set "
					+ "	  hit = hit + 1 "
					+ "	  where no = "+no;
			ps = conn.prepareStatement(sql);
			ps.executeUpdate(); // 조회수 증가 => cimmit()
			
			sql="select no , name , subject , content, TO_CHAR(regdate,'YYYY-MM-DD'),hit "
			  + " from board "
			   + "where no= "+no;
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setDb_day(rs.getString(5));
			vo.setHit(rs.getInt(6));
			rs.close();
		} catch (Exception ex) {
			System.out.println("======== boardDetailData오류 발생 ======");
			ex.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
		return vo;
	}
	//3.글쓰기 => input
	public void boardInsert(BoardVO vo) {
		try {
			conn = dbConn.getConnection();
			
			String sql ="insert into board values ( "
					+ " board_no_seq.nextval , ? , ? , ? ,? , SYSDATE , 0 ) ";
			ps = conn.prepareStatement(sql);
			// ? 에 값 채우기
			ps.setString(1,vo.getName());
			ps.setString(2,vo.getSubject());
			ps.setString(3,vo.getContent());
			ps.setString(4,vo.getPwd());
			
			// 실행 요청
			ps.executeUpdate();
		} catch (Exception ex) {
			System.out.println("=======board insert 오류발생 =====");
			ex.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
	}
	//4.수정하기 => input
	public BoardVO boardUpdateData(int no) {
		// 상세보기 => 반드시 Primary Key값을 넘겨준다 (중복이 없는 데이터)
		BoardVO vo = new BoardVO();
		try {
			conn = dbConn.getConnection();
			
			 String sql="select no , name , subject , content "
			  + " from board "
			  + " where no= "+no;
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			rs.close();
		} catch (Exception ex) {
			System.out.println("======== boardUpdateData오류 발생 ======");
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
			
			String sql="select pwd from board where no=? ";
			ps= conn.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			ResultSet rs = ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			rs.close();
			
			if(db_pwd.equals(vo.getPwd())) {
				bCheck=true;
				sql="update board set "
					+ "name=? , subject=? , content=? "
					+ "where no=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getName());
				ps.setString(2, vo.getSubject());
				ps.setString(3, vo.getContent());
				ps.setInt(4, vo.getNo());
				ps.executeUpdate();
			} else {
				bCheck=false;
			}
		} catch (Exception ex) {
			System.out.println("======= boardUpdate 오류발생 ==========");
			ex.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
		return bCheck;
				
	}
	//5.삭제하기 => input
	public boolean boardDelete(int no , String pwd) {
		boolean bCheck=false;
		try {
			conn = dbConn.getConnection();
			String sql = "select pwd from board "
					+ "      where no ="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			String db_pwd = rs.getString(1);
			rs.close();
			
			if(db_pwd.equals(pwd)) {
				bCheck=true;
				sql="delete from board "
				   + "where no="+no;
				ps=conn.prepareStatement(sql);
				ps.executeUpdate();
			}else {
				bCheck=false;
			}
		} catch (Exception ex) {
			System.out.println("====== boardDelete 오류 발생 =======");
			ex.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
		return bCheck;
	}
	//6.검색 => <select>
	public List<BoardVO> boardFindData(String fd , String key){
		List<BoardVO> list= new ArrayList<BoardVO>();
		try {
			// 오라클 연결
			conn = dbConn.getConnection();
			String sql = "select no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD') , hit "
					+ "	   from board "
					+ "	   where " + fd+" like '%'||?||'%' ";
							 //order by 보다는 index_asc(테이블명 pk) => index는 pk,uk는 자동 생성
			// 오라클로 sql문장 전송
			ps = conn.prepareStatement(sql);
			// 실행전에 ? 가있는 경우 값을 채운다
			ps.setString(1,key);
			// 실행을 요청하고 결과값을 받는다
			ResultSet rs = ps.executeQuery();
			while(rs.next()) { // rs.next()는 데이터 출력의 첫번째 위치에 cursor을 이동
				BoardVO vo = new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDb_day(rs.getString(4));
				vo.setHit(rs.getInt(5));
				
				list.add(vo);
			}
			rs.close();
		} catch (Exception ex) {
			System.out.println("========= boardFindData 오류발생 =========");
			ex.printStackTrace();
		}finally {
			// 닫기 Connection => 계속 오라클을 연결한다
			dbConn.disConnection(conn, ps);
		}
		return list;
	}
}