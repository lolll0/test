package cgbox.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cgbox.service.INoticeService;
import cgbox.service.NoticeServiceImpl;
import cgbox.vo.NoticeVO;

/**
 * Servlet implementation class NoticeInsert
 */
@WebServlet("/NoticeInsert.do")
public class NoticeInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Date date = Date.valueOf(request.getParameter("date")); 
		
		NoticeVO vo = new NoticeVO();
		
		vo.setNotice_content(content);
		vo.setNotice_date(date);
		vo.setNotice_title(title);
		
		INoticeService service = NoticeServiceImpl.getInstance();
		int res = service.insertNotice(vo);
		request.setAttribute("res", res);
		request.getRequestDispatcher("result.jsp").forward(request, response);
	}

}
