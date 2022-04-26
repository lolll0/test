package cgbox.dao;

import java.sql.SQLException;
import java.util.List;

import cgbox.vo.MemberVO;
import cgbox.vo.QnAVO;

public interface IQnADao {

	public List<QnAVO> QnAList() throws SQLException;
	
	public int answerQnA(QnAVO vo) throws SQLException;
	
	public List<MemberVO> memberInfo(int no) throws SQLException;

	public int insertQnA(QnAVO vo) throws SQLException;
}
