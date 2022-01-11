package library.board.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class EnquiryVO {

	// 문의사항 번호
	private Long enquiryNo;

	// 문의사항 제목
	private String enquiryTitle;

	// 문의사항 내용
	private String enquiryContent;

	// 문의사항 작성자 ID
	private String writerId;

	// 문의사항 작성자명
	private String writerName;

	// 문의사항 조회수
	private int enquiryHits;

	// 문의사항 작성일
	private Timestamp enquiryRegDate;
	
	// 답변 목록
	private AnswerVO answerList;
}
