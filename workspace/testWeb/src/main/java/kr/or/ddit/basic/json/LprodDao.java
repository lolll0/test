package kr.or.ddit.basic.json;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.util.DBUtil3;



public class LprodDao {
	private static LprodDao dao;
	
	private LprodDao() {
		
	}
	
	public static LprodDao getInstance() {
		if(dao == null) dao = new LprodDao();
		return dao;
	}
	
	public List<LprodVO> getLprodList() {
		List<LprodVO> list = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtil3.getConnection();
			String sql = "select * from lprod";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			list = new ArrayList<LprodVO>();
			while(rs.next()) {
				LprodVO lvo = new LprodVO();
				lvo.setLprod_gu(rs.getString("lprod_gu"));
				lvo.setLprod_nm(rs.getString("lprod_nm"));
				lvo.setLprod_id(rs.getInt("lprod_id"));
				
				list.add(lvo);
			}
			
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		} finally {
			
		}
		
		return list;
	}
}
