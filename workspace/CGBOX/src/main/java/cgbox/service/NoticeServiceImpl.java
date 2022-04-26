package cgbox.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cgbox.dao.INoticeDao;
import cgbox.dao.NoticeDaoImpl;
import cgbox.vo.NoticeVO;

public class NoticeServiceImpl implements INoticeService{

	private INoticeDao dao;
	private static INoticeService service;
	private NoticeServiceImpl() {
		dao = NoticeDaoImpl.getInstance();
	}
	public static INoticeService getInstance() {
		if(service==null) service = new NoticeServiceImpl();
		return service;
	}
	
	@Override
	public List<NoticeVO> noticeList(Map<String, Object> map) {
		List<NoticeVO> list = null;
		try {
			list = dao.noticeList(map);
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
	public int updateNotice(NoticeVO vo) {
		int res = 0;
		try {
			res = dao.updateNotice(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int insertNotice(NoticeVO vo) {
		int res=0;
		try {
			res = dao.insertNotice(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	@Override
	public int deleteNotice(int no) {
		int res = 0;
		try {
			res = dao.deleteNotice(no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	@Override
	public List<NoticeVO> noticeDetail(int no) {
		List<NoticeVO> list = null;
		try {
			list = dao.noticeDetail(no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	
}
