package mtheater.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cgbox.vo.ScreenVO;
import movie.service.IMovieService;
import movie.service.MovieServiceImpl;
import movie.vo.MovieVO;
import screen.service.IScreenService;
import screen.service.ScreenServiceImpl;
import theater.service.ITheaterService;
import theater.service.TheaterServiceImpl;

@WebServlet("/ReservationSession.do")
public class ReservationSession extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		session.setAttribute("moiveName", request.getParameter("moiveName"));
		session.setAttribute("mtheaterName", request.getParameter("mtheaterName"));
		session.setAttribute("resmonth", request.getParameter("resmonth"));
		session.setAttribute("resday", request.getParameter("resday"));
		session.setAttribute("theaterName", request.getParameter("theaterName"));
		
		session.setAttribute("screenTime", request.getParameter("screenTime"));
		session.setAttribute("resweek", request.getParameter("resweek"));
		session.setAttribute("screenNo", request.getParameter("screenNo"));
		session.setAttribute("screen_end", request.getParameter("screen_end"));
		session.setAttribute("movieNo", request.getParameter("movieNo"));
		
		IMovieService service = MovieServiceImpl.getInstance();
		
		MovieVO mvo = service.selectAllMovieByNo(request.getParameter("movieNo"));
		
		session.setAttribute("mvimg", mvo.getMovie_img());
		
		//가격
		
		ITheaterService service2 = TheaterServiceImpl.getInstance();
		
		Map<String, String> pmap = new HashMap<String, String>();
		pmap.put("mname", request.getParameter("mtheaterName"));
		pmap.put("tname",request.getParameter("theaterName"));
		
		
		int price = service2.selectTheaterPriceByMnoAndTname(pmap);
		session.setAttribute("tprice", price);
		
		IScreenService service3 = ScreenServiceImpl.getInstance();
		//상영관 번호
		
		int scno = Integer.parseInt(request.getParameter("screenNo"));
		ScreenVO svo = service3.selectAllByno(scno);
		int tno = svo.getTheater_no();
		session.setAttribute("theaterNo", tno);
		
	}

}
