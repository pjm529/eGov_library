package library.search.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BookVO {

	// 검색된 도서 수
	private int total;

	// 대출 중 도서 수
	private int count;

	// 대출 베스트 도서 총 대출 수
	private int totalCount;

	// 대출 번호
	private int loanNo;

	// 대출자 아이디
	private String userId;

	// 대출자 이메일
	private String userEmail;

	// 대출 도서 명
	private String bookTitle;

	// 대출 도서 저자
	private String bookAuthor;

	// 대출 도서 isbn
	private String bookIsbn;

	// 대출 도서 표지 링크
	private String bookCover;

	// 대출 도서 출간일
	private String bookPubDate;

	// 대출 도서 출판사
	private String bookPublisher;

	// 대출 일
	private String loanDate;

	// 반납 일
	private String returnDate;

	// 반납 예정 일
	private String returnPeriod;

	// 도서 가격(AladinAPI에서 받아올 때)
	private int priceStandard;

	// 도서
	private String description;

	// 연체일
	private int overdueDate;

	// 추천 도서 번호
	private int recNo;

}