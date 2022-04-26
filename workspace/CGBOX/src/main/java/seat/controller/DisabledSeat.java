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

import cgbox.vo.ReserveVO;
import reserve.service.IReserveService;
import reserve.service.ReserveServiceImpl;

@WebServlet("/disabledSeat.do")
public class DisabledSeat extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int scno = Integer.parseInt(request.getParameter("scdata"));
		
		System.out.println(scno);
		
		IReserveService service = ReserveServiceImpl.getInstance();
		
		List<ReserveVO> list = service.selectAllByscno(scno);
		
		Gson g = new Gson();
		String result = g.toJson(list);
		PrintWriter out = response.getWriter();
		out.write(result);
		out.flush();
	}

}
