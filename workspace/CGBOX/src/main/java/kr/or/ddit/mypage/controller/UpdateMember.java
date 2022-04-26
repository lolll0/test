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

import cgbox.vo.MemberVO;
import kr.or.ddit.mypage.service.IMyPageService;
import kr.or.ddit.mypage.service.MyPageServiceImpl;


@WebServlet("/UpdateMember.do")
public class UpdateMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int cusNo  = Integer.parseInt(request.getParameter("cusNo"));
		String name  = request.getParameter("name");
		String pass  = request.getParameter("pass");
		String birth  = request.getParameter("birth");
		String tel  = request.getParameter("tel");
		String mail  = request.getParameter("mail");
		 
		
		
		IMyPageService service = MyPageServiceImpl.getInstance();
		
		MemberVO vo = new MemberVO();
		vo.setCustomer_no(cusNo);
		vo.setMember_birth(birth);
		vo.setMember_mail(mail);
		vo.setMember_name(name);
		vo.setMember_tel(tel);
		vo.setMember_pass(pass);
		
		int cnt = service.updateMember(vo);
		
		Gson gson = new Gson();
		
		String result = gson.toJson(cnt);
		
		response.setContentType("application/json; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
	}

}
