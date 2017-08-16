package kr.co.testproj.board02.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import kr.co.testproj.board02.service.Board02Service;
import kr.co.testproj.board02.vo.Board02VO;
import kr.co.testproj.main.vo.MainVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Board02Controller {
	@Resource(name = "board02Service")
	private Board02Service board02Service;
	
	@RequestMapping(value="/board02/board.do")
	public String main(@RequestParam(value="page",required=false, defaultValue="1") int page, Model model) {
		int board02TotalCount = board02Service.getBoard02TotalCount();
		
		int board02FirstPage = 1, begin, end;
		int board02LastPage = board02TotalCount/(10+1)+1;
		int board02PrevPage = (int)((page-1)/10)*10;
		if(board02PrevPage<1) board02PrevPage=1;
		int board02NextPage = ((int)(((page-1)/10)+1)*10+1);
		if(board02NextPage >board02LastPage) board02NextPage = board02LastPage;
		
		begin = (int)((page-1)/10)*10+1;
		end = begin+9;
		if(end>board02LastPage) end = board02LastPage;
		
		model.addAttribute("board02Result",board02Service.getBoard02Result());
		model.addAttribute("board02List", board02Service.getBoard02ListResult(page));
		model.addAttribute("board02FirstPage", board02FirstPage);
		model.addAttribute("board02PrevPage", board02PrevPage);
		model.addAttribute("board02NextPage", board02NextPage);
		model.addAttribute("board02LastPage", board02LastPage);
		model.addAttribute("begin", begin);
		model.addAttribute("end", end);
		model.addAttribute("board02TotalCount", board02TotalCount);
		
		return "/board02/board";
	}
	
	@RequestMapping(value ="/board02/view.do")
	public String view(@RequestParam(value="no") int no, Model model){
		model.addAttribute("item", board02Service.getBoard02View(no));
		return "/board02/view";
	}
	@RequestMapping(value = "/board02/modify.do")
	public String modify(@RequestParam(value="no") int no, Model model) {
		model.addAttribute("item", board02Service.getBoard02View(no));
		return "/board02/modify";
	}
	
	@RequestMapping(value = "/board02/update.do")
	public String update(Board02VO board02VO, Model model) {
		int result = board02Service.updateBoard02Item(board02VO);
		return "redirect://board02/view.do?no="+board02VO.getNo();
	}
	
	@RequestMapping(value = "/board02/delete.do")
	public String delete(Board02VO board02VO, Model model) {
		int result = board02Service.deleteBoard02Item(board02VO);
		return "redirect://board02/board.do";
	}
	
	
	
	@RequestMapping(value = "/board02/ajax.do")
	public String ajax(Model model) {
		return "/board02/ajax";
	}
	
	@RequestMapping(value = "/board02/data/boardList.do")
	public @ResponseBody Map<String, Object> boardList(@RequestBody int page) throws Exception {
		Thread.sleep(500);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("board02TotalCount", board02Service.getBoard02TotalCount());
		result.put("board02List", board02Service.getBoard02ListResult(page));
		return result;
	}
}


