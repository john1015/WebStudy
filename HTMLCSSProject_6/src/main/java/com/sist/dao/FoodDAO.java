package com.sist.dao;

import java.util.*;
import java.sql.*;
import com.sist.database.*;

public class FoodDAO {
    private Connection conn;
    private PreparedStatement ps;
    private static FoodDAO dao;
    private DataBaseConnection dbConn = new DataBaseConnection();
    
    public static FoodDAO newInstance() {
        if(dao == null)
            dao = new FoodDAO();
        return dao;
    }
    
    // 기능
    public List<FoodVO> foodListData(){
        List<FoodVO> list = new ArrayList<FoodVO>();
        try {
            conn = dbConn.getConnection();  // dbConn.getConnection()으로 conn을 초기화
            String sql = " select fno , name , poster , type , rownum "
                    + " from (select fno , name , poster , type "
                    + "        from food_house order by fno asc ) "
                    + " where rownum <= 50 ";
            ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                FoodVO vo = new FoodVO();
                vo.setFno(rs.getInt(1));
                vo.setName(rs.getString(2));
                vo.setPoster(rs.getString(3));
                vo.setType(rs.getString(4));
                
                list.add(vo);
            }
            rs.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            // 닫기
            dbConn.disConnection(conn, ps);  // dbConn.disConnection()에서 Connection과 PreparedStatement를 닫기
        }
        return list;
    }
}
