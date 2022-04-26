package cgbox.cart.controller;

import java.io.IOException;
import java.util.HashMap;

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

/**
 * Servlet implementation class CartPaySuccess
 */
@WebServlet("/CartPaySuccess.do")
public class CartPaySuccess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("여기옵니가>");
		//스낵 결제가 되면!! 이곳으로 온다~!
		//이곳에서 해야할 일 ==> 결제완료된 상품을 장바구니상품테이블에서 삭제한다
      request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		/* MemberVO loginmember = (MemberVO)session.getAttribute("loginmember"); */
		int customer_no = 1;
		
		ICartService service = CartServiceImpl.getInstance();
		
	  String[] prods=	request.getParameterValues("prod");
		
   HashMap<String,Integer> map = new HashMap<String,Integer>();
   
  // 상품번호, 고객번호, 금액
  
  for(String prod : prods) {
	   System.out.println("결제완료된 상품번호 : "+prod);
	   map.put("customer_no", customer_no);
       map.put("prod_no",Integer.parseInt(prod));
	   int count = service.paySuccessRemove(map);
	   if(count>0) {
	   System.out.println("결제 완료된 상품을 삭제완료하였습니다 ");
	
	   }else {
		   System.out.println("상품삭제 실패하였습니다..");
	   }
	   
	   
   }
   //결제 테이블에 넣어주기
  //HashMap<String,>
  
   // System.out.println(request.getParameter("price")); 성공했다!!
int payamount = Integer.parseInt(request.getParameter("price"));

  HashMap<String,Integer> map2 = new HashMap<String,Integer>();
   
  for(String prod : prods) {
	  map2.put("customer_no",customer_no);
	  map2.put("prod_no",Integer.parseInt(prod));
	  map2.put("pay_amount",payamount);
	int res =  service.insertpaylist(map2);
	  if(res>0) {
		  System.out.println("결제리스트에 삽입 성공 ");
	  }
	    
  }
  
  
  
  
  
  
		
	request.getRequestDispatcher("cart/cartMain.jsp").forward(request, response);
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
