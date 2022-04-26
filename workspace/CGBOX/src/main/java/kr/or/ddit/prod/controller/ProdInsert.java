package kr.or.ddit.prod.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.prod.vo.ProdVO;


/**
 * Servlet implementation class ProdInsert
 */
@WebServlet("/ProdInsert.do")
public class ProdInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProdInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		String detail = request.getParameter("detail");
		String source = request.getParameter("source");
		int price = Integer.parseInt(request.getParameter("price"));
		
		ProdVO vo = new ProdVO();
		
		vo.setProd_category(category);
		vo.setProd_detail(detail);
		vo.setProd_name(name);
		vo.setProd_price(price);
		vo.setProd_source(source);
		
		kr.or.ddit.prod.service.IProdService service = ProdServiceImpl.getInstance();
		
		int res = service.insertProd(vo);
		request.setAttribute("res", res);
		request.getRequestDispatcher("result.jsp").forward(request, response);
	}

}
