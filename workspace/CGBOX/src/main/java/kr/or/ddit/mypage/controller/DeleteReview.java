package kr.or.ddit.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.mypage.service.IMyPageService;
import kr.or.ddit.mypage.service.MyPageServiceImpl;


@WebServlet("/DeleteReview.do")
public class DeleteReview extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String customer_no  = request.getParameter("cno");
		String movie_no  = request.getParameter("mno");
		IMyPageService service = MyPageServiceImpl.getInstance();
		
		Map<String, String> map = new HashMap<String,String>();
		map.put("movie_no", movie_no);
		map.put("customer_no", customer_no);
		
		int num = service.deleteReview(map);
		Gson gson = new Gson();
		
		String result = gson.toJson(num);
		
		response.setContentType("application/json; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
	}

}
