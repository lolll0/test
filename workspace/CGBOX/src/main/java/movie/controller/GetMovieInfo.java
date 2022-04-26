package movie.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import movie.service.IMovieService;
import movie.service.MovieServiceImpl;
import movie.vo.MovieVO;


@WebServlet("/getMovieInfo.do")
public class GetMovieInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String movieId = request.getParameter("mvid");
		
		IMovieService service = MovieServiceImpl.getInstance();
		
		MovieVO mvo = service.selectAllMovieByNo(movieId);
		
		Gson g = new Gson();
		String result = g.toJson(mvo);
		PrintWriter out = response.getWriter();
		out.write(result);
		out.flush();
		
	}

}
