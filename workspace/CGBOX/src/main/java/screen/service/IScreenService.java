package screen.service;

import java.util.List;

import cgbox.vo.ScreenVO;

/*import vo.ScreenVO;*/

public interface IScreenService {
	
	public List<ScreenVO> selectScreenList(ScreenVO vo);
	
	public ScreenVO selectAllByno(int svo);
	
}
