package kr.or.ddit.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.member.vo.MymemberVO;
import kr.or.ddit.util.DBUtil3;

public class MymemberDao {
	private static MymemberDao dao;
	
	private MymemberDao() {
		// TODO Auto-generated constructor stub
	}
	
	public static MymemberDao getInstance() {
		if(dao == null)dao = new MymemberDao();
		return dao;
	}
	
	public List<MymemberVO> getMemList(){
		List<MymemberVO> list = null;
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement psmtm = null;
		
		try {
			conn = DBUtil3.getConnection();
			String sql = "select * from mymember";
			rs = psmtm.executeQuery();
			list = new ArrayList<MymemberVO>();
			while(rs.next()) {
				MymemberVO vo = new MymemberVO();
				vo.setMem_addr(rs.getString("mem_addr"));
				vo.setMem_id(rs.getString("mem_id"));
				vo.setMem_name(rs.getString("mem_name"));
				vo.setMem_pass(rs.getString("mem_pass"));
				vo.setMem_photo(rs.getString("mem_photo"));
				vo.setMem_tel(rs.getString("mem_tel"));
				
				list.add(vo);
			}
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		
		
		return list;
		
	}
	
}
