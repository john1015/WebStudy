package com.sist.model;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.vo.*;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;

public class RecipeModel {
	@RequestMapping("recipe/list.do")
	public String recipe_list(HttpServletRequest request , HttpServletResponse response) {
		// 사용자 요청값 받기
		String page = request.getParameter("page");
		if(page==null) page="1";
		int curpage = Integer.parseInt(page);
		int rowSize=20;
		int start = (rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;
		Map map = new HashMap();
		
		map.put("start", start);
		map.put("end", end);
		List<RecipeVO> rList =RecipeDAO.recipeListData(map);

		int totalPage = RecipeDAO.recipeTotalPage();
		
		final int BLOCK=10;
		int startPage = ((curpage-1)/BLOCK*BLOCK)+1;
		int endPage = ((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage>totalPage) endPage=totalPage;
		
		request.setAttribute("rList", rList);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		// DB연동 => 출력할 데이터 전송
		int count=RecipeDAO.recipeListCount();
		request.setAttribute("count", count);
		request.setAttribute("main_jsp", "../recipe/list.jsp");
		return "../main/main.jsp";
	}
}
