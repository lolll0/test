package cgbox.cart.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import cgbox.vo.MemberVO;
import cgbox.vo.allcartVO;

/**
 * Servlet implementation class CountUpdate
 */
@WebServlet("/CountUpdate.do")
public class CountUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CountUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
		MemberVO loginmember = (MemberVO)session.getAttribute("loginmember");
		int customer_no = loginmember.getCustomer_no();
            
		      request.setCharacterEncoding("utf-8");
	         
		      System.out.println("업데이트티운트 구하기 전 ");
		      int  updatecount = Integer.parseInt( request.getParameter("count"));	    
		    System.out.println("count : " +updatecount);
		     
		      int prodno = Integer.parseInt(request.getParameter("prod_no"));		  
	         
	          
	          
	          ICartService service = CartServiceImpl.getInstance();
	         
	          
	          
	          HashMap<String,Integer> map = new HashMap<String,Integer>();
	        
	          map.put("cart_count",updatecount);
	          map.put("prod_no",prodno);
	          map.put("customer_no", customer_no);
	          
	          
	          int count = service.updatecount(map);
	          
	          if(count>0) {System.out.println("수량변경에 성공하였습니다" + count); }
	        	   
	          response.setCharacterEncoding("utf-8");
	          response.setContentType("text/html; charset=utf-8");
	          PrintWriter out = response.getWriter();
	          out.print("성공");
	          
	  		    List<allcartVO> prodlist =null;
	  		   
	  		    prodlist = service.allcart(customer_no);
				request.setAttribute("prodlist", prodlist);  
				request.getRequestDispatcher("cart/cartView.jsp").forward(request, response);	
	          
	          
	          
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
