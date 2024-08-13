package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;

public class GoodsDAO {
private static SqlSessionFactory ssf;
	
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}

	public static int goodsListCount() {
		int count=0;
		SqlSession session=null;
		try {
			session = ssf.openSession();
			count=session.selectOne("goodsListCount");
		} catch (Exception ex) {
			System.out.println("goodsListCount 오류");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return count;
	}
	public static List<GoodsVO> goodsListData(Map map){
		List<GoodsVO> list = new ArrayList<GoodsVO>();
		SqlSession session=null;
		try {
			session = ssf.openSession();
			list=session.selectList("goodsListData",map);
		} catch (Exception ex) {
			System.out.println("goodsListData 오류");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}
	public static int goodsTotalPage() {
		int total=0;
		SqlSession session=null;
		try {
			session = ssf.openSession();
			total=session.selectOne("goodsTotalPage");
		} catch (Exception ex) {
			System.out.println("goodsTotalPage 오류");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return total;
	}
}
