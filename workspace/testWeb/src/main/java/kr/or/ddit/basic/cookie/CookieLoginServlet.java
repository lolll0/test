package kr.or.ddit.basic.cookie;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/cookieLoginServlet.do")
public class CookieLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 값 삭제도 같이 진행
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// form에서 전달된 데이터 id, pass, chkid값 받아오기
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String box = request.getParameter("chkid");
		
		// id가 저장된 쿠키 객체 생성
		Cookie idcookie = new Cookie("id", id);
		
//		System.out.println("체크여부 : " + box);
		// 체크박스의 체크여부에 따라 쿠키 저장한다.
		if(box != null) { // 체크 박스가 체크되었을 때
			response.addCookie(idcookie); // 쿠키 저장
		}else { // 체크 박스가 체크되지 않았을 때
			idcookie.setMaxAge(0);
			response.addCookie(idcookie); // 쿠키를 삭제한다.
		}
		
		// 로그인 성공 여부 확인
		// id와 pass의 null 체크 ==> 반드시 해주는 것이 좋다.
		if(id!=null && pass!=null) {
			// 로그인 성공
			if("test".equals(id) && "1234".equals(pass)) {
				response.sendRedirect(
						request.getContextPath() + 
						"/basic/02/cookieMain.jsp");
			}else { // 로그인 실패
				response.sendRedirect(
						request.getContextPath() + 
						"/basic/02/cookieLogin.jsp");
			}
		}else {
			response.sendRedirect(
					request.getContextPath() + 
					"/basic/02/cookieLogin.jsp");
		}
		
		
		
//		if(idcookie.getValue().equals("test") 
//				&& passcookie.getValue().equals("1234")) {
//			RequestDispatcher rd = request.getRequestDispatcher("basic/02/cookieLogin.jsp");
//			rd.forward(request, response);
//		}else {
//			RequestDispatcher rd = request.getRequestDispatcher("basic/02/cookieMain.jsp");
//			rd.forward(request, response);
//		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
