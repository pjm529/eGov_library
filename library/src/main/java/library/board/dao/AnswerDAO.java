package library.board.dao;

import library.board.domain.AnswerVO;

public interface AnswerDAO {
	
	// 답변 본문
	public AnswerVO answerContent(long answerNo);
	
	// 답변 조회수 증가
	public void updateView(long answerNo);
	
	// 답변 작성
	public void insertAnswer(AnswerVO answer);
	
	// 답변 수정
	public void modifyAnswer(AnswerVO answer);
	
	// 답글 삭제
	public void deleteAnswer(long answerNo);
}


