package library.mylib.domain;

import lombok.Data;

@Data
public class HopeVO {
	
	// 희망 도서 번호
	private int hopeNo;

	// 희망 도서 신청자 아이디
	private String userId;

	// 희망 도서 명
	private String bookTitle;

	// 희망 도서 저자
	private String bookAuthor;

	// 희망 도서 isbn
	private String bookIsbn;

	// 희망 도서 출간일
	private String bookPubDate;

	// 희망 도서 출판사
	private String bookPublisher;

	// 희망 도서 가격
	private String bookPrice;

	// 비고
	private String note;

	// 희망 도서 상태
	private String hopeStatus;

	// 취소 사유
	private String cancelReason;

	// 희망 도서 등록 일시
	private String hopeRegDate;

}
