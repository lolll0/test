package cgbox.cart.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cgbox.cart.dao.CartDaoImpl;
import cgbox.cart.dao.ICartDao;
import cgbox.vo.CartProdVO;
import cgbox.vo.allcartVO;

public class CartServiceImpl implements ICartService {
		private static ICartService service;
	    private ICartDao dao;
	    
	    private CartServiceImpl() {
			dao = CartDaoImpl.getInstance();
		}
	    public static ICartService getInstance() {
	    	if(service ==null) {
	    		service = new CartServiceImpl();
	    	}
	    	return service;
	    }
	
	
	@Override
	public List<allcartVO> allcart(int customerno) {
		List<allcartVO>  list = null;       		
		       try {
				list = dao.allcart(customerno);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		       return list;
	}
	@Override
	public int insertcartno(int customerno) {
		  int cartno = 0;
		  try {
			cartno = dao.insertcartno(customerno);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return cartno;
	}
	@Override
	public String checkcart(int customerno)  {
		  String cartno = null;
		  try {
			cartno = dao.checkcart(customerno);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cartno;
	}
	@Override
	public int insertprod(CartProdVO cartprodVO) {
		       int count = 0;
		       try {
				count = (int) dao.insertprod(cartprodVO);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		       
		return count;
	}
	@Override
	public int cartnoselect(int customerno) {
		int cartno =0;
		try {
		cartno=	dao.cartnoselect(customerno);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cartno;
	}
	@Override
	public int updatecount(HashMap<String,Integer> map) {
		 int count = 0;
	       try {
			count = (int) dao.updatecount(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	@Override
	public String checkprod(HashMap<String, Integer> map) {
		 String prodno = null;
		  try {
			prodno = dao.checkprod(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prodno;
	}
	@Override
	public int plusone(HashMap<String, Integer> map) {
		int count = 0;
	       try {
			count = (int) dao.plusone(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	@Override
	public int selectdelete(HashMap<String, Integer> map) {
		int count = 0;
	       try {
			count = (int) dao.selectdelete(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	@Override
	public int updatestatus(HashMap<String, Integer> map) {
		int count = 0;
	       try {
			count = (int) dao.updatestatus(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	@Override
	public int updatestatusN(int customerno) {
		int count = 0;
	       try {
			count = (int) dao.updatestatusN(customerno);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	@Override
	public int cartsum(int customerno) {
		int count = 0;
	       try {
			count = (int)dao.cartsum(customerno);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	@Override
	public int sumreturn(int customerno) {
		int sum = 0;
	       try {
		sum = (int)dao.sumreturn(customerno);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sum;
		
	}
	@Override
	public int paySuccessRemove(HashMap<String, Integer> map) {
		int count = 0;
	       try {
			count = dao.paySuccessRemove(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return count;
	}
	@Override
	public int insertpaylist(HashMap<String, Integer> map) {
		int count = 0;
	       try {
			count = dao.insertpaylist(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return count;
	}

	
	
}
