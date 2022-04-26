package cgbox.pay.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cgbox.pay.service.IPayService;
import cgbox.pay.service.PayServiceImpl;

/**
 * Servlet implementation class Discount
 */
@WebServlet("/Discount.do")
public class Discount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("discount서블릿 오나요?");
	
		request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
	PrintWriter out = response.getWriter();
	
	int prodno = Integer.parseInt(request.getParameter("conprod"));
	
	IPayService service = PayServiceImpl.getInstance();

	
	
	
     int prodprice = service.discountprice(prodno);
	 
     out.print(prodprice);
     out.flush();
   
	
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
