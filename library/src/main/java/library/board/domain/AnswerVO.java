package library.board.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AnswerVO {

	// 답변 번호
	private Long answerNo;

	// 문의사항 번호
	private Long enquiryNo;

	// 답변 제목
	private String answerTitle;

	// 답변 내용
	private String answerContent;

	// 답변 작성자 ID
	private String aWriterId;

	// 답변 작성자명
	private String aWriterName;

	// 답변 조회수
	private int answerHits;

	// 답변 작성일
	private Timestamp answerRegDate;

	// 문읭사항 게시글 작성자 ID
	private String writerId;

}
