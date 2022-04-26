package kr.or.ddit.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.mypage.service.IMyPageService;
import kr.or.ddit.mypage.service.MyPageServiceImpl;


@WebServlet("/ReviewList.do")
public class ReviewList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String customer_no  = request.getParameter("customer_no");
		
		IMyPageService service = MyPageServiceImpl.getInstance();
		
		List<Map<String, Object>> list = service.reviewList(customer_no);
		
		
		for(int i=0; i < list.size();i++) {
			Map<String, Object> map = list.get(i);
			int num = Integer.valueOf(String.valueOf(map.get("REVIEW_GRADE")));
			String str = "";
			for(int j=0; j<num; j++) {
				str += "★";
			}
			list.get(i).put("REVIEW_GRADE", str);
		}
		
		Gson gson = new Gson();
		
		String result = gson.toJson(list);
				
		response.setContentType("application/json; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
	}

}
