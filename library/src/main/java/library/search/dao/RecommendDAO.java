package library.search.dao;

import java.util.HashMap;
import java.util.List;

import library.common.domain.DateVO;
import library.search.domain.BookVO;

public interface RecommendDAO {
	
	// 추천 도서 리스트
	public List<BookVO> recommedList(HashMap<String, Object> map);
	
	// 추천 도서 권수
	public int getTotal(DateVO date);
	
	// 추천 도서 등록
	public void registBook(BookVO book);
	
	// 추천 도서 삭제
	public void deleteBook(int recNo);
	
	// 추천 도서 ISBN 조회
	public String selectIsbn(int recNo);
}
