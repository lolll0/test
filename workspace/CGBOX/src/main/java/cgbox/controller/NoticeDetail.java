package cgbox.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import cgbox.service.INoticeService;
import cgbox.service.NoticeServiceImpl;
import cgbox.vo.NoticeVO;

/**
 * Servlet implementation class NoticeDetail
 */
@WebServlet("/NoticeDetail.do")
public class NoticeDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		INoticeService service = NoticeServiceImpl.getInstance();
		
		List<NoticeVO> list = service.noticeDetail(no);
		
//		for(NoticeVO vo : list) {
//			System.out.println(vo.getNotice_title());
//			System.out.println(vo.getNotice_content());
//		}
		
		JsonObject obj = new JsonObject();
		
		Gson gson = new Gson();
		
		JsonElement ele = gson.toJsonTree(list);
		
		obj.add("datas", ele);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(obj);
		out.flush();
	}

}
