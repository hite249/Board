package kr.co.testproj.main.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.testproj.main.service.MainService;
import kr.co.testproj.main.vo.MainVO;

@Service("mainService")
public class MainServiceImpl implements MainService {

	@Resource(name = "mainMapper")
	MainMapper mainMapper;

	@Override
	public int getTotalCount() {
		return mainMapper.getTotalCount();
	}
	
	@Override
	public String getResult() {
		return mainMapper.getResult();
	}

	@Override
	public List<MainVO> getListResult(int page) {
		return mainMapper.getListResult(page);
	}

	@Override
	public MainVO getBoardView(int no) {
		return mainMapper.getBoardView(no);
	}

	@Override
	public int insertBoardItem(MainVO mainVO) {
		return mainMapper.insertBoardItem(mainVO);
	}

	@Override
	public int updateBoardItem(MainVO mainVO) {
		return mainMapper.updateBoardItem(mainVO);
	}

	@Override
	public int deleteBoardItem(MainVO mainVO) {
		return mainMapper.deleteBoardItem(mainVO);
	}

}
