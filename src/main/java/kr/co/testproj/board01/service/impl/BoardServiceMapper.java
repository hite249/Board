package kr.co.testproj.board01.service.impl;

import java.util.List;

import kr.co.testproj.board01.vo.BoardVO;
import kr.co.testproj.util.annotation.Mapper;
@Mapper
public interface BoardServiceMapper {
	String getBoardResult();
	
	int getBoardTotalCount();
	
	List<BoardVO> getBoardListResult(int page);
	BoardVO getBoard01View(int no);
	int insertBoard01Item(BoardVO boardVO);
	int updateBoard01Item(BoardVO boardVO);
	int deleteBoard01Item(BoardVO boardVO);

}
