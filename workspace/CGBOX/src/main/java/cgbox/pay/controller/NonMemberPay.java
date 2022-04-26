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
 * Servlet implementation class NonMemberPay
 */
@WebServlet("/NonMemberPay.do")
public class NonMemberPay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NonMemberPay() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//비회원 결제화면 가지전에 거치는 servlet
		
		request.setCharacterEncoding("utf-8");
		IPayService service = PayServiceImpl.getInstance();
		
		HttpSession session = request.getSession();
		
        
		//보유한 예약 정보 불러오기
		// 보유한 예약 정보 불러오기 //customer_no를 넘겨줘서 list 형식으로 받는다
		   List<MovieInfoVO> minfolist = null;
	      
		  
		   int customer_no = 0;
		   
		   System.out.println("tno의 값은 : "+request.getParameter("tno"));
		   //비회원이 결제 전에 예매만 해놓고 결제하지 않은 것 불러오기 
		   if(request.getParameter("tno")!=null) {  //결제가 아직 되지 않은 것의 ticket_no
			   	  System.out.println(request.getParameter("tno")+"입니다");
			      minfolist = service.minfoNonmember(Integer.parseInt(request.getParameter("tno")));
			      
			     customer_no = service.nonmemcusno(Integer.parseInt(request.getParameter("tno")));
			      
		   }else {
			   //원래 customer_no를 통해서 결제한 부분!
			   NonMemberVO nvo = (NonMemberVO) session.getAttribute("nonMember");
			   customer_no = nvo.getCustomer_no();
			   minfolist = service.minfo(customer_no); 
 
		   }
		   

		   //sum값 결제하실 금액 
		   int sum =0; 
		   for(int i=0; i<minfolist.size(); i++ ) {
			   sum += minfolist.get(i).getTheater_price();
		   }
		   System.out.println("비회원의 SUM 값은 : "+ sum);
		   for(MovieInfoVO info : minfolist) {
			   System.out.println("비회원의 info : "+ info);
		   }
		   
		   request.setAttribute("minfolist", minfolist);
           request.setAttribute("mname","CGBOX영화예매");
		   request.setAttribute("sum", sum);
		   request.setAttribute("cno", customer_no);
		
		request.getRequestDispatcher("pay/INIStdPayRequest2.jsp").forward(request, response);
	    
	    
				
	}

	/**e
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
