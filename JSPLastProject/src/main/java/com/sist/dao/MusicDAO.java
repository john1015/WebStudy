package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.dao.*;
import com.sist.vo.MusicVO;

public class MusicDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	public static List<MusicVO> musicListData(){
		List<MusicVO> list = new ArrayList<MusicVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession(); // Connection주소 얻기
			// MtBatis => DBCP (maxActive=8,maxIdle=8)
			list=session.selectList("musicListData");
		} catch (Exception ex) {
			System.out.println("musicListData err");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close(); // POOL 반환 => 재사용
		}
		return list;
	}
	public static List<MusicVO> musicFindData(Map map){
		List<MusicVO> list = new ArrayList<MusicVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession(); // Connection주소 얻기
			// MyBatis => DBCP (maxActive=8,maxIdle=8)
			list=session.selectList("musicFindData",map);
		} catch (Exception ex) {
			System.out.println("musicFindData err");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close(); // POOL 반환 => 재사용
		}
		return list;
	}
	public static String musicDetailData(int mno) {
		String key="";
		SqlSession session = null;
		try {
			session = ssf.openSession(); 
			key=session.selectOne("musicFindData",mno);
		} catch (Exception ex) {
			System.out.println("musicDetailData err");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close(); 
		}
		return key;
	}
}