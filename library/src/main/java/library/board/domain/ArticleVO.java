package library.board.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ArticleVO {

	// 분실물 찾기 게시글 번호
	private Long articleNo;
	
	// 게시글 제목
	private String articleTitle;
	
	// 게시글 내용
	private String articleContent;
	
	// 게시글 작성자 ID
	private String writerId;
	
	// 게시글 작성자명
	private String writerName;
	
	// 게시글 작성일
	private Timestamp articleRegDate;

	// 게시글 수정일
	private Timestamp articleModifyDate;
	
	// 게시글 조회수
	private int articleViews;

}
