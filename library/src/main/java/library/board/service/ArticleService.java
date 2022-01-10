package library.board.service;

import java.util.List;

import library.board.domain.ArticleVO;
import library.common.page.Criteria;

public interface ArticleService {

	// 분실물 찾기 리스트
	public List<ArticleVO> articleList(Criteria cri);

	// 게시글 수
	public int articleTotal(Criteria cri);

	// 게시글 등록
	public void insertArticle(ArticleVO article);
}
