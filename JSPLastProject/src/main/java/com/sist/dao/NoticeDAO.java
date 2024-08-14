package com.sist.dao;

import java.util.*;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.sist.vo.*;

public class NoticeDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	// 목록 
	public static List<NoticeVO> noticeListData(Map map){
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		// Connection => SqlSession
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("noticeListData",map);
		} catch (Exception ex) {
			System.out.println("noticeListData err");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close(); // DBCP => 반환 (재사용)
		}
		return list;
	}
	
	// 공지 추가
	public static void noticeInsert(NoticeVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.insert("noticeInsert",vo);
		} catch (Exception ex) {
			System.out.println("noticeInsert err");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close(); // DBCP => 반환 (재사용)
		}
	}
	
	public static int noticeRowCount() {
		int count=0;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			count=session.selectOne("noticeRowCount");
		} catch (Exception ex) {
			System.out.println("noticeRowCount err");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close(); // DBCP => 반환 (재사용)
		}
		return count;
	}
}
