package kr.or.ddit.board.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.board.vo.BoardVO;

public interface IBoardDao {
	/**
	 * 게시글 입력
	 * @param conn
	 * @param boardvo
	 * @return
	 * @throws SQLException
	 */
	public int insertBoard(Connection conn, BoardVO boardvo) throws SQLException;
	
	/**
	 * 게시글 수정
	 * @param conn
	 * @param boardvo
	 * @return
	 * @throws SQLException
	 */
	public int updateBoard(Connection conn, BoardVO boardvo) throws SQLException;
	
	/**
	 * 게시글 삭제
	 * @param conn
	 * @param boardno
	 * @return
	 * @throws SQLException
	 */
	public int deleteBoard(Connection conn, int boardno) throws SQLException;
	
	/** 게시글 전체 출력
	 * 
	 * @param conn
	 * @return
	 * @throws SQLException
	 */
	public List<BoardVO> getall(Connection conn) throws SQLException;
	
	/** 게시글번호로 검색
	 * 
	 * @param conn
	 * @param boardno
	 * @return
	 * @throws SQLException
	 */
	public BoardVO searchno(Connection conn, int boardno) throws SQLException;
	
	/** 제목으로 게시물 검색
	 * 
	 * @param conn
	 * @param title
	 * @return
	 * @throws SQLException
	 */
	public List<BoardVO> searchboard(Connection conn, String title) throws SQLException;
	
	/** 조회수
	 * 
	 * @param conn
	 * @param boardno
	 * @return
	 * @throws SQLException
	 */
	public int count(Connection conn, int boardno) throws SQLException;
}
