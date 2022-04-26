package mtheater.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mtheater.service.IMTheaterService;
import mtheater.service.MTheaterServiceImpl;
import vo.MTheaterVO;

@WebServlet("/MtheaterAddress.do")
public class MtheaterAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IMTheaterService service = MTheaterServiceImpl.getInstance();
		String name = request.getParameter("name");
		
		MTheaterVO vo = service.selectAllByName(name);
		
		Gson g = new Gson();
		
		response.setCharacterEncoding("utf-8");
		String result = g.toJson(vo);
		PrintWriter out = response.getWriter();
		out.write(result);
		out.flush();
	}

}
