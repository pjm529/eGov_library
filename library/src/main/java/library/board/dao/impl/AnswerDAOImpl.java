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

	// 답변 수정
	@Override
	public void modifyAnswer(AnswerVO answer) {
		update("Answer.modifyAnswer", answer);
	}

	// 답글 삭제
	@Override
	public void deleteAnswer(long answerNo) {
		delete("Answer.deleteAnswer", answerNo);
	}

}
