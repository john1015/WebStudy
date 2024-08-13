package com.sist.dao;

import java.util.*;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.sist.vo.AllReplyVO;

public class AllReplyDAO {
    public static SqlSessionFactory ssf;
    static {
        try {
            ssf = CreateSqlSessionFactory.getSsf(); // ssf에 SqlSessionFactory를 할당
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static void allReplyInsert(AllReplyVO vo) {
        SqlSession session = null;
        try {
            session = ssf.openSession(true); // 자동 커밋 활성화 세션
            session.insert("allReplyInsert", vo);
        } catch (Exception ex) {
            System.out.println("allReplyInsert err");
            ex.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
    }

    public static List<AllReplyVO> allReplyListData(Map map) {
        List<AllReplyVO> list = new ArrayList<AllReplyVO>();
        SqlSession session = null;
        try {
            session = ssf.openSession();
            list = session.selectList("allReplyListData", map);
        } catch (Exception ex) {
            System.out.println("allReplyListData err"); // 수정된 오류 메시지
            ex.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return list;
    }
    
    public static void allReplyDelete(int rno) {
        SqlSession session = null;
        try {
            session = ssf.openSession(true); // 자동 커밋 활성화 세션
            session.insert("allReplyInsert", rno);
        } catch (Exception ex) {
            System.out.println("allReplyInsert err");
            ex.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
    }
    public static void allReplyUpdate(Map map) {
    	SqlSession session = null;
        try {
            session = ssf.openSession(true); // 자동 커밋 활성화 세션
            session.update("allReplyUpdate", map);
        } catch (Exception ex) {
            System.out.println("allReplyUpdate err");
            ex.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
    }
    
    
    
}
