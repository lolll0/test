package cgbox.pay.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cgbox.pay.service.IPayService;
import cgbox.pay.service.PayServiceImpl;
import cgbox.vo.MemberVO;
import cgbox.vo.MovieInfoVO;
import cgbox.vo.ReserveVO;
import cgbox.vo.ScreenVO;
import cgbox.vo.SeatVO;
import cgbox.vo.TheaterVO;
import vo.NonMemberVO;

/**
 * Servlet implementation class MemberPaySuccess
 */
@WebServlet("/MemberPaySuccess.do")
public class MemberPaySuccess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberPaySuccess() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		// 회원구하기
		HttpSession session = request.getSession();

		
		
		int customer_no = 0;
		
		if(request.getParameter("cno") != null) { //비회원인경우
			customer_no =  Integer.parseInt(request.getParameter("cno"));
			
		}else { //회원인경우
			
		System.out.println("회원입니다 ==>"+request.getParameter("cno"));
		 
		customer_no = Integer.parseInt( request.getParameter("cno"));
				
		//여기서 세션을 다시 생성해줍니다!!
		
//		     String grade = request.getParameter("grade");
//		     String birth = request.getParameter("birth");
//		     String id = request.getParameter("id");
//		     String mail =request.getParameter("mail");
//		     String name = request.getParameter("name");
//		     String pass= request.getParameter("pass");
//		     int point = Integer.parseInt(request.getParameter("point"));		
//		     String tel = request.getParameter("tel");
//		     MemberVO loginmember = new MemberVO();
//		     loginmember.setCustomer_no(customer_no);
//		     loginmember.setGrade_no(grade);
//		     loginmember.setMember_id(id);
//		     loginmember.setMember_name(name);
//		     loginmember.setMember_mail(mail);
//		     loginmember.setMember_pass(pass);
//		     loginmember.setMember_birth(birth);
//		     loginmember.setMember_tel(tel);
//		     loginmember.setMember_point(point);	     
//		     session.setAttribute("loginmember", loginmember);
		     
		}

	//	}
		// 이곳에서 할일 ==> 티켓 상태 완료로 바꿔주기 /고객이 예약한 영화 정보 구해서 돌려주기
		
		IPayService service = PayServiceImpl.getInstance();

		// 티켓 상태 완료로 바꿔주기

		// 보유한 예약 정보 불러오기

		System.out.println("멤버완료 성공 ~!여기오나?");

		// 보유한 예약 정보 불러오기 //customer_no를 넘겨줘서 list 형식으로 받는다
		List<MovieInfoVO> minfolist = service.minfo(customer_no);
		request.setAttribute("minfolist", minfolist);

		
		// 티켓상태 완료로 바꿔주기
		for (MovieInfoVO vo : minfolist) {
			int ticketno = vo.getTicket_no();
			int count = service.updateTStatus(ticketno);

			if (count > 0) {
				System.out.println("티켓상태 Y로 바꾸기 완료 ");
			}
			
		}
       
		String conprodno = request.getParameter("conprodno");
		// 사용한 영화상품권 수량 -1 하기! //회원인경우만 가능!
		if (service.checkMemID(customer_no) != null && conprodno != "") {

			int prodno = Integer.parseInt(request.getParameter("conprodno"));
			System.out.println("prodno값:" + prodno);

			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("customer_no", customer_no);
			map.put("prod_no", prodno);
			int count = service.minusCon(map);
			if (count > 0) {
				System.out.println("영화상품권 수량 -1하기 성공 ");
			}
			
			//변한 수량이 -1이면 없애기 
			
			if(service.zerocon(map)==0) {
				//수량이 0이면 없앤다
		       count=	service.zerodelete(map);
		       if (count > 0) {
					System.out.println("수량이  0인 상품 삭제 성공 ");
				}
			}
			
		}
		

        
		request.setAttribute("minfolist", minfolist);
		request.getRequestDispatcher("pay/PaySuccess.jsp").forward(request, response);

	

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
