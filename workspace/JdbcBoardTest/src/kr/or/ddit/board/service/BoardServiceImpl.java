package kr.or.ddit.board.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.util.DBUtil3;

public class BoardServiceImpl implements IBoardService {
	
	private IBoardDao dao;
	
	private static BoardServiceImpl service;
	private BoardServiceImpl() {
		dao = BoardDaoImpl.getInstance();
	}
	
	public static BoardServiceImpl getInstance() {
		if(service == null) service = new BoardServiceImpl();
		return service;
	}
	
	@Override
	public int insertBoard(BoardVO boardvo) {
		Connection conn = null;
		int cnt = 0;
		try {
			conn = DBUtil3.getConnection();
			cnt = dao.insertBoard(conn, boardvo);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		} finally {
			if(conn!=null)try {conn.close();}catch(SQLException e){}
		} 
		return cnt;
	}

	@Override
	public int updateBoard(BoardVO boardvo) {
		Connection conn = null;
		int cnt = 0;
		try {
			conn = DBUtil3.getConnection();
			cnt = dao.updateBoard(conn, boardvo);
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
			cnt = 0;
		}finally {
			if(conn!=null)try {conn.close();}catch(SQLException e){}
		}
		return cnt;
	}

	@Override
	public int deleteBoard(int boardno) {
		Connection conn = null;
		int cnt = 0;
		try {
			conn = DBUtil3.getConnection();
			cnt = dao.deleteBoard(conn, boardno);
			
		} catch (SQLException e) {
			e.printStackTrace();
			cnt = 0;
		}finally {
			if(conn!=null)try {conn.close();}catch(SQLException e){}
		}
		return cnt;
	}

	@Override
	public List<BoardVO> getall() {
		Connection conn = null;
		List<BoardVO> list = null;
		
		try {
			conn = DBUtil3.getConnection();
			list = dao.getall(conn);
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		} finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		return list;
	}

	@Override
	public BoardVO searchno(int boardno) {
		Connection conn = null;
		BoardVO boardvo = null;
		
		try {
			conn = DBUtil3.getConnection();
			// 조회수 증가
			int cnt = dao.count(conn, boardno);
			if(cnt == 0) { // 조회수 증가를 실패했을 때
				return null;
			}
			
			boardvo = dao.searchno(conn, boardno);
			
		} catch (SQLException e) {
			e.printStackTrace();
			boardvo = null;
		}finally {
			if(conn!=null)try {conn.close();}catch(SQLException e){}
		}
		return boardvo;
	}

	@Override
	public List<BoardVO> searchboard(String title) {
		Connection conn = null;
		List<BoardVO> list = null;
		try {
			conn = DBUtil3.getConnection();
			list = dao.searchboard(conn, title);
		} catch (SQLException e) {
			e.printStackTrace();
			list = null;
		} finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		return list;
	}

	@Override
	public int count(int boardno) {
		Connection conn = null;
		int cnt = 0;
		try {
			conn = DBUtil3.getConnection();
			cnt = dao.count(conn, boardno);
		} catch (SQLException e) {
			e.printStackTrace();
			cnt = 0;
		}finally {
			if(conn!=null)try {conn.close();}catch(SQLException e){}
		}
		return cnt;
	}

}
