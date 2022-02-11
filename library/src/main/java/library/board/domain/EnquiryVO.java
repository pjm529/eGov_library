package library.board.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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
	
	// 문의사항 수정일
	private Timestamp enquiryModifyDate;

	// 답변 목록
	private List<AnswerVO> answerList;
}
