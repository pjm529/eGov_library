package library.board.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import library.common.page.Criteria;

@Controller
@RequestMapping("/board")
public class ArticleController {

	@GetMapping("/articleList")
	public String articleList() {

		return "board/sub4/articleList.jsp";

	}

}
