package kr.or.ddit.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.board.vo.BoardVO;

public class BoardDaoImpl implements IBoardDao {
	
	private static BoardDaoImpl dao;
	
	private BoardDaoImpl() {
		
	}
	
	public static BoardDaoImpl getInstance() {
		if(dao == null) dao = new BoardDaoImpl();
		
		return dao;
	}
	
	@Override
	public int insertBoard(Connection conn, BoardVO boardvo) throws SQLException {
		String sql = "insert into jdbc_board(board_no, board_title, board_writer, board_date, board_cnt, board_content)"
				+ " values(board_seq.nextval,?,?,sysdate,0,?)";
		// board_no => 자동증가, board_cnt => 조회수
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, boardvo.getBoard_title());
		pstmt.setString(2, boardvo.getBoard_writer());
		pstmt.setString(3, boardvo.getBoard_content());
		
		int cnt = pstmt.executeUpdate();
		
		if(pstmt!=null) pstmt.close();
		return cnt;
	}
	
	// 제목, 내용 수정
	@Override
	public int updateBoard(Connection conn, BoardVO boardvo) throws SQLException {
		String sql = "update jdbc_board set board_title = ?, board_date = sysdate, "
				+ " board_content = ? where board_no = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, boardvo.getBoard_title());
		pstmt.setString(2, boardvo.getBoard_content());
		pstmt.setInt(3, boardvo.getBoard_no());
		
		int cnt = pstmt.executeUpdate();
		
		if(pstmt!=null) pstmt.close();
		
		return cnt;
	}

	@Override
	public int deleteBoard(Connection conn, int boardno) throws SQLException {
		String sql = "delete from jdbc_board where board_no = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, boardno);
		
		int cnt = pstmt.executeUpdate();
		
		if(pstmt!=null) pstmt.close();
		
		return cnt;
	}
	
	// 게시판 전체 내용
	@Override
	public List<BoardVO> getall(Connection conn) throws SQLException {
		
		String sql = "select board_no, board_title, board_writer,"
					+ " to_char(board_date, 'YYYY-MM-DD') board_date, board_cnt, board_content "
					+ " from jdbc_board"
					+ " order by board_no desc";
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		
		List<BoardVO> list = new ArrayList<BoardVO>();
		
		
		while(rs.next()) {
			BoardVO boardvo = new BoardVO();
			
			boardvo.setBoard_no(rs.getInt("board_no"));
			boardvo.setBoard_title(rs.getString("board_title"));
			boardvo.setBoard_writer(rs.getString("board_writer"));
			boardvo.setBoard_date(rs.getString("board_date"));
			boardvo.setBoard_cnt(rs.getInt("board_cnt"));
			boardvo.setBoard_content(rs.getString("board_content"));
			
			list.add(boardvo);
		}
		
		if(rs!=null) rs.close();
		if(stmt!=null) stmt.close();
		
		return list;
	}

	

	
	@Override
	public BoardVO searchno(Connection conn, int boardno) throws SQLException {
		String sql = "select board_no, board_title, board_writer,"
				+ " to_char(board_date, 'YYYY-MM-DD') board_date, board_cnt, board_content "
				+ " from jdbc_board where board_no = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, boardno);
		
		ResultSet rs = pstmt.executeQuery();
		
		BoardVO boardvo = null;
		
		if(rs.next()) {
			boardvo = new BoardVO();
			boardvo.setBoard_no(rs.getInt("board_no"));
			boardvo.setBoard_title(rs.getString("board_title"));
			boardvo.setBoard_writer(rs.getString("board_writer"));
			boardvo.setBoard_date(rs.getString("board_date"));
			boardvo.setBoard_cnt(rs.getInt("board_cnt"));
			boardvo.setBoard_content(rs.getString("board_content"));
		}
		
		if(pstmt!=null)pstmt.close();
		if(rs!=null)rs.close();
		
		return boardvo;
	}

	@Override
	public List<BoardVO> searchboard(Connection conn, String title) throws SQLException {
			String sql = "select board_no, board_title, board_writer,"
					+ " to_char(board_date, 'YYYY-MM-DD') board_date, board_cnt, board_content "
					+ " from jdbc_board"
					+ " where board_title like '%' || ? || '%'"
					+ " order by board_no desc";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, title);
			
			ResultSet rs = pstmt.executeQuery();
			
			List<BoardVO> list = new ArrayList<BoardVO>();
			
		
			while(rs.next()) {
				BoardVO boardvo = new BoardVO();
				
				boardvo.setBoard_no(rs.getInt("board_no"));
				boardvo.setBoard_title(rs.getString("board_title"));
				boardvo.setBoard_writer(rs.getString("board_writer"));
				boardvo.setBoard_date(rs.getString("board_date"));
				boardvo.setBoard_cnt(rs.getInt("board_cnt"));
				boardvo.setBoard_content(rs.getString("board_content"));
				
				list.add(boardvo);
			}
		
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			
			return list;
	}
	// 조회수
	@Override
	public int count(Connection conn, int boardno) throws SQLException {
		String sql = "update jdbc_board set "
				+ " board_cnt = board_cnt + 1 "
				+ " where board_no = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, boardno);
		
		int cnt = pstmt.executeUpdate();
		
		if(pstmt!=null) pstmt.close();
		
		return cnt;
	}
	
	

}
