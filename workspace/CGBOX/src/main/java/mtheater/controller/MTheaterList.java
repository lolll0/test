package mtheater.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mtheater.service.IMTheaterService;
import mtheater.service.MTheaterServiceImpl;
import vo.MTheaterVO;

@WebServlet("/MTheaterList.do")
public class MTheaterList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IMTheaterService service = MTheaterServiceImpl.getInstance();
		
		List<MTheaterVO> list = service.selectAll();
		
		Gson gson = new Gson();
		
		response.setCharacterEncoding("utf-8");
		String result = gson.toJson(list);
		PrintWriter out = response.getWriter();
		out.write(result);
		out.flush();
	}

}
