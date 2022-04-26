package cgbox.cart.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cgbox.vo.CartProdVO;
import cgbox.vo.allcartVO;

public interface ICartDao {

	//cartView.jsp에 장바구니상품테이블에 있는 것을 가져오는 메서드
	public List<allcartVO> allcart(int customerno) throws SQLException;

	public String checkcart (int customerno) throws SQLException;
	
	public int insertcartno(int customerno) throws SQLException;
	public int cartnoselect (int customerno) throws SQLException;
 
	
	public int insertprod (CartProdVO cartprodVO) throws SQLException;
	
	public int updatecount(HashMap<String,Integer> map) throws SQLException;
	public int plusone(HashMap<String,Integer> map) throws SQLException;
	
	public String checkprod (HashMap<String,Integer> map) throws SQLException;

    public int selectdelete(HashMap<String,Integer> map) throws SQLException;

    public int updatestatus(HashMap<String,Integer> map) throws SQLException;
    public int updatestatusN(int customerno) throws SQLException;

    public int cartsum(int customerno) throws SQLException;

    public int sumreturn(int customerno)throws SQLException;
    
    public int paySuccessRemove(HashMap<String,Integer> map)throws SQLException;
    
    public int insertpaylist(HashMap<String,Integer> map) throws SQLException;
    
    
}
