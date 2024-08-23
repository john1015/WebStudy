package com.sist.dao;

import com.sist.vo.*;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class AllJjimDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	public static void allJjimInsert(Map map) {
		SqlSession session = null;
		
		try {
			session=ssf.openSession(true);
			session.insert("allJjimInsert",map);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}
	
	public static int allJjimCheck(Map map) {
		int count = 0;
		SqlSession session = null;
		
		try {
			session=ssf.openSession(true);
			count=session.selectOne("allJjimCheck",map);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return count;
	}
	public static void JjimCountIncrement(Map map) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.update("JjimCountIncrement",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	
	public static void campGoodjimCountIncrement(Map map) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.update("campGoodsJjimCountIncrement",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	
	
	/*
	 * <!--  맛집 찜목록 -->
		<select id="fhjjimListData" resultType="FoodVO" parameterType="int">
			SELECT fh.fno , poster , name
			FROM food_house fh , all_jjim aj
			WHERE fh.fno=#{cno} AND aj.cno=#{cno} AND  fh.fno=aj.cno AND aj.type LIKE 1
		</select>
		<!--  캠핑용품 찜목록 -->
		<select id="cgjjimListData" resultType="CampGoodsVO" parameterType="int">
			select ca.cno,poster,name 
			from CAMP_GOODS_ALL ca , ALL_JJIM aj 
			where ca.cno=#{cno} AND aj.cno=#{cno} AND ca.cno = aj.cno and type like 2
		</select>
		<!--  레시피 찜목록 -->
		<select id="recjjimListData" resultType="RecipeVO" parameterType="int">
			select no,poster,title
			from recipe p , all_jjim aj
			where p.no=#{cno} AND aj.cno=#{cno} AND p.no=aj.cno and aj.type like 3
		</select>
	 */
	public static List<CampGoodsVO> cgjjimListData(String id){
		List<CampGoodsVO> cglist = new ArrayList<CampGoodsVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			cglist = session.selectList("cgjjimListData",id);
		}catch(Exception ex) {
			System.out.println("cgjjimListData err");
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return cglist;
	}
	public static List<RecipeVO> recjjimListData(String id){
		List<RecipeVO> reclist = new ArrayList<RecipeVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			reclist = session.selectList("recjjimListData",id);
		}catch(Exception ex) {
			System.out.println("recjjimListData err");
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return reclist;
	}
	public static List<FoodVO> fhjjimListData(String id){
		List<FoodVO> fhlist = new ArrayList<FoodVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			fhlist = session.selectList("fhjjimListData",id);
		}catch(Exception ex) {
			System.out.println("fhjjimListData err");
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return fhlist;
	}
	
	/*
	 * <delete id="jjim_delete" parameterType="AllJjimVO">
			delete from all_jjim 
			where id=#{id} and cno=#{cno};
		</delete>
		<update id="camp_jjimcount_minus" parameterType="int">
			UPDATE camp_goods_all
			SET jjimcount=jjimcount-1
			WHERE camp_goods_all.cno=#{cno};
		</update>
	 */
	public static void camp_jjim_delete(Map map) {
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.delete("jjim_delete",map);
			session.update("camp_jjimcount_minus",map);
			session.commit();
		}catch(Exception ex) {
			System.out.println("jjim_delete err");
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}

	
}
