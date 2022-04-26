package reserve.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import cgbox.vo.ReserveVO;
import cgbox.vo.SeatVO;
import nonmember.service.INonMemberService;
import nonmember.service.NonMemberServiceImpl;
import reserve.service.IReserveService;
import reserve.service.ReserveServiceImpl;
import seat.service.ISeatService;
import seat.service.SeatServiceImpl;
import theater.service.ITheaterService;
import theater.service.TheaterServiceImpl;
import ticket.service.ITicketService;
import ticket.service.TicketServiceImpl;
import vo.NonMemberVO;
/*import vo.ReserveVO;*/
/*import vo.SeatVO;*/

@WebServlet("/InsertReservation.do")
public class InsertReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		System.out.println("InsertReservation에 왔다");
		
		//1) seats
		String[] seatsarray = request.getParameterValues("seats");
		//2) screenNo
		int screenNo = Integer.parseInt(request.getParameter("screenNo"));
		int cstomerNo = -1;

		//theaterNo세션에서 상영관 번호 정보 가져오기
		
		HttpSession session = request.getSession();
		
		//상영관 번호는 screenNo를 통해 얻어온다
		int theaterNo = getTheaterNoByscreenNo(screenNo);
		
		//3) customerNo
		String memcusNo = request.getParameter("customerNo");
				
		
		if(memcusNo == null || memcusNo.length() == 0) {
			
			if(session.getAttribute("nonMember") == null) {
				System.out.println("세션오류 : 회원정보가 없습니다");
				return;
			}else {
				NonMemberVO nvo = (NonMemberVO) session.getAttribute("nonMember");
				//비회원인 경우 새로운 고객정보(비회원)을 insert해준다
				// insert한 회원번호를 return 받는 함수
				System.out.println(nvo.getNonmember_birth());
				cstomerNo = getCustomerNum(nvo);
				System.out.println(cstomerNo);
			}
			
		}else {
			cstomerNo = Integer.parseInt(memcusNo);
		}
		
		System.out.println("최종 고객번호" + cstomerNo);
		
		ISeatService seatservice = SeatServiceImpl.getInstance();
		ITicketService tiservice = TicketServiceImpl.getInstance();
		IReserveService rservice = ReserveServiceImpl.getInstance();
		
		//좌석번호 리스트
		List<Integer> seatnoList = new ArrayList<Integer>();
		
		for(String s : seatsarray) {
			System.out.println("행(A -> SEAT_ROW) : " + s.charAt(0) + " 열(1 - >SEAT_COL) : " + s.charAt(1) );
			SeatVO pvo = new SeatVO();
			pvo.setTheater_no(theaterNo);
			pvo.setSeat_row(String.valueOf(s.charAt(0)));
			pvo.setSeat_col(String.valueOf(s.charAt(1)));
			int seatno = seatservice.selectSeatNo(pvo);
			
			seatnoList.add(seatno);
		}
		
		String screen_day = "2022." + (String) session.getAttribute("resmonth") + "." + (String) session.getAttribute("resday") + "("+ session.getAttribute("resweek") +")";
		
		
		//예약 insert : 좌석번호(seatnoList에 여러개 있음), 상영일자번호(screenNo), 상영일자(screen_day)
		//티켓 INSERT : 고객번호(cstomerNo)
		tiservice.insertNew(cstomerNo);

		for(int seatno : seatnoList) {
			
			ReserveVO rvo = new ReserveVO();
			rvo.setSeat_no(seatno);
			rvo.setScreen_no(screenNo);
			rvo.setScreen_day(screen_day);
			rservice.insertNew(rvo);
		}
		
		String alet = "예매에 성공하였습니다";
		Gson g = new Gson();
		String result = g.toJson(alet);
		PrintWriter out = response.getWriter();
		out.write(result);
		out.flush();
	}
	
	private int getTheaterNoByscreenNo(int sno) {
		
		ITheaterService service = TheaterServiceImpl.getInstance();
		
		return service.selectTheaterNoByScreenNo(sno);
	}
	
	private int getCustomerNum(NonMemberVO nvo) {
		INonMemberService nmService = NonMemberServiceImpl.getInstance();
		
		//최고값의 + 1
		int insertCnum = nmService.selectMaxCustomer() + 1;
		
		//고객번호 추가
		nmService.insertCustomer(insertCnum);
		
		System.out.println(insertCnum);
		nvo.setCustomer_no(insertCnum);
		
		//추가한 고객번호에 비회원 데이터 연결
		nmService.insertNonMember(nvo);
		
		System.out.println(insertCnum);
		
		return insertCnum;
		
	}

}
