package cgbox.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import cgbox.service.FAQServiceImpl;
import cgbox.service.IFAQService;
import cgbox.vo.FAQVO;

/**
 * Servlet implementation class FAQList
 */
@WebServlet("/FAQList.do")
public class FAQList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		int rqpage = Integer.parseInt(request.getParameter("page"));
		String rqtype = request.getParameter("stype");
		String rqword = request.getParameter("sword");
		
		IFAQService service = FAQServiceImpl.getInstance();
		
		Map<String,Object> pmap = service.getPageInfo(rqpage, rqtype, rqword);
		Map<String, Object> map = new HashMap<String,Object>();
		
		map.put("start",(int)pmap.get("start"));  //startval
		map.put("end",(int)pmap.get("end"));    //endval
		map.put("stype", rqtype);
		map.put("sword", rqword);
		
		List<FAQVO> list = service.FAQList(map);
		
		JsonObject obj = new JsonObject();
		obj.addProperty("totalp", (Integer)pmap.get("totalpage"));
		obj.addProperty("startp", (Integer)pmap.get("startpage"));
		obj.addProperty("endp", (Integer)pmap.get("endpage"));
		
		Gson gson = new Gson();
		
		JsonElement ele = gson.toJsonTree(list);
		
		obj.add("datas", ele);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(obj);
		out.flush();
	}

}
