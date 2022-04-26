package movie.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
/*import vo.MovieVO;*/
import movie.vo.MovieVO;

public class MovieDaoImpl implements IMovieDao {
	private SqlMapClient client; 
	private static IMovieDao dao;
	private MovieDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	public static IMovieDao getInstance() {
		if(dao == null) dao = new MovieDaoImpl();
		
		return dao;
	}
	
	@Override
	public List<MovieVO> selectAll() throws SQLException {
		return client.queryForList("movie.selectAll");
	}
	@Override
	public String selectNameByNo(String mno) throws SQLException {
		return (String) client.queryForObject("movie.selectNameByNo", mno);
	}
	
	// 강현수
	@Override
	public int insertMovie(MovieVO vo) {
		int check = 0;
		try {
			Object obj = client.insert("movie.insertMovie", vo);
			if(obj == null) check = 1;
		} catch (SQLException e) {
			check = 0;
			e.printStackTrace();
		}
		return check;
	}

	@Override
	public List<String> selectMovieName() {
		List<String> name = null;
		try {
			name = client.queryForList("movie.selectMovieName");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return name;
	}


	@Override
	public List<MovieVO> selectImg() {
		List<MovieVO> list = null; 
		try {
			list =  client.queryForList("movie.selectImg");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public MovieVO DetailMovie(String movieImg) {
		MovieVO vo = null;
		
		try {
			vo = (MovieVO) client.queryForList("movie.DetailMovie", movieImg);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}
	//
	
	@Override
	public MovieVO selectAllMovieByNo(String mvo) throws SQLException {
		return (MovieVO) client.queryForObject("movie.selectAllMovieByNo", mvo);
	}

}
