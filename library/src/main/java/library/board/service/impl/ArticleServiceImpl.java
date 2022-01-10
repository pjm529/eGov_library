package library.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.board.dao.ArticleDAO;
import library.board.domain.ArticleVO;
import library.board.service.ArticleService;
import library.common.page.Criteria;

@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	private ArticleDAO articleDAO;

	// 분실물 찾기 리스트
	@Override
	public List<ArticleVO> articleList(Criteria cri) {
		return articleDAO.articleList(cri);
	}

	// 게시글 수
	@Override
	public int articleTotal(Criteria cri) {
		return articleDAO.articleTotal(cri);
	}

	// 게시글 등록
	@Override
	public void insertArticle(ArticleVO article) {
		articleDAO.insertArticle(article);
	}

	// 조회수 증가
	@Override
	public void articleViewsCount(int articleNo) {
		articleDAO.articleViewsCount(articleNo);
	}

	// 게시글 조회
	@Override
	public ArticleVO articleContent(int articleNo) {
		return articleDAO.articleContent(articleNo);
	}

	// 이전 글 조회
	@Override
	public ArticleVO articlePreContent(int articleNo) {
		return articleDAO.articlePreContent(articleNo);
	}

	// 다음 글 조회
	@Override
	public ArticleVO articleNextContent(int articleNo) {
		return articleDAO.articleNextContent(articleNo);
	}

	// 게시글 수정
	@Override
	public void articleModify(ArticleVO article) {
		articleDAO.articleModify(article);
	}

	// 게시글 삭제
	@Override
	public void deleteArticle(int articleNo) {
		
		// 게시글 삭제
		articleDAO.deleteArticle(articleNo);
		
		// 게시글 번호 정렬
		articleDAO.resetNo();
	}

}
