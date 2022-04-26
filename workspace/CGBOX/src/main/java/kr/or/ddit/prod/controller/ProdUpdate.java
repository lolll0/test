package kr.or.ddit.prod.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.prod.vo.ProdVO;

/**
 * Servlet implementation class ProdUpdate
 */
@WebServlet("/ProdUpdate.do")
public class ProdUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProdUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		int price = Integer.parseInt(request.getParameter("price"));
		String detail = request.getParameter("detail");
		String psource = request.getParameter("psource");
		
		ProdVO vo = new ProdVO();
		
		vo.setProd_category(category);
		vo.setProd_detail(detail);
		vo.setProd_name(name);
		vo.setProd_no(no);
		vo.setProd_price(price);
		vo.setProd_source(psource);
		
		IProdService service = ProdServiceImpl.getInstance();
		
		int res = service.updateProd(vo);
		request.setAttribute("res", res);
		request.getRequestDispatcher("result.jsp").forward(request, response);
	}

}
