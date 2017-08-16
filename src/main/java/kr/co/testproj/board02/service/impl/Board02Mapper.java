package kr.co.testproj.board02.service.impl;

import java.util.List;

import kr.co.testproj.board02.vo.Board02VO;
import kr.co.testproj.util.annotation.Mapper;

@Mapper
public interface Board02Mapper {
	
	int getBoard02TotalCount();
	
	String getBoard02Result();
	
	List<Board02VO> getBoard02ListResult(int page);
	Board02VO getBoard02View(int no);
	int insertBoard02Item(Board02VO board02VO);
	int updateBoard02Item(Board02VO board02VO);
	int deleteBoard02Item(Board02VO board02VO);
	

}
