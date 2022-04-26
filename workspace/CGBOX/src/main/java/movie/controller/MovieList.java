package movie.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import movie.service.IMovieService;
import movie.service.MovieServiceImpl;
/*import vo.MovieVO;*/
import movie.vo.MovieVO;

@WebServlet("/MovieList.do")
public class MovieList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.setAttribute("application/json; charset=utf-8", response);
		response.setCharacterEncoding("utf-8");
		response.setContentType("utf-8");
		
		IMovieService service = MovieServiceImpl.getInstance();
		
		List<MovieVO> list = service.selectAll();
		
		Gson g = new Gson();
		String result = g.toJson(list);
		
		PrintWriter out = response.getWriter();
		out.write(result);
		out.flush();
		
	}

}
