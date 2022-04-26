package kr.or.ddit.board.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.board.vo.BoardVO;

public interface IBoardService {
	
	/**
	 * 게시글 입력
	 * @param conn
	 * @param boardvo
	 * @return
	 * @throws SQLException
	 */
	public int insertBoard(BoardVO boardvo);
	
	/**
	 * 게시글 수정
	 * @param conn
	 * @param boardvo
	 * @return
	 * @throws SQLException
	 */
	public int updateBoard(BoardVO boardvo);
	
	/**
	 * 게시글 삭제
	 * @param conn
	 * @param boardno
	 * @return
	 * @throws SQLException
	 */
	public int deleteBoard(int boardno);
	
	/** 게시글 전체 출력
	 * 
	 * @param conn
	 * @return
	 * @throws SQLException
	 */
	public List<BoardVO> getall();
	
	/** 게시글번호로 검색
	 * 
	 * @param conn
	 * @param boardno
	 * @return
	 * @throws SQLException
	 */
	public BoardVO searchno(int boardno);
	
	/** 제목으로 게시물 검색
	 * 
	 * @param conn
	 * @param title
	 * @return
	 * @throws SQLException
	 */
	public List<BoardVO> searchboard(String title);
	
	/** 조회수
	 * 
	 * @param conn
	 * @param boardno
	 * @return
	 * @throws SQLException
	 */
	public int count(int boardno);
	
}
