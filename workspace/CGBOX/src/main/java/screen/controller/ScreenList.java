package screen.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import cgbox.vo.ScreenVO;
import cgbox.vo.TheaterVO;
import mtheater.service.IMTheaterService;
import mtheater.service.MTheaterServiceImpl;
import screen.service.IScreenService;
import screen.service.ScreenServiceImpl;
import theater.service.ITheaterService;
import theater.service.TheaterServiceImpl;
import vo.MTheaterVO;
/*import vo.ScreenVO;*/
/*import vo.TheaterVO;*/


@WebServlet("/screenList.do")
public class ScreenList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//상영관 번호 리스트를 구한다 > tlist.get(0).getTheater_no(); => 파라미터 리스트의 theater_no에 등록
		List<Integer> tlist = findTheaterNumberList(request);
		
		
		ITheaterService tservice = TheaterServiceImpl.getInstance();
		IScreenService sservice = ScreenServiceImpl.getInstance();
		
		// 영화번호와 상영관 번호를 이용해 상영일자 리스트를 구한다-> 여러개의 상영관 번호로 상영관 번호가 가진 스크린 번호 리스트를 출력한다
		
		// key값은 상영관 번호 list는 상영일자(screen)객체 리스트 (같은 상영일자끼리)
		Map<List<String>, List<ScreenVO>> resultMap = new HashMap<List<String>, List<ScreenVO>>();
		
		for(int tno : tlist) {
			ScreenVO parameterVO = new ScreenVO();
			parameterVO.setMovie_no(Integer.parseInt(request.getParameter("movie_no")));
			parameterVO.setTheater_no(tno);
			
			//tno를 이용해 해당번호를 가진 상영관의 이름과 종류를 구해 키값으로 넘겨준다
			TheaterVO tinfo = tservice.selectAllByTheaterNo(tno);
			
			List<String> keylist = new ArrayList<String>();
			keylist.add(String.valueOf(tinfo.getTheater_name()));
			keylist.add('"' + tinfo.getTheater_kind() + '"');
			
			
			//상영관 번호와 상영시작시간과 종료시간을 구한다
			List<ScreenVO> slist = sservice.selectScreenList(parameterVO);
			
			//상영일자 정보가 있을때만 전달한다
			
			if(slist.size() != 0) {
				resultMap.put(keylist, slist);
			}
		}
		
		
		
		Gson g = new Gson();
		String result = g.toJson(resultMap);
		PrintWriter out = response.getWriter();
		out.write(result);
		out.flush();
		
	}
	
	private List<Integer> findTheaterNumberList(HttpServletRequest request) {
	
		//영화관 이름으로 영화관 번호 찾기
		String mtname = request.getParameter("mtheaterName");
				
		IMTheaterService mservice = MTheaterServiceImpl.getInstance();
		MTheaterVO mvo = mservice.selectAllByName(mtname);
		
		
		int mnum = mvo.getMtheater_no();
		
		//영화관 번호로 상영관 번호 찾기 -> 여러개나옴(상영관 번호) : 1,2,3..(관)
		ITheaterService tservice = TheaterServiceImpl.getInstance();
		List<TheaterVO> tlist = tservice.selectAllByMtheaterNo(mnum);
		
		List<Integer> result = new ArrayList<Integer>();
		for(TheaterVO tvo : tlist) {
			result.add(tvo.getTheater_no());
		}
		
		
		return result;
		
	}
	
	
}
