package seat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import cgbox.vo.SeatVO;
import seat.service.ISeatService;
import seat.service.SeatServiceImpl;

@WebServlet("/insertSeatNo.do")
public class InsertSeatNo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int tno = Integer.parseInt(request.getParameter("tdata"));
		
		ISeatService service = SeatServiceImpl.getInstance();
		List<SeatVO> slist = service.selectAllBytno(tno);
		
		Gson g = new Gson();
		String result = g.toJson(slist);
		
		PrintWriter out = response.getWriter();
		out.write(result);
		out.flush();
		
	
	}

}
