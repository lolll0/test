package cgbox.service;

import java.sql.SQLException;
import java.util.List;

import cgbox.dao.IQnADao;
import cgbox.dao.QnADaoImpl;
import cgbox.vo.MemberVO;
import cgbox.vo.QnAVO;

public class QnAServiceImpl implements IQnAService{

	private IQnADao dao;
	private static IQnAService service;
	private QnAServiceImpl() {
		dao = QnADaoImpl.getInstance();
	}
	public static IQnAService getInstance() {
		if(service==null) service = new QnAServiceImpl();
		return service;
	}
	
	@Override
	public List<QnAVO> QnAList() {
		List<QnAVO> list = null;
		try {
			list = dao.QnAList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int answerQnA(QnAVO vo) {
		int res = 0;
		try {
			res = dao.answerQnA(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	@Override
	public List<MemberVO> memberInfo(int no) {
		List<MemberVO> list = null;
		try {
			list = dao.memberInfo(no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int insertQnA(QnAVO vo) {
		int res = 0;
		try {
			res = dao.insertQnA(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

}
