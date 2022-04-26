package seat.service;

import java.util.List;

import cgbox.vo.SeatVO;

/*import vo.SeatVO;*/

public interface ISeatService {
	
	public int selectSeatNo(SeatVO vo);
	public SeatVO selectSeatByNo(int sno);
	public List<SeatVO> selectAllBytno(int tno);
}
