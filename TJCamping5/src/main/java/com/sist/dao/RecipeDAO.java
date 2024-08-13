package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;

public class RecipeDAO {
	private static SqlSessionFactory ssf;
	
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	// hit가 많은 맛집
	
	public static int recipeListCount() {
		int count=0;
		SqlSession session=null;
		try {
			session = ssf.openSession();
			count=session.selectOne("recipeListCount");
		} catch (Exception ex) {
			System.out.println("recipeListCount 오류");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return count;
	}
	
	public static List<RecipeVO> recipeListData(Map map){
		List<RecipeVO> list = new ArrayList<RecipeVO>();
		SqlSession session=null;
		try {
			session = ssf.openSession();
			list=session.selectList("recipeListData",map);
		} catch (Exception ex) {
			System.out.println("recipeListData 오류");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}
	
	public static int recipeTotalPage() {
		int total=0;
		SqlSession session=null;
		try {
			session = ssf.openSession();
			total=session.selectOne("recipeTotalPage");
		} catch (Exception ex) {
			System.out.println("recipeTotalPage 오류");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return total;
	}
	
	
}
