package mtheater.dao;

import java.sql.SQLException;
import java.util.List;

import vo.MTheaterVO;

public interface IMTheaterDao {
	
	public List<MTheaterVO> selectAll() throws SQLException;
	
	public MTheaterVO selectAllByName(String name) throws SQLException;
	
	public String selectNameByNo(int mtno) throws SQLException;

}
