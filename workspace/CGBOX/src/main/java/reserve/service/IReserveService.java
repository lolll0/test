package reserve.service;

import java.util.List;

import cgbox.vo.ReserveVO;

/*import vo.ReserveVO;*/

public interface IReserveService {
	public void insertNew(ReserveVO vo);
	public List<ReserveVO> selectReserveByTicket(int tno);
	public List<ReserveVO> selectAllByscno(int scno);
}
