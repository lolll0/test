package cgbox.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cgbox.service.FAQServiceImpl;
import cgbox.service.IFAQService;
import cgbox.vo.FAQVO;

/**
 * Servlet implementation class FAQInsert
 */
@WebServlet("/FAQInsert.do")
public class FAQInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		String category = request.getParameter("category"); 
		
		FAQVO vo = new FAQVO();
		
		vo.setFaq_answer(answer);
		vo.setFaq_category(category);
		vo.setFaq_question(question);
		
		IFAQService service = FAQServiceImpl.getInstance();
		int res = service.insertFAQ(vo);
		request.setAttribute("res", res);
		request.getRequestDispatcher("result.jsp").forward(request, response);
	}

}
