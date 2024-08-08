package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.BoardVO;

public class BoardDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	public static void boardInsert(BoardVO vo) {
		SqlSession session = null;
		try {
			// 연결 => Connection주소 얻기 => DBCP : 미리 Connection객체 여러개 생성
			// Connection => 오라클 연결 시간이 오래 걸린다 (연결에 소모되는 시간을 줄일수 있다)
			// Connection객체를 조절할 수 있다 
			// => openSession() => autoCommit(false)
			// => openSession(true) => autoCommit(true) => INSERT , UPDATE , DELETE
			session=ssf.openSession(true);
			session.insert("boardInsert",vo);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}
	public static List<BoardVO> boardListData(Map map){
		List<BoardVO> list = new ArrayList<BoardVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list = session.selectList("boardListData",map);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}
	// 총페이지
	public static int boardRowCount() {
		int count =0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			count = session.selectOne("boardRowCount");
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}

		return count;
	}
	
	public static BoardVO boardDetailData(int no) {
		BoardVO vo = new BoardVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.update("hitIncrement",no);
			session.commit();
			vo = session.selectOne("boardDetailData",no);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return vo;
	}
	public static BoardVO boardUpdateData(int no) {
		BoardVO vo = new BoardVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			vo = session.selectOne("boardDetailData",no);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return vo;
	}
	public static String boardUpdate(BoardVO vo) {
		String result="no";
		SqlSession session=null;
		try {
			session=ssf.openSession();
			String db_pwd = session.selectOne("boardGetPassword",vo.getNo());
			if(db_pwd.equals(vo.getPwd())) {
				result="yes";
				session.update("boardUpdate",vo);
				session.commit();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return result;
	}
	public static String boardDelete(int no , String pwd) {
		String result = "no";
		SqlSession session=null;
		try {
			session=ssf.openSession();
			String db_pwd = session.selectOne("boardGetPassword",no);
			if(db_pwd.equals(pwd)) {
				result="yes";
				session.delete("boardDelete",no);
				session.commit();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return result;
	}
}
