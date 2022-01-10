package library.board.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.board.dao.ArticleDAO;
import library.board.domain.ArticleVO;
import library.common.page.Criteria;

@Repository
public class ArticleDAOImpl extends EgovAbstractMapper implements ArticleDAO {

	// 분실물 찾기 리스트
	@Override
	public List<ArticleVO> articleList(Criteria cri) {
		return selectList("Article.articleList", cri);
	}

	// 게시글 수
	@Override
	public int articleTotal(Criteria cri) {
		return selectOne("Article.articleTotal", cri);
	}

}
