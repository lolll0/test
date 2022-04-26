package nonmember.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cgbox.vo.ReserveVO;
import cgbox.vo.ScreenVO;
import cgbox.vo.SeatVO;
import cgbox.vo.TheaterVO;
import movie.service.IMovieService;
import movie.service.MovieServiceImpl;
import movie.vo.MovieVO;
import mtheater.service.IMTheaterService;
import mtheater.service.MTheaterServiceImpl;
import reserve.service.IReserveService;
import reserve.service.ReserveServiceImpl;
import screen.service.IScreenService;
import screen.service.ScreenServiceImpl;
import seat.service.ISeatService;
import seat.service.SeatServiceImpl;
import theater.service.ITheaterService;
import theater.service.TheaterServiceImpl;
import ticket.service.ITicketService;
import ticket.service.TicketServiceImpl;
import vo.MTheaterVO;
import vo.NonMemberVO;
/*import vo.ReserveVO;*/
/*import vo.ScreenVO;*/
/*import vo.SeatVO;*/
/*import vo.TheaterVO;*/
import vo.TicketVO;

@WebServlet("/nonmemberReservationCheck.do")
public class NonmemberReservationCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//비회원 예매 확인용
		
		request.setCharacterEncoding("utf-8");
		request.setAttribute("application/json; charset=utf-8", response);
		
		NonMemberVO vo = new NonMemberVO();
		
		
		vo.setNonmember_birth(request.getParameter("nonmember_birth"));
		vo.setNonmember_pass(request.getParameter("nonmember_pass"));
		String mail = request.getParameter("mail1") + "@" + request.getParameter("mail2"); 
		vo.setNonmember_mail(mail);
		
		System.out.println("이메일" + mail);
		System.out.println("생년월일" + request.getParameter("nonmember_birth"));
		System.out.println("비밀번호" + request.getParameter("nonmember_pass"));
		
		ITicketService service = TicketServiceImpl.getInstance();
		//티켓은 1장만 가져온다
		TicketVO ticket = service.selectAllticketByNonMember(vo);
		
		
		if(ticket != null) {
			
		//결제여부 ('Y' : 결제완료 / 'N' : 예약중)
		String status = ticket.getTicket_status();
		
		//1개의 티켓이 가진 예약정보를 불러온다
		IReserveService service2 = ReserveServiceImpl.getInstance();
		List<ReserveVO> rlist = service2.selectReserveByTicket(ticket.getTicket_no());
		
		//상영일자
		String Screen_day = rlist.get(0).getScreen_day();
		//상영번호
		int Screen_no = rlist.get(0).getScreen_no();
		
		//좌석 리스트
		List<String> seats = new ArrayList<String>();
		ISeatService service3 = SeatServiceImpl.getInstance();
		for(ReserveVO r : rlist) {
			//좌석번호
			int sno = r.getSeat_no();
			SeatVO svo = service3.selectSeatByNo(sno);
			
			//좌석
			String seat = svo.getSeat_row() + svo.getSeat_col();
			seats.add(seat);
		}
		
		//출력용 좌석 정보
		
		System.out.println("좌석 개수" + seats.size());
		String resultSeat = "";
		for(int i = 0; i < seats.size(); i++) {
			if(i != 0) {
				resultSeat += ", ";
			}
			resultSeat += seats.get(i);
		}
		
		System.out.println("좌석 정보" + resultSeat);
		
		IScreenService service4 = ScreenServiceImpl.getInstance();
		ScreenVO scvo = service4.selectAllByno(Screen_no);
		
		//영화번호
		String movieNo = String.valueOf(scvo.getMovie_no());
		IMovieService service5 = MovieServiceImpl.getInstance();
		
		MovieVO mvo = service5.selectAllMovieByNo(movieNo);
		
		
		//출력용 영화이름
		String resultMovieName = service5.selectNameByNo(movieNo);
		
		//출력용 상영시간
		String resultTime = scvo.getScreen_end() + " ~ " + scvo.getScreen_end();
		
		//상영관 번호
		int tno = scvo.getTheater_no();
		ITheaterService service6 = TheaterServiceImpl.getInstance();
		TheaterVO thvo = service6.selectAllByTheaterNo(tno);
		
		//출력용 상영관 종류
		String theaterKind = thvo.getTheater_kind();
		
		//출력용 상영관 이름
		String theaterName = thvo.getTheater_name() + "관";
		
		//영화관 번호
		int mtheaterNo = thvo.getMtheater_no();
		IMTheaterService service7 = MTheaterServiceImpl.getInstance();
		
		//출력용 영화관이름
		String mtname = service7.selectNameByNo(mtheaterNo);
		
		
		
		//출력내용
		Map<String, String> result = new HashMap<String, String>();
		
		//티켓번호
		result.put("ticket", String.valueOf(ticket.getTicket_no()));
		
		//영화이름
		result.put("mname", resultMovieName);
		
		//영화관이름
		result.put("mtName", mtname);
		
		//상영관이름
		result.put("tName", theaterName);
		
		//상영관종류
		result.put("tKind", theaterKind);
		
		//상영일자
		result.put("day", Screen_day);
		
		//상영 시작시간 종료시간
		result.put("time", resultTime);
		
		//좌석
		result.put("seats", resultSeat);
		
		//결제여부
		result.put("status", status);
		
		//가격 price
		int price = thvo.getTheater_price() * seats.size();
		result.put("price", String.valueOf(price));
		
		//영화 이미지
		result.put("mImg", mvo.getMovie_img());
		
		
		HttpSession session = request.getSession();
		session.setAttribute("result", result);
		
		response.sendRedirect(request.getContextPath() + "/ticketing/nonreservation.jsp");
		
		}else {
		
			//티켓정보가 없는 경우
			response.sendRedirect(request.getContextPath() + "/ticketing/NonMember_reservations.jsp?msg=NO");
			
		}
	}

}
