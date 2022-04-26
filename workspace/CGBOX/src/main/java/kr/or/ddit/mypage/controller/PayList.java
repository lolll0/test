package kr.or.ddit.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.mypage.service.IMyPageService;
import kr.or.ddit.mypage.service.MyPageServiceImpl;


@WebServlet("/PayList.do")
public class PayList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String customer_no = request.getParameter("customer_no");
		
		IMyPageService service = MyPageServiceImpl.getInstance();
		
		List<Map<String, Object>> list = service.payList(customer_no);
		
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		
		for(int i=0; i<list.size(); i++) {
			Object obj = f.format(list.get(i).get("PAY_DATE"));
			list.get(i).put("PAY_DATE", obj);
		}
		
		
		Gson gson = new Gson();
		
		String result = gson.toJson(list);
		
		response.setContentType("application/json; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
	}

}
