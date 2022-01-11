package library.board.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.board.dao.AnswerDAO;
import library.board.domain.AnswerVO;
import library.board.service.AnswerService;

@Service
public class AnswerServiceImpl implements AnswerService {

	@Autowired
	private AnswerDAO answerDAO;

	// 답변 본문
	@Override
	public AnswerVO answerContent(long answerNo) {
		return answerDAO.answerContent(answerNo);
	}

	// 답변 조회수 증가
	@Override
	public void updateView(long answerNo) {
		answerDAO.updateView(answerNo);
	}

}
