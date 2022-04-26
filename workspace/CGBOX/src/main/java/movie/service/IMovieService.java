package movie.service;

import java.util.List;

import movie.vo.MovieVO;

/*import vo.MovieVO;*/

public interface IMovieService {
	
	public List<MovieVO> selectAll();
	
	public String selectNameByNo(String mno);
	
	//
	
	public int insertMovie(MovieVO vo);
	
	// 강현수
	public List<MovieVO> selectImg();
	
	public List<String> selectMovieName();
	
	public MovieVO DetailMovie(String movieImg);
	//
	
	public MovieVO selectAllMovieByNo(String mvo);

}
