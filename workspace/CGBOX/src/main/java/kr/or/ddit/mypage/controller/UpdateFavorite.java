package kr.or.ddit.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.mypage.service.IMyPageService;
import kr.or.ddit.mypage.service.MyPageServiceImpl;


@WebServlet("/UpdateFavorite.do")
public class UpdateFavorite extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String customer_no  = request.getParameter("customer_no");
		String mtheater_name  = request.getParameter("mtheater_name");
		String mset = request.getParameter("mset"); 
		
		
		IMyPageService service = MyPageServiceImpl.getInstance();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("customer_no", customer_no);
		map.put("mtheater_name", mtheater_name);
		
		int num =0;
		if(mset.equals("지정된 영화관이 없습니다.")) {
			num = service.insertFavorite(map);
		}else {
			num = service.updateFavorite(map);
		}
		
		Gson gson = new Gson();
		
		String result = gson.toJson(num);
		
		response.setContentType("application/json; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
	}

}
