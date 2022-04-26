package reserve.controller;




import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import com.google.gson.Gson;


@WebServlet("/sendMail.do")
public class SendMail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//받을 이메일주소
		String inputedEmail = request.getParameter("mail");
		
		//인증코드 생성
		String AuthenticationKey = authCodeMaker();
		
		//제목
		String subject = "CGBOX 인증 메일입니다"; 
		
		//내용
		String content = "인증번호 : " + AuthenticationKey;
		
 		try {
 			System.out.println("메일 보내기 시작...");
 			Email email = new SimpleEmail();
 			email.setHostName("smtp.naver.com");// SMTP의 서버 지정
 			email.setSmtpPort(465); // SMTP의 포트주소 지정
 			email.setAuthenticator(new DefaultAuthenticator("gusdml9489@naver.com", "ye1386120!"));
 			email.setSSLOnConnect(true); // SSL 보안인증 활성화
 			email.setFrom("gusdml9489@naver.com"); // 보내는 사람 메일
 			email.setSubject(subject); // 메일 제목
 			email.setMsg(content); // 메일 내용
 			email.addTo(inputedEmail); // 받는 사람 주소
 			email.send(); // 보내기

 			System.out.println("메일 보내기 완료!!!");
		} catch (EmailException e) {
			e.printStackTrace();
		}
 		
 		Gson g = new Gson();
		String result = g.toJson(AuthenticationKey);
		PrintWriter out = response.getWriter();
		out.write(result);
		out.flush();
	}

	// 인증 번호 생성기
	public String authCodeMaker() {
		String authCode = null;
			
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
			
		authCode = temp.toString();
		System.out.println(authCode);
		
		return authCode;
	}
	
}

