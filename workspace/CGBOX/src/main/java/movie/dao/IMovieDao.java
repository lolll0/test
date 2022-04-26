package movie.dao;

import java.sql.SQLException;
import java.util.List;

import movie.vo.MovieVO;

/*import vo.MovieVO;*/

public interface IMovieDao {
	
	public List<MovieVO> selectAll() throws SQLException;
	
	public String selectNameByNo(String mno) throws SQLException;
	
	// 강현수
	public int insertMovie(MovieVO vo);
	
	public List<MovieVO> selectImg();
		
	public List<String> selectMovieName();
	
	public MovieVO DetailMovie(String movieImg);
	//
	
	public MovieVO selectAllMovieByNo(String mvo) throws SQLException;
	
}
