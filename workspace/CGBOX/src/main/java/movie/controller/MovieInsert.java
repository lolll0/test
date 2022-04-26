package movie.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import movie.service.IMovieService;
import movie.service.MovieServiceImpl;
import movie.vo.MovieVO;

/**
 * Servlet implementation class MovieInsert
 */
@WebServlet("/MovieInsert.do")
public class MovieInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.setAttribute("application/json; charset=utf-8", response);
		
		MovieVO vo = new MovieVO();
		
		String[] movieNm = request.getParameterValues("movieName");
		String[] movieAu = request.getParameterValues("movieAudi");
		String[] movieNo = request.getParameterValues("movieNo");
		String[] movieOpen = request.getParameterValues("movieOpen");
		
		int[] intAu = new int[movieAu.length];
		for(int i = 0; i < movieAu.length; i++) {
			intAu[i] = Integer.parseInt(movieAu[i]);
		}
		
		
		IMovieService service = MovieServiceImpl.getInstance();
		List<String> name = service.selectMovieName();
		
		
//		System.out.println("asdfasdf : " + name);
		int no = 0;
		for(int j = 0; j < movieNm.length; j++) {
			
			if(!name.contains(movieNm[j])) {
					
					vo.setMovie_no(movieNo[j]);
	        		vo.setMovie_name(movieNm[j]);
	        		vo.setMovie_open(movieOpen[j]);
	        		vo.setMovie_summary("test");
	        		vo.setMovie_grade(0);
	        		vo.setMovie_running("test");
	        		vo.setMovie_audience(intAu[j]);
	        		vo.setMovie_trailer(0);
	        		vo.setMovie_link("test");
	        		vo.setMovie_img("test");
	        		
	        		no += service.insertMovie(vo);
	        		System.out.println("check");
				
			}
		}
		
		Gson gson = new Gson();
		String result = gson.toJson(no);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
	}	
}
