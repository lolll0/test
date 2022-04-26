package movie.dao;

import java.util.List;

import movie.vo.MovieVO;

public interface IMovieDao {
	
	public int insertMovie(MovieVO vo);
	
	// 영화정보 가져오기 update 다시해야함
	public List<MovieVO> selectImg();
	
//	public MovieVO selectImg(String movieName);
	
	public List<String> selectMovieName();
	
	// 영화 상세보기
	// update해야함 위에는 업데이트함
	public MovieVO DetailMovie(String movieImg);
}
