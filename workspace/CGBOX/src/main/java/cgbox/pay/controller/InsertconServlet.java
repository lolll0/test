package cgbox.pay.controller;

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

import cgbox.pay.service.IPayService;
import cgbox.pay.service.PayServiceImpl;
import cgbox.vo.MemberVO;

/**
 * Servlet implementation class Insertcon
 */
@WebServlet("/Insertcon.do")
public class InsertconServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		IPayService service = PayServiceImpl.getInstance();

		int prodno = Integer.parseInt(request.getParameter("prodno")); //회원이 입력한 상품 번
        		
		// 실제 있는 상품인지 확인하는 작업 //count(prod_no)
		List<Integer> list = service.checkno();
		boolean flag = false;
		
		for(Integer no : list) {
		    System.out.println(no); //성공했음 
			if(prodno == no) {
				flag = true;  //있는 상품
			}
		}
		
		if (flag ==false) {
			System.out.println("입력하신 상품번호는 없는 상품입니다 ");
			out.print("없는 상품");
		} else {

			HttpSession session = request.getSession();
			MemberVO loginmember = (MemberVO)session.getAttribute("loginmember");
			int customer_no = loginmember.getCustomer_no();
  

			// 해당 상품을 고객이 원래 가지고 있는 상품인지 확인한다
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("prod_no", prodno);
			map.put("customer_no", customer_no);
			
			String chkpro = service.checkproduct(map);
            System.out.println("chkpro =="+chkpro);
			
			if (chkpro != null) { // 원래 있는 상품은 그냥 수량을 +1한다.
				
			 // 사용자가 입력한 상품 번호 ==prod의 번호와 같아야한다!

				int count = service.updateproductcount(map);
				if (count > 0) {
				
					out.print("보유상품");
					out.flush();

				} else {
					System.out.println("수량 +1실패 ");
				}

			} else if (chkpro == null ) { // chkpro가 null이다 == 가지고 있지 않은 상품이다 =insert

				int count = service.insertmcon(map);
				if (count > 0) {
					out.print("성공");
					System.out.println("영화관람권을 인서트성공했습니다.");
        

				} else {
					System.out.println("영화관람권 인서트 실패..");
				}
			}
		}

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
