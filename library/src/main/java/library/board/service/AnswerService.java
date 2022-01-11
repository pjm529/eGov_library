package library.board.service;

import library.board.domain.AnswerVO;

public interface AnswerService {

	// 답변 본문
	public AnswerVO answerContent(long answerNo);

	// 답변 조회수 증가
	public void updateView(long answerNo);
}
