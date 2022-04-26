package movie.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import movie.vo.MovieVO;


public class MovieDaoImpl implements IMovieDao{
	
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
	
	
	
	/////////////////////////////
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

	

	
}
