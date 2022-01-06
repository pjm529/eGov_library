package library.search.service;

import java.util.List;

import library.common.domain.DateVO;
import library.common.page.Criteria;
import library.search.domain.BookVO;

public interface RecommendService {

	// 추천 도서 리스트
	public List<BookVO> recommedList(Criteria cri, DateVO date);

	// 추천 도서 권수
	public int getTotal(DateVO date);

	// 추천 도서 등록
	public void registBook(BookVO book);

	// 추천 도서 삭제
	public void deleteBook(int recNo);

	// 추천 도서 ISBN 조회
	public String selectIsbn(int recNo);

}
