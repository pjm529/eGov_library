package library.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import library.board.domain.ArticleVO;
import library.board.service.ArticleService;
import library.common.page.Criteria;
import library.common.page.ViewPage;

@Controller
@RequestMapping("/board")
public class ArticleController {

	@Autowired
	private ArticleService articleService;

	// 분실물 찾기 게시글 목록
	@GetMapping("/articleList")
	public ModelAndView articleList(@ModelAttribute Criteria cri) {

		ModelAndView mav = new ModelAndView("/board/sub4/articleList.jsp");
		List<ArticleVO> articleList = articleService.articleList(cri);
		mav.addObject("articleList", articleList);

		int total = articleService.articleTotal(cri);
		mav.addObject("total", total);

		ViewPage vp = new ViewPage(cri, total);
		mav.addObject("page", vp);

		return mav;

	}

	// 게시글 등록 페이지
	@GetMapping("/articleInsertPage.do")
	public String goArticleInsert() {
		return "board/sub4/articleInsert.jsp";
	}

}
