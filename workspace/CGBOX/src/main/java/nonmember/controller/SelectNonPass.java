package nonmember.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import nonmember.service.INonMemberService;
import nonmember.service.NonMemberServiceImpl;
import vo.NonMemberVO;


@WebServlet("/selectNonPass.do")
public class SelectNonPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String birth = request.getParameter("bdata");
		String mail = request.getParameter("bmail");
		NonMemberVO pvo = new NonMemberVO();
		pvo.setNonmember_birth(birth);
		pvo.setNonmember_mail(mail);
		System.out.println(birth);
		System.out.println(mail);
		INonMemberService service = NonMemberServiceImpl.getInstance();
		String pass = service.selectNonPass(pvo);
		
		Gson g = new Gson();
		String result = g.toJson(pass);
		PrintWriter out = response.getWriter();
		out.write(result);
		out.flush();
		
	}


}
