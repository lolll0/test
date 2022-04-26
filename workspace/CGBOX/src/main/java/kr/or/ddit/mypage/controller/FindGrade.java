package kr.or.ddit.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.mypage.service.IMyPageService;
import kr.or.ddit.mypage.service.MyPageServiceImpl;


@WebServlet("/FindGrade.do")
public class FindGrade extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String grade_no  = request.getParameter("grade_no");
		
		IMyPageService service = MyPageServiceImpl.getInstance();
		
		String findGrade_no = service.findGrade(grade_no);
		
		Gson gson = new Gson();
		
		String result = gson.toJson(findGrade_no);
		
		response.setContentType("application/json; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
	}

}
