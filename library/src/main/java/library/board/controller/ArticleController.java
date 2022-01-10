package library.board.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

	// 게시글 등록
	@PostMapping("/articleInsert.do")
	public String articleInsert(@ModelAttribute ArticleVO article, Principal principal) {

		// 로그인 된 user_id 받아오기
		String userId = principal.getName();

		article.setWriterId(userId);

		System.out.println(article);

		articleService.insertArticle(article);

		return "redirect:/board/articleList.do";
	}

	// 게시글 본문
	@GetMapping("/articleContent.do")
	public ModelAndView articleContent(@ModelAttribute Criteria cri, @RequestParam int articleNo) {

		ModelAndView mav = new ModelAndView("board/sub4/articleContent.jsp");

		// 조회수 증가
		articleService.articleViewsCount(articleNo);

		// 게시글 조회
		ArticleVO article = articleService.articleContent(articleNo);
		mav.addObject("article", article);

		// 게시물 상세보기 이전글, 다음글
		ArticleVO articlePre = articleService.articlePreContent(articleNo);
		mav.addObject("articlePre", articlePre);

		ArticleVO articleNext = articleService.articleNextContent(articleNo);
		mav.addObject("articleNext", articleNext);

		mav.addObject("cri", cri);

		return mav;

	}

	// 게시글 수정 페이지
	@GetMapping("/articleModifyPage.do")
	public ModelAndView articleModifyPage(@ModelAttribute Criteria cri, @RequestParam int articleNo) {

		ModelAndView mav = new ModelAndView("board/sub4/articleModify.jsp");

		// 게시글 조회
		ArticleVO article = articleService.articleContent(articleNo);
		mav.addObject("article", article);

		mav.addObject("cri", cri);

		return mav;

	}

	// 게시글 수정
	@PostMapping("/articleModify.do")
	public String articleModify(@ModelAttribute ArticleVO article, @ModelAttribute Criteria cri, Principal principal) {

		String userId = principal.getName();
		article.setWriterId(userId);
		
		String keyword;
		int amount = cri.getAmount();
		int page = cri.getPage();
		String type = cri.getType();
		long articleNo = article.getArticleNo();

		try {
			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "redirect:/board/articleList.do";
		}

		articleService.articleModify(article);

		return "redirect:/board/articleContent.do?page=" + page + "&amount=" + amount + "&type=" + type
				+ "&keyword=" + keyword + "&articleNo=" + articleNo; // 리다이렉트할때는 위에 매핑주소를 따라간다.
	}
}
