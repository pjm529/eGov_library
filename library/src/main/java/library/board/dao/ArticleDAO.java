package library.board.dao;

import java.util.List;

import library.board.domain.ArticleVO;
import library.common.page.Criteria;

public interface ArticleDAO {

	// 분실물 찾기 리스트
	public List<ArticleVO> articleList(Criteria cri);
	
	// 게시글 수
	public int articleTotal(Criteria cri);
	
}
