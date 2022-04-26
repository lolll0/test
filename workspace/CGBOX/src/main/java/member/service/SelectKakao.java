package member.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import cgbox.vo.MemberVO;

@WebServlet("/selectKakao.do")
public class SelectKakao extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String kmail = request.getParameter("kmail");
		String kname = request.getParameter("kname");
		
		IMemberService service = MemberServiceImpl.getInstance();
		MemberVO vo = service.selectKakao(kmail);
		
		if(vo == null) {
			//초면인 카카오 멤버
			vo = insertKaKaoMem(kmail, kname);
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("loginmember", vo);
		
		Gson g = new Gson();
		String result = g.toJson("성공");
		PrintWriter out = response.getWriter();
		out.write(result);
		out.flush();
	}

	private MemberVO insertKaKaoMem(String kmail, String kname) {
		MemberVO vo = new MemberVO();
		kr.or.ddit.member.service.IMemberService service = kr.or.ddit.member.service.MemberServiceImpl.getInstance();
		
		//1. 고객번호 insert
		int cno = service.selectMaxNo();
		
		System.out.println(cno);
		
		
		service.insertCustomerNo(cno);	
		
		
		//2. 해당 고객번호, kamil을 아이디와 메일, 회원명을 kname으로 insert하며포인트는 0 등급번호는 1(브론즈)이다
		vo.setCustomer_no(cno);
		vo.setMember_id(kmail);
		vo.setMember_mail(kmail);
		vo.setMember_name(kname);
		vo.setMember_birth("(카카오 회원)");
		vo.setGrade_no("1");
		vo.setMember_pass("(카카오 회원)");
		vo.setMember_tel("010-0000-0000");
		vo.setMember_point(0);
		service.insertMember(vo);
		
		return vo;
	}

}
