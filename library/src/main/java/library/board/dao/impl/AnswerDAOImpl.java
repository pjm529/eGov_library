package library.board.dao.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.board.dao.AnswerDAO;
import library.board.domain.AnswerVO;

@Repository
public class AnswerDAOImpl extends EgovAbstractMapper implements AnswerDAO {

	// 답변 본문
	@Override
	public AnswerVO answerContent(long answerNo) {
		return selectOne("Answer.answerContent", answerNo);
	}

	// 답변 조회수 증가
	@Override
	public void updateView(long answerNo) {
		update("Answer.updateView", answerNo);
	}

	// 답변작성
	@Override
	public void insertAnswer(AnswerVO answer) {
		insert("Answer.insertAnswer", answer);
	}

}
