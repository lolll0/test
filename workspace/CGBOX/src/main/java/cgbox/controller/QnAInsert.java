package cgbox.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cgbox.service.IQnAService;
import cgbox.service.QnAServiceImpl;
import cgbox.vo.QnAVO;

/**
 * Servlet implementation class QnAInsert
 */
@WebServlet("/QnAInsert.do")
public class QnAInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		int customer_no = Integer.parseInt(request.getParameter("customer_no"));
		String question = request.getParameter("question");
		
		System.out.println(customer_no);
		System.out.println(question);
		
		
		QnAVO vo = new QnAVO();
		
		vo.setCustomer_no(customer_no);
		vo.setQna_question(question);
		
		IQnAService service = QnAServiceImpl.getInstance();
		int res = service.insertQnA(vo);
		System.out.println(res);
		
		request.setAttribute("res", res);
		request.getRequestDispatcher("result.jsp").forward(request, response);
		
	}

}
