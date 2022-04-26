package cgbox.pay.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import cgbox.vo.MovieInfoVO;
import cgbox.vo.ReserveVO;
import cgbox.vo.ScreenVO;
import cgbox.vo.SeatVO;
import cgbox.vo.TheaterVO;
import cgbox.vo.selectmconVO;

public interface IPayDao {

	public List<selectmconVO> selectmcon(int customerno) throws SQLException;
	
    public String checkproduct (HashMap<String,Integer> map) throws SQLException;
	
    public int updateproductcount(HashMap<String,Integer> map) throws SQLException;

  public int insertmcon (HashMap<String,Integer> map) throws SQLException;

  public List<Integer> checkno () throws SQLException;

  public int discountprice (int prodno) throws SQLException;
  
  public List<ReserveVO> selectreserve (int customerno) throws SQLException;
  

  //영화정보 한꺼번에 불러오기 
  public List<MovieInfoVO> minfo (int customerno) throws SQLException;
  
  public int updateTStatus (int ticketno) throws SQLException;

public int minusCon (HashMap<String,Integer>map )throws SQLException;

public String checkMemID (int customerno) throws SQLException;


public int zerocon(HashMap<String,Integer>map )throws SQLException;
public int zerodelete(HashMap<String,Integer>map) throws SQLException;

public List<MovieInfoVO> minfoNonmember(int ticketno) throws SQLException;

public int nonmemcusno(int ticketno) throws SQLException;

}
