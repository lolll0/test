package cgbox.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cgbox.service.FAQServiceImpl;
import cgbox.service.IFAQService;

/**
 * Servlet implementation class FAQDelete
 */
@WebServlet("/FAQDelete.do")
public class FAQDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		IFAQService service = FAQServiceImpl.getInstance();
		
		int res = service.deleteFAQ(no);
		request.setAttribute("res", res);
		request.getRequestDispatcher("result.jsp").forward(request, response);
	}

}
