package kr.co.testproj.main.web;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import kr.co.testproj.main.service.MainService;
import kr.co.testproj.main.vo.MainVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	@Resource(name = "mainService")
	private MainService mainService;
	
	@RequestMapping(value = "/main/main.do")
	public String main(@ModelAttribute("mainVO") MainVO mainVO, Model model) {
		// 현재 페이지
		// 글 갯수
		int totalCount = mainService.getTotalCount();
		
		int firstPage = 1, begin, end;
		int lastPage = totalCount/(10+1)+1;
		int prevPage = (int)((mainVO.getPage()-1)/10)*10;
		if( prevPage < 1 ) prevPage = 1;
		int nextPage = ((int)(((mainVO.getPage()-1)/10)+1)*10+1);
		if( nextPage > lastPage ) nextPage = lastPage;

		begin = (int)((mainVO.getPage()-1)/10)*10+1;
		end = begin+9;
		if( end > lastPage ) end = lastPage;
		
		model.addAttribute("result", mainService.getResult());
		
		model.addAttribute("list", mainService.getListResult(mainVO));
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("prevPage", prevPage);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("begin", begin);
		model.addAttribute("end", end);
		model.addAttribute("totalCount", totalCount);
		return "/main/main";
	}
	
	@RequestMapping(value = "/main/view.do")
	public String view(@ModelAttribute("mainVO") MainVO mainVO, Model model) {
		model.addAttribute("item", mainService.getBoardView(mainVO));
		return "/main/view";
	}
	
	@RequestMapping(value = "/main/modify.do")
	public String modify(@ModelAttribute("mainVO") MainVO mainVO, Model model) {
		model.addAttribute("item", mainService.getBoardView(mainVO));
		return "/main/modify";
	}
	
	@RequestMapping(value = "/main/update.do")
	public String update(MainVO mainVO, Model model) {
		int result = mainService.updateBoardItem(mainVO);
		return "redirect://main/view.do?no="+mainVO.getNo();
	}
	
	@RequestMapping(value = "/main/delete.do")
	public String delete(MainVO mainVO, Model model) {
		int result = mainService.deleteBoardItem(mainVO);
		return "redirect://main/main.do";
	}
	
	@RequestMapping(value = "/main/ajax.do")
	public String ajax(Model model) {
		return "/main/ajax";
	}
	
	@RequestMapping(value = "/main/data/boardList.do")
	public @ResponseBody Map<String, Object> boardList(@RequestBody MainVO mainVO) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("totalCount", mainService.getTotalCount());
		result.put("boardList", mainService.getListResult(mainVO));
		return result;
	}
	
	@RequestMapping(value = "/main/map.do")
	public String map(Model model) {
		return "/main/map";
	}
}
