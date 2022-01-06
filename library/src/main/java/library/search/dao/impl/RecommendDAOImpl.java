package library.search.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.common.domain.DateVO;
import library.search.dao.RecommendDAO;
import library.search.domain.BookVO;

@Repository
public class RecommendDAOImpl extends EgovAbstractMapper implements RecommendDAO {

	// 추천 도서 리스트
	@Override
	public List<BookVO> recommedList(HashMap<String, Object> map) {
		return selectList("Recommend.recommendList", map);
	}

	@Override
	public int getTotal(DateVO date) {
		return selectOne("Recommend.getTotal", date);
	}

	// 추천 도서 등록
	@Override
	public void registBook(BookVO book) {
		insert("Recommend.registBook", book);
	}

}
