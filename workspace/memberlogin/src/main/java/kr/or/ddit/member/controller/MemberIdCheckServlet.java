package kr.or.ddit.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;



@WebServlet("/member/memberIdCheck.ddit")
public class MemberIdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		String memId = request.getParameter("member_id");
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		MemberVO vo = new MemberVO();
		int num = service.selectMaxNo() + 1;
		
		vo.setCustomer_no(num);
		vo.setMember_birth(request.getParameter("mem_bir"));
		vo.setMember_id(request.getParameter("mem_id"));
		vo.setMember_mail(request.getParameter("mem_mail"));
		vo.setMember_name(request.getParameter("mem_name"));
		vo.setMember_pass(request.getParameter("mem_pass"));
		vo.setMember_tel(request.getParameter("mem_tel"));
		
		
		
//		Gson gson = new Gson();
//		
//		String result = null;
//		if(vo.getMember_id()==null) {  // 없는 ID -> 즉, 사용가능한 ID
//			result = gson.toJson("OK");
//		}else {
//			result = gson.toJson("Fail");
//		}
//		
//		PrintWriter out = response.getWriter();
//		out.println(result);
//		//out.flush();
//		response.flushBuffer();
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
