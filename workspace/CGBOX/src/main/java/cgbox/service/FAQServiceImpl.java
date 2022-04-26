package cgbox.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cgbox.dao.FAQDaoImpl;
import cgbox.dao.IFAQDao;
import cgbox.vo.FAQVO;
import cgbox.vo.NoticeVO;

public class FAQServiceImpl implements IFAQService {

	private IFAQDao dao;
	private static IFAQService service;
	private FAQServiceImpl() {
		dao = FAQDaoImpl.getInstance();
	}
	public static IFAQService getInstance() {
		if(service==null) service = new FAQServiceImpl();
		return service;
	}
	
	@Override
	public List<FAQVO> FAQList(Map<String, Object> map) {
		List<FAQVO> list = null;
		try {
			list = dao.FAQList(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<FAQVO> FAQDetail(int no) {
		List<FAQVO> list = null;
		try {
			list = dao.FAQDetail(no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Map<String, Object> getPageInfo(int page, String type, String word) {
		Map<String,Object> map = new HashMap<String, Object>();
		  //한페이지당 출력할 글 갯수
		  int perlist = 10;
		  
		  int perpage = 5;
		  
		  Map<String,String> paramap = new HashMap<String,String>();
		  paramap.put("stype", type);
		  paramap.put("sword", word);
		  
		  //전체 글갯수
		  int count = this.totalCount(paramap);
		  
		  //전체 페이지수 
		  int totalPage =(int)Math.ceil((double)count / perlist); 
		  
		  //start end 
		  
		  int start = (page -1)*perlist + 1; 
		  int end = start + perlist -1;
		  if(end>count) {
			  end = count;
		  }
		 
		  int startPage = ((page -1) / perpage * perpage) +1;
		  int endPage = startPage + perpage -1;
		  
		  if(endPage > totalPage) {
			  endPage = totalPage;
		  }
		
		  map.put("start",start);
		  map.put("end",end);
		  map.put("startpage", startPage);
		  map.put("endpage", endPage);
		  map.put("totalpage", totalPage);
		  
		  return map;
	}

	@Override
	public int totalCount(Map<String, String> map) {
		int count = 0;
		 try {
			count = dao.totalCount(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		return count;
	}

	@Override
	public int updateFAQ(FAQVO vo) {
		int res = 0;
		try {
			res = dao.updateFAQ(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int insertFAQ(FAQVO vo) {
		int res=0;
		try {
			res = dao.insertFAQ(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int deleteFAQ(int no) {
		int res = 0;
		try {
			res = dao.deleteFAQ(no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

}
