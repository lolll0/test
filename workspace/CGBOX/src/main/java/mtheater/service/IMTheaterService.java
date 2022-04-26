package mtheater.service;

import java.util.List;

import vo.MTheaterVO;

public interface IMTheaterService {
	
	public List<MTheaterVO> selectAll();
	
	public MTheaterVO selectAllByName(String name);
	
	public String selectNameByNo(int mhno);
	
}
