package kr.or.ddit.basic.session;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/sessionReadTest.do")
public class SessionReadTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html><head><meta charset='utf-8'>");
		out.println("<title>Session 데이터 읽기</title></head>");
		out.println("<body>");
		out.println("<h2>저장된 Session 데이터 확인하기</h2><hr>");
		
	/*
	Session 데이터 읽어오기
	
	1. Session객체 생성 및 현재 세션 가져오기
		
	 */
		HttpSession session = request.getSession();
		
	/*
	2. Session데이터 가져오기 ==> getAttribute()메서드 이용한다.
		형식) session객체.getAttribute("key값");
	 */
		
		// session값을 개별적으로 구하는 방법
		String sessionValue = 
				(String)session.getAttribute("testSession");
		if(sessionValue == null) {
			out.println("<h3>testSession의 세션값은 없습니다.</h3>");
		}else {
			out.println("<h3>testSession의 세션값 : " + 
					sessionValue + "</h3>");
		}
		out.println("<br><hr><br>");
		
		// 전체 Session데이터 가져오기
		
		out.println("<ol>");
		
		// Session의 전체 key값들을 구한다. 
		Enumeration<String> sessionNames = 
					session.getAttributeNames();
		int cnt = 0; // 세션의 개수 확인용
		while(sessionNames.hasMoreElements()) {
			cnt++;
			
			// 각각 세션의 key값 구하기
			String sessionKey = sessionNames.nextElement();
			
			Object value = session.getAttribute(sessionKey);
			
			out.println("<li>" + sessionKey + " : " 
					+ value + "</li>");
		}
		// 세션이 존재하지 않는다.
		if(cnt == 0) {
			out.println("<li>세션 데이터가 하나도 없습니다.</li>");
		}
		out.println("</ol>");
		
		out.println("<br><hr><br>");
		out.println("<h3>Session의 기타 정보 보기</h3>");
		
		// 세션ID ==> 세션을 구분하기 위한 고유한 값
		out.println("세션ID : " + session.getId() + "<br>");
		
		// 생성시간 ==> 1970년 1월 1일 부터 경과한 시간(밀리세컨드 단위)
		out.println("세션 생성 시간 : " + 
				session.getCreationTime() + "<br>");
		
		// 최근접근시간 ==> 1970년 1월 1일 부터 경과한 시간(밀리세컨드 단위)
		out.println("최근 접근 시간 : " + 
				session.getLastAccessedTime() + "<br>");
		
		// 세션의 유효시간 ==> 세션이 유지될 시간(초단위) ==> 기본값 1800
		// 유효시간 설정 ==> session객체.setMaxInactiveInterval(시간)
		// 유효시간 확인 ==> session객체.getMaxInactiveInterval();
		out.println("유효시간 : " + 
				session.getMaxInactiveInterval() + "<br>");
		
		
		
		out.println("<br><hr><br>");
		out.println("<a href='" + 
				request.getContextPath() + 
				"/basic/03/sessionTest.jsp'>시작문서로 이동하기</a>");
		
		out.println("</body></html>");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
