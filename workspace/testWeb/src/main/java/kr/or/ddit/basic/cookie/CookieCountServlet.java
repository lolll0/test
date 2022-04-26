package kr.or.ddit.basic.cookie;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/cookieCountServlet.do")
public class CookieCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int count = 0; // 현재 count값이 저장될 변수
		
		// 쿠키에 저장된 count값을 가져온다.
		Cookie[] cookieArr = request.getCookies();
		
		if(cookieArr != null) {
			for(Cookie cookie : cookieArr) {
				String cookieName = cookie.getName();
				if("count".equals(cookieName)) {
					// 쿠키에 저장된 현재 count값 찾기
					count = Integer.parseInt(cookie.getValue());
				}
			}
		}
		count++;	// 현재 count값을 증가한다.
		
		// 증가된 count값을 쿠키에 저장한다.
		Cookie countCookie = 
				new Cookie("count", String.valueOf(count));
		response.addCookie(countCookie);
		
		out.println("<html>");
		out.println("<head><meta charset='utf-8'>");
		out.println("<title>쿠키값 증가</title></head>");
		out.println("<body>");
		
		
		out.println("<h3>어서오세요 당신은" + count + "번째 방문입니다.</h3>");
		
		out.println("<a href='" + 
				request.getContextPath() + 
				"/cookieCountServlet.do'>카운트 증가하기</a>");
		
		out.println("<a href='" + 
				request.getContextPath() + 
				"/basic/02/cookieTest02.jsp'>시작문서로 가기</a>");
		
		out.println("</html></body>");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
