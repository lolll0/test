package cgbox.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cgbox.service.INoticeService;
import cgbox.service.NoticeServiceImpl;

/**
 * Servlet implementation class NoticeDelete
 */
@WebServlet("/NoticeDelete.do")
public class NoticeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no = Integer.parseInt(request.getParameter("no"));
		INoticeService service = NoticeServiceImpl.getInstance();
		
		int res = service.deleteNotice(no);
		request.setAttribute("res", res);
		request.getRequestDispatcher("result.jsp").forward(request, response);
	}

}
