package kr.co.testproj.board02.service;

import java.util.List;

import kr.co.testproj.board02.vo.Board02VO;

public interface Board02Service {
	int getBoard02TotalCount();
	String getBoard02Result();
	
	List<Board02VO> getBoard02ListResult(int page);
	Board02VO getBoard02View(int no);
	int insertBoard02Item(Board02VO board02VO);
	int updateBoard02Item(Board02VO board02VO);
	int deleteBoard02Item(Board02VO board02VO);

}
