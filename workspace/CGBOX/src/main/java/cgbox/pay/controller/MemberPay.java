package cgbox.pay.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cgbox.cart.service.CartServiceImpl;
import cgbox.cart.service.ICartService;
import cgbox.pay.service.IPayService;
import cgbox.pay.service.PayServiceImpl;
import cgbox.vo.MemberVO;
import cgbox.vo.MovieInfoVO;
import cgbox.vo.ReserveVO;
import cgbox.vo.ScreenVO;
import cgbox.vo.SeatVO;
import cgbox.vo.TheaterVO;
import cgbox.vo.selectmconVO;

/**
 * Servlet implementation class MemberPay
 */
@WebServlet("/MemberPay.do")
public class MemberPay extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		MemberVO loginmember = (MemberVO)session.getAttribute("loginmember");
		int customer_no = loginmember.getCustomer_no();
   
		IPayService service = PayServiceImpl.getInstance();

		// 보유한 영화관람권 불러오기
		List<selectmconVO> mconlist = service.selectmcon(customer_no);


		// 보유한 예약 정보 불러오기 //customer_no를 넘겨줘서 list 형식으로 받는다
	   List<MovieInfoVO> minfolist = service.minfo(customer_no);
       
	   //sum값 결제하실 금액 
	   int sum =0; 
	   for(int i=0; i<minfolist.size(); i++ ) {
		   sum += minfolist.get(i).getTheater_price();
	   }
	   
	    request.setAttribute("sum", sum);
	    request.setAttribute("mconlist", mconlist);
		request.setAttribute("minfolist", minfolist );
		
		request.setAttribute("loginmember", loginmember);
		
		request.getRequestDispatcher("pay/MemberPayPage.jsp").forward(request, response);

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
