package cgbox.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import cgbox.service.EventServiceImpl;
import cgbox.service.IEventService;
import cgbox.vo.EventVO;

/**
 * Servlet implementation class EventInsert
 */
@WebServlet("/EventInsert.do")
public class EventInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
//		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String src = request.getParameter("src");
		String detail = request.getParameter("detail");
		Date start = Date.valueOf(request.getParameter("start"));
		Date end = Date.valueOf(request.getParameter("end"));
		
		EventVO vo = new EventVO();
		
//		vo.setEvent_no(no);
		vo.setEvent_title(title);
		vo.setEvent_end(end);
		vo.setEvent_start(start);
		vo.setEvent_src(src);
		vo.setEvent_detail(detail);
		
//		try {
//			BeanUtils.populate(vo, request.getParameterMap());
//		} catch (IllegalAccessException | InvocationTargetException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		IEventService service = EventServiceImpl.getInstance();
		
		int res = service.insertEvent(vo);
//		System.out.println(res);
		request.setAttribute("res", res);
		request.getRequestDispatcher("result.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
