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
import cgbox.vo.QnAVO;

/**
 * Servlet implementation class QnAList
 */
@WebServlet("/QnAList.do")
public class QnAList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		IQnAService service = QnAServiceImpl.getInstance();
		
		List<QnAVO> list = service.QnAList();
		
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
