package cgbox.service;

import java.util.List;
import java.util.Map;

import cgbox.vo.NoticeVO;

public interface INoticeService {

	//공지 리스트 출력
	public List<NoticeVO> noticeList(Map<String, Object> map);
	
	//공지 상세보기
	public List<NoticeVO> noticeDetail(int no);
	
	//page정보 구하기 
	public Map<String,Object> getPageInfo(int page,String type,String word);	
	
	//공지 총 개수
	public int totalCount(Map<String,String> map);
	
	//공지 수정
	public int updateNotice(NoticeVO vo);
	
	//공지 등록
	public int insertNotice(NoticeVO vo);

	//공지 삭제
	public int deleteNotice(int no);
}
