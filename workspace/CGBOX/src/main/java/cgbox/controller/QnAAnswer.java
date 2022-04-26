package cgbox.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cgbox.service.IQnAService;
import cgbox.service.QnAServiceImpl;
import cgbox.vo.QnAVO;

/**
 * Servlet implementation class QnAAnswer
 */
@WebServlet("/QnAAnswer.do")
public class QnAAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAAnswer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String no = request.getParameter("no");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		System.out.println(answer);
		QnAVO vo = new QnAVO();
		
		vo.setQna_no(no);
		vo.setQna_answer(answer);
		vo.setQna_question(question);
		
		IQnAService service = QnAServiceImpl.getInstance();
		int res = service.answerQnA(vo);
		System.out.println(res);
		request.setAttribute("res", res);
		request.getRequestDispatcher("result.jsp").forward(request, response);
	}

}
