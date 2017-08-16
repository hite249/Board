package kr.co.testproj.board01.service.impl;

import java.util.List;

import javax.annotation.Resource;

import kr.co.testproj.board01.service.BoardService;
import kr.co.testproj.board01.vo.BoardVO;

import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Resource(name = "boardServiceMapper")
	BoardServiceMapper boardServiceMapper;
	
	@Override
	public int getBoardTotalCount() {
 
		return boardServiceMapper.getBoardTotalCount();
	}
	
	@Override
	public String getBoardResult() {
		return boardServiceMapper.getBoardResult();
	}

	@Override
	public List<BoardVO> getBoardListResult(int page) {
		return boardServiceMapper.getBoardListResult(page);
	}

	

	@Override
	public BoardVO getBoard01View(int no) {
		return boardServiceMapper.getBoard01View(no);
	}

	@Override
	public int insertBoard01Item(BoardVO boardVO) {
		return boardServiceMapper.insertBoard01Item(boardVO);
	}

	@Override
	public int updateBoard01Item(BoardVO boardVO) {
		return boardServiceMapper.updateBoard01Item(boardVO);
	}

	@Override
	public int deleteBoard01Item(BoardVO boardVO) {
		 return boardServiceMapper.deleteBoard01Item(boardVO);
	}

}
