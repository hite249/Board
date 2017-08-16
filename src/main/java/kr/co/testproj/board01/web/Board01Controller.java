package kr.co.testproj.board01.web;

import javax.annotation.Resource;

import kr.co.testproj.board01.service.BoardService;
import kr.co.testproj.board01.vo.BoardVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Board01Controller {
	
	@Resource(name = "boardService")
	private BoardService boardService;

	@RequestMapping(value = "/board01/board.do")
	public String main(@RequestParam(value="page",required=false,defaultValue="1") int page, Model model) {
		
		int totalCount1 = boardService.getBoardTotalCount();
		
		int firstBPage = 1, beginB, endB;
		int lastBPage = totalCount1/(10+1)+1;
		int prevBPage = (int)((page-1)/10)*10;
		if( prevBPage < 1 ) prevBPage = 1;
		int nextBPage = ((int)(((page-1)/10)+1)*10+1);
		if( nextBPage > lastBPage ) nextBPage = lastBPage;

		beginB = (int)((page-1)/10)*10+1;
		endB = beginB+9;
		if( endB > lastBPage ) endB = lastBPage;
		
		model.addAttribute("result", boardService.getBoardResult());
		
		model.addAttribute("listB", boardService.getBoardListResult(page));
		model.addAttribute("firstBPage", firstBPage);
		model.addAttribute("prevBPage", prevBPage);
		model.addAttribute("nextBPage", nextBPage);
		model.addAttribute("lastBPage", lastBPage);
		model.addAttribute("beginB", beginB);
		model.addAttribute("endB", endB);
		model.addAttribute("totalCount1", totalCount1);
		
		return "/board01/board";
		
	}

	@RequestMapping(value = "/board01/view.do")
	public String view(@RequestParam(value="no") int no, Model model) {
		model.addAttribute("item", boardService.getBoard01View(no));
		return "/board01/view";
	
	}
	@RequestMapping(value = "/board01/modify.do")
	public String modify(@RequestParam(value="no") int no, Model model) {
		model.addAttribute("item", boardService.getBoard01View(no));
		return "/board01/modify";
	}
	
	@RequestMapping(value = "/board01/update.do")
	public String update(BoardVO boardVO, Model model) {
		int result = boardService.updateBoard01Item(boardVO);
		return "redirect://board01/view.do?no="+boardVO.getNo();
	}
	
	@RequestMapping(value = "/board01/delete.do")
	public String delete(BoardVO boardVO, Model model) {
		int result = boardService.deleteBoard01Item(boardVO);
		return "redirect://board01/board.do";
	}
}


