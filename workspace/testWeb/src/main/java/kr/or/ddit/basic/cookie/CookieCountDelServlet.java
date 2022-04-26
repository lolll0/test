package kr.or.ddit.basic.cookie;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/cookieCountDelServlet.do")
public class CookieCountDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Cookie[] cookieArr = request.getCookies();
		
		out.println("<html>");
		out.println("<head><meta charset='utf-8'>");
		out.println("<title>Count 초기화</title></head>");
		out.println("<body>");
		
		out.println("<h3>count가 초기화되었습니다.</h3>");
		out.println("<hr>");
		
		if(cookieArr == null || cookieArr.length==0) {
			out.println("<h3>Count가 없습니다.</h3>");
		}else {
			// 쿠키 배열에서 삭제하려는 쿠키 정보를 구해온다.
			for(Cookie cookie : cookieArr) {
				// '쿠키변수'를 구한다.
				String cookieName = cookie.getName();
				
				// 해당 쿠키변수가 삭제하려는 쿠키변수인지 확인한다.
				// cookieName이 count인 것을 찾는다.
				if("count".equals(cookieName)) {
					// 해당 쿠키를 찾았으면 유지시간을 0으로 설정한 후
					// 다시 저장한다.
					
					cookie.setMaxAge(0);
					response.addCookie(cookie);
					out.println("<h3>count를 초기화하였습니다.<h3>");
				}
			}
		}
		out.println("<a href='" + 
				request.getContextPath() + 
				"/basic/02/cookieTest02.jsp'>시작문서로 가기</a>");
		out.println("<hr>");
		out.println("</html></body>");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
