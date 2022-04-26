package movie.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import movie.vo.MovieVO;

/**
 * Servlet implementation class MovieDetail
 */
@WebServlet("/MovieDetail.do")
public class MovieDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8");
		
		
		String movieName = request.getParameter("movieName");
		String movieOpen = request.getParameter("movieOpen");
		String movieSummary = request.getParameter("movieSummary");
		String movieLink = request.getParameter("movieLink");
		String movieImg = request.getParameter("movieImg");
		String movieRunning = request.getParameter("movieRunning");
		
		System.out.println("test1 : " + movieName);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		
		HttpSession session = request.getSession();
		session.setAttribute("movieName", movieName);
		session.setAttribute("movieOpen", movieOpen);
		session.setAttribute("movieSummary", movieSummary);
		session.setAttribute("movieLink", movieLink);
		session.setAttribute("movieImg", movieImg);
		session.setAttribute("movieRunning", movieRunning);
		
		RequestDispatcher rq = request.getRequestDispatcher("detail/NewFile.jsp");
		rq.forward(request, response);
		
		
	}

}
