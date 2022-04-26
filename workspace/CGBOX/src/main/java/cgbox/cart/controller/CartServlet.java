package cgbox.cart.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cgbox.cart.service.CartServiceImpl;
import cgbox.cart.service.ICartService;
import cgbox.vo.CartProdVO;
import cgbox.vo.MemberVO;
import cgbox.vo.allcartVO;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet.do")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//장바구니 버튼 눌렀을 때 오는 서블릿!!(불러오기만하기)

		//세션설정
		request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
		
		MemberVO loginmember = (MemberVO)session.getAttribute("loginmember");
	   int customer_no = 1;

		//세션을 통해서 id를 얻는다

		
		ICartService service = CartServiceImpl.getInstance();
		
	
		//장바구니가 있는 회원인지 아닌지 먼저 확인한다!
//		
//		String cartno = service.checkcart(customer_no);
//       
//		  
//		
//		if(cartno == null) { //아직 장바구니를 가지고 있지 않은 회원 //장바구니를 생성할 필요가 없다
//			request.setAttribute("prodlist", prodlist); //null인 값을 request에 담아서 넘겨준다 
//			request.getRequestDispatcher("cart/cartView.jsp").forward(request, response);	
//			
//		}else{
			//이미 장바구니를 가지고 있는 회원의 장바구니 리스트를 가져온

        	 List<allcartVO> prodlist =null;
			 prodlist = service.allcart(customer_no);
			 request.setAttribute("prodlist", prodlist);
			 request.getRequestDispatcher("cart/cartView.jsp").forward(request, response);	
			
			
	//	}

		
		
		
		
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
