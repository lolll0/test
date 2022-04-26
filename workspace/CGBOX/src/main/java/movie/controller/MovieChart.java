package movie.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MovieChart
 */
@WebServlet("/MovieChart.do")
public class MovieChart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieChart() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String[] movieName = request.getParameterValues("movieName");
		String[] movieOpen = request.getParameterValues("movieOpen");
		String[] movieSummary = request.getParameterValues("movieSummary");
		String[] movieLink = request.getParameterValues("movieLink");
		String[] movieImg = request.getParameterValues("movieImg");
		String[] movieRunning = request.getParameterValues("movieRunning");
		
//		System.out.println(movieName[1]);
		System.out.println(movieImg[1]);
		
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		
		HttpSession session = request.getSession();
		session.setAttribute("movieName", movieName);
		session.setAttribute("movieOpen", movieOpen);
		session.setAttribute("movieSummary", movieSummary);
		session.setAttribute("movieLink", movieLink);
		session.setAttribute("movieImg", movieImg);
		session.setAttribute("movieRunning", movieRunning);
		
		RequestDispatcher rq = request.getRequestDispatcher("movie/movieChart.jsp");
		rq.forward(request, response);
		
		
		
	}

}
