package cgbox.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cgbox.dao.IManagerMemberDao;
import cgbox.dao.ManagerMemberDaoImpl;
import cgbox.vo.MemberVO;

public class ManagerMemberServiceImpl implements IManagerMemberService {

	private IManagerMemberDao dao;
	private static IManagerMemberService service;
	private ManagerMemberServiceImpl() {
		dao= ManagerMemberDaoImpl.getInstance();
	}
	public static IManagerMemberService getInstance() {
		if(service ==null) service = new ManagerMemberServiceImpl();
		return service;
	}
	
	
	@Override
	public List<MemberVO> memberList(Map<String, Object> map) {
		List<MemberVO> list = null;
		
		try {
			list = dao.memberList(map);
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
		 
		  //startPage,endPage구하기
		  //page 1 = >1
		  //page 2 = >1
		  //page 3 = >3 
		  //page 4 => 3 4
		  //page 6 => 5 6
		  //page 7 => 7 8
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
	public int updateMember(MemberVO vo) {
		int res = 0;
		try {
			res = dao.updateMember(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	@Override
	public int insertMember(MemberVO vo) {
		int res = 0;
		try {
			res = dao.insertMember(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

}
