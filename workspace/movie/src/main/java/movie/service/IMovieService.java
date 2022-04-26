package movie.service;

import java.util.List;
import java.util.Map;

import movie.vo.MovieVO;

public interface IMovieService {
	public int insertMovie(MovieVO vo);
	
	// 영화정보 가져오기 update 다시해야함
	public List<MovieVO> selectImg();
	
	
	public List<String> selectMovieName();
	
	///////
	public MovieVO DetailMovie(String movieImg);
}
