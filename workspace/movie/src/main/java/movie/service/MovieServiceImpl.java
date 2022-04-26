package movie.service;


import java.util.List;
import java.util.Map;

import movie.dao.IMovieDao;
import movie.dao.MovieDaoImpl;
import movie.vo.MovieVO;

public class MovieServiceImpl implements IMovieService{
	
	private IMovieDao dao;
	private static IMovieService service;
	
	private MovieServiceImpl() {
		dao = MovieDaoImpl.getInstance();
	}
	
	public static IMovieService getInstance() {
		if(service == null) service = new MovieServiceImpl();
		return service;
	}

	@Override
	public int insertMovie(MovieVO vo) {
		// TODO Auto-generated method stub
		return dao.insertMovie(vo);
	}

	@Override
	public List<String> selectMovieName() {
		// TODO Auto-generated method stub
		return dao.selectMovieName();
	}

	@Override
	public List<MovieVO> selectImg() {
		// TODO Auto-generated method stub
		return dao.selectImg();
	}

	@Override
	public MovieVO DetailMovie(String movieImg) {
		// TODO Auto-generated method stub
		return dao.DetailMovie(movieImg);
	}

	

	
	
}
