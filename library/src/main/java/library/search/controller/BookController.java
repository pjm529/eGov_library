package library.search.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import library.common.api.AladinApi;
import library.common.page.Criteria;
import library.common.page.ViewPage;
import library.search.domain.BookVO;

@Controller
@RequestMapping("/search")
public class BookController {

	@Autowired
	private AladinApi api;

	// 도서 검색 페이지
	@GetMapping("/book.do")
	public ModelAndView book(@ModelAttribute Criteria cri) {

		ModelAndView mav = new ModelAndView("search/sub1/book.jsp");

		List<BookVO> bookList = new ArrayList<BookVO>();

		// 검색어와 검색타입이 Null이 아닐 때 실행
		if (cri.getKeyword() != null && cri.getType() != null && cri.getKeyword() != "") {

			System.out.println("옵션 : " + cri.getType() + ", 검색 키 : " + cri.getKeyword() + ", 페이지 : " + cri.getPage());

			try {

				// api를 통해 검색어를 입력해 책 정보를 받아옴
				bookList = api.search(cri.getKeyword(), cri.getType(), cri.getPage(), cri.getAmount());

				// 검색 된 내용이 null이 아닐 때 수행
				if (!bookList.isEmpty()) {

					// 검색된 자료의 total을 가져옴
					mav.addObject("total", bookList.get(0).getTotal());

					// 페이징 처리위한 함수
					ViewPage page = new ViewPage(cri, bookList.get(0).getTotal());
					mav.addObject("page", page);

				}
			} catch (org.json.simple.parser.ParseException e) {
				e.printStackTrace();
			}
		}
		
		mav.addObject("cri", cri);
		mav.addObject("list", bookList);

		return mav;
	}
}
