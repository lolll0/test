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

import org.apache.commons.beanutils.BeanUtils;

import cgbox.vo.MemberVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;



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
		
		 try {
	         BeanUtils.populate(vo, request.getParameterMap());
	      } catch (IllegalAccessException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } catch (InvocationTargetException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
		 
		 IMemberService service = MemberServiceImpl.getInstance();
		 
		 int num = service.selectMaxNo();
		 vo.setCustomer_no(num);
		 service.insertCustomerNo(num);
		 String res = service.insertMember(vo);
	
		 request.setAttribute("gogogo", res);

		 request.getRequestDispatcher("member/result.jsp").forward(request, response);
	}

}
