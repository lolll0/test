package member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cgbox.vo.MemberVO;
import member.service.IMemberService;
import member.service.MemberServiceImpl;
/*import vo.MemberVO;*/


@WebServlet("/memberLogin.do")
public class MemberLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		Map<String, String> map = new HashMap<String, String>();

		map.put("id", request.getParameter("member_id"));
		map.put("pass", request.getParameter("member_pass"));
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		//로그인 된 멤버 정보
		MemberVO loginMember = service.loginMember(map);
		
		System.out.println("loginMember : " + loginMember.toString());
		
		//로그인 처리 확인용 샘플
		request.setAttribute("login", loginMember);
		request.getRequestDispatcher("ticketing/test.jsp").forward(request, response);
			

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
