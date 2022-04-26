package cgbox.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import cgbox.service.IManagerMemberService;
import cgbox.service.ManagerMemberServiceImpl;
import cgbox.vo.CustomerVO;
import cgbox.vo.MemberVO;

/**
 * Servlet implementation class MemberInsert
 */
@WebServlet("/MemberInsert.do")
public class MemberInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int cno = Integer.parseInt(request.getParameter("no"));
		int point = Integer.parseInt(request.getParameter("point"));
		String name = request.getParameter("name");
		String grade = request.getParameter("grade");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String tel = request.getParameter("tel");
		String birth = request.getParameter("birth");
		String mail = request.getParameter("mail");
		
		MemberVO vo = new MemberVO();
		
		vo.setCustomer_no(cno);
		vo.setMember_name(name);
		vo.setGrade_no(grade);
		vo.setMember_birth(birth);
		vo.setMember_id(id);
		vo.setMember_mail(mail);
		vo.setMember_pass(pass);
		vo.setMember_point(point);
		vo.setMember_tel(tel);
		
		IManagerMemberService service = ManagerMemberServiceImpl.getInstance();
		
		int res = service.insertMember(vo);
		request.setAttribute("res", res);
		request.getRequestDispatcher("result.jsp").forward(request, response);
				
	}

}
