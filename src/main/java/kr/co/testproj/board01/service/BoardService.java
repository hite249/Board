package kr.co.testproj.board01.service;

import java.util.List;

import kr.co.testproj.board01.vo.BoardVO;



public interface BoardService {
	
	String getBoardResult();
	int getBoardTotalCount();
	
	List<BoardVO> getBoardListResult(int page);
	BoardVO getBoard01View(int no);
	int insertBoard01Item(BoardVO boardVO);
	int updateBoard01Item(BoardVO boardVO);
	int deleteBoard01Item(BoardVO boardVO);

}
