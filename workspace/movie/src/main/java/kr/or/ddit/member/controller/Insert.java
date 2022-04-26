package kr.or.ddit.member.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;



/**
 * Servlet implementation class Insert
 */
@WebServlet("/Insert.do")
public class Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Insert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.setAttribute("application/json; charset=utf-8", response);
		
		MemberVO vo = new MemberVO();
		
//		 try {
//	         BeanUtils.populate(vo, request.getParameterMap());
//	      } catch (IllegalAccessException e) {
//	         // TODO Auto-generated catch block
//	         e.printStackTrace();
//	      } catch (InvocationTargetException e) {
//	         // TODO Auto-generated catch block
//	         e.printStackTrace();
//	      }
		 
		 String id = request.getParameter("member_id");
		 System.out.println(id);
		 String pass = request.getParameter("member_pass");
		 System.out.println(pass);
		 String name = request.getParameter("member_name");
		 System.out.println(name);
		 Object date = request.getParameter("member_date");
		 System.out.println(date);
		 Object mail = request.getParameter("member_mail");
		 System.out.println(mail);
		 String tel = request.getParameter("member_tel");
		 System.out.println(tel);
		 
		 IMemberService service = MemberServiceImpl.getInstance();
		 int num = service.selectMaxNo();
		
		 
			 vo.setMember_id(id);
			 vo.setMember_pass(pass);
			 vo.setMember_birth((String) date);
			 vo.setMember_mail(name);
			 vo.setMember_mail((String)mail);
			 vo.setMember_tel(tel);
			 vo.setMember_point(0);
			 vo.setGrade_no("1");
			 
			 vo.setCustomer_no(num);
			 service.insertCustomerNo(num);
			 String res = service.insertMember(vo);
			 
			 request.setAttribute("gogogo", res);
		 
		 
		 
		 
		 
//		 vo.setCustomer_no(num);
//		 service.insertCustomerNo(num);
//		 String res = service.insertMember(vo);
	
//		 request.setAttribute("gogogo", res);

		 request.getRequestDispatcher("member/result.jsp").forward(request, response);
	}

}
