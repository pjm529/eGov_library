package library.search.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.common.domain.DateVO;
import library.common.page.Criteria;
import library.search.dao.RecommendDAO;
import library.search.domain.BookVO;
import library.search.service.RecommendService;

@Service
public class RecommendServiceImpl implements RecommendService {

	@Autowired
	private RecommendDAO recommendDAO;

	// 추천 도서 리스트
	@Override
	public List<BookVO> recommedList(Criteria cri, DateVO date) {

		HashMap<String, Object> map = new HashMap<>();

		map.put("cri", cri);
		map.put("date", date);

		return recommendDAO.recommedList(map);
	}

	// 추천 도서 권수
	@Override
	public int getTotal(DateVO date) {
		return recommendDAO.getTotal(date);
	}

	// 추천 도서 등록
	@Override
	public void registBook(BookVO book) {
		recommendDAO.registBook(book);
	}

	// 추천 도서 삭제
	@Override
	public void deleteBook(int recNo) {
		recommendDAO.deleteBook(recNo);
	}

}
