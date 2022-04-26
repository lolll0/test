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

import cgbox.service.IQnAService;
import cgbox.service.QnAServiceImpl;
import cgbox.vo.MemberVO;

/**
 * Servlet implementation class QnAmember
 */
@WebServlet("/QnAmember.do")
public class QnAmember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAmember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int customer_no = Integer.parseInt(request.getParameter("customer_no"));
		IQnAService service = QnAServiceImpl.getInstance();
		System.out.println(customer_no);
		List<MemberVO> list = service.memberInfo(customer_no);
		
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
