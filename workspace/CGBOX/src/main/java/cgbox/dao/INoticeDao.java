package cgbox.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import cgbox.vo.NoticeVO;

public interface INoticeDao {

	//공지 리스트 출력
	public List<NoticeVO> noticeList(Map<String, Object> map) throws SQLException;
	
	//공지 상세 보기
	public List<NoticeVO> noticeDetail(int no) throws SQLException;
	
	//공지 총 개수
	public int totalCount(Map<String,String> map) throws SQLException;
	
	//공지 수정
	public int updateNotice(NoticeVO vo) throws SQLException;
	
	//공지 등록
	public int insertNotice(NoticeVO vo) throws SQLException;
	
	//공지 삭제
	public int deleteNotice(int no) throws SQLException;
}
