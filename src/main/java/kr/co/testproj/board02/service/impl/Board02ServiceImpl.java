package kr.co.testproj.board02.service.impl;

import java.util.List;

import javax.annotation.Resource;

import kr.co.testproj.board02.service.Board02Service;
import kr.co.testproj.board02.vo.Board02VO;

import org.springframework.stereotype.Service;

@Service("board02Service")
public class Board02ServiceImpl  implements Board02Service{
	
	@Resource(name="board02Mapper")
	Board02Mapper board02Mapper;

	@Override
	public int getBoard02TotalCount() {
		return board02Mapper.getBoard02TotalCount();
	}

	@Override
	public String getBoard02Result() {
		
		return board02Mapper.getBoard02Result();
	}

	@Override
	public List<Board02VO> getBoard02ListResult(int page) {
		
		return board02Mapper.getBoard02ListResult(page);
	}

	@Override
	public Board02VO getBoard02View(int no) {

		return board02Mapper.getBoard02View(no);
	}

	@Override
	public int insertBoard02Item(Board02VO board02VO) {
		
		return board02Mapper.insertBoard02Item(board02VO);
	}

	@Override
	public int updateBoard02Item(Board02VO board02VO) {
		
		return board02Mapper.updateBoard02Item(board02VO);
	}

	@Override
	public int deleteBoard02Item(Board02VO board02VO) {
		// TODO Auto-generated method stub
		return board02Mapper.deleteBoard02Item(board02VO);
	}

}
