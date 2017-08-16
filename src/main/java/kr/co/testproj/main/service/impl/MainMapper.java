package kr.co.testproj.main.service.impl;

import java.util.List;
import java.util.Map;

import kr.co.testproj.main.vo.MainVO;
import kr.co.testproj.util.annotation.Mapper;

@Mapper
public interface MainMapper {

	int getTotalCount();
	
	String getResult();
	
	List<MainVO> getListResult(int page);
	MainVO getBoardView(int no);
	int insertBoardItem(MainVO mainVO);
	int updateBoardItem(MainVO mainVO);
	int deleteBoardItem(MainVO mainVO);
}
