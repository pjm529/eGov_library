package library.board.dao;

import java.util.List;

import library.board.domain.ArticleVO;
import library.common.page.Criteria;

public interface ArticleDAO {

	// 분실물 찾기 리스트
	public List<ArticleVO> articleList(Criteria cri);
	
	// 게시글 수
	public int articleTotal(Criteria cri);
	
	// 게시글 등록
	public void insertArticle(ArticleVO article);
	
	// 조회수 증가
	public void articleViewsCount(int articleNo);
	
	// 게시글 조회
	public ArticleVO articleContent(int articleNo);
	
	// 이전글 조회
	public ArticleVO articlePreContent(int articleNo);

	// 다음글 조회
	public ArticleVO articleNextContent(int articleNo);
	
	// 게시글 수정
	public void articleModify(ArticleVO article);
	
	// 게시글 삭제
	public void deleteArticle(int articleNo);
}
