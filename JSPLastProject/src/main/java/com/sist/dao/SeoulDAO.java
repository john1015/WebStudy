package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;

public class SeoulDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	public static List<SeoulLocationVO> seoulLocationListData(Map map){
		List<SeoulLocationVO> list = new ArrayList<SeoulLocationVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("seoulLocationListData",map);
		} catch (Exception ex) {
			System.out.println("seoulLocationListData err");
			ex.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return list;
	}
	public static int seoulLocationTotalPage() {
		int total=0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("seoulLocationTotalPage");
		} catch (Exception ex) {
			System.out.println("seoulLocationTotalPage err");
			ex.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return total;
	}
	public static List<SeoulNatureVO> seoulNatureListData(Map map){
		List<SeoulNatureVO> list = new ArrayList<SeoulNatureVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("seoulNatureListData",map);
		} catch (Exception ex) {
			System.out.println("seoulNatureListData err");
			ex.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return list;
	}
	public static int seoulNatureTotalPage() {
		int total=0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("seoulNatureTotalPage");
		} catch (Exception ex) {
			System.out.println("seoulNatureTotalPage err");
			ex.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return total;
	}
	public static List<SeoulShopVO> seoulShopListData(Map map){
		List<SeoulShopVO> list = new ArrayList<SeoulShopVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("seoulShopListData",map);
		} catch (Exception ex) {
			System.out.println("seoulShopListData err");
			ex.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return list;
	}
	public static int seoulShopTotalPage() {
		int total=0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("seoulShopTotalPage");
		} catch (Exception ex) {
			System.out.println("seoulShopTotalPage err");
			ex.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return total;
	}
}
