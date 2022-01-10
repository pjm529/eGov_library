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

}
