package library.search.domain;

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

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getLoan_no() {
		return loanNo;
	}

	public void setLoan_no(int loan_no) {
		this.loanNo = loan_no;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getBookAuthor() {
		return bookAuthor;
	}

	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}

	public String getBookIsbn() {
		return bookIsbn;
	}

	public void setBookIsbn(String bookIsbn) {
		this.bookIsbn = bookIsbn;
	}

	public String getBookCover() {
		return bookCover;
	}

	public void setBookCover(String bookCover) {
		this.bookCover = bookCover;
	}

	public String getBookPubDate() {
		return bookPubDate;
	}

	public void setBookPubDate(String bookPubDate) {
		this.bookPubDate = bookPubDate;
	}

	public String getBookPublisher() {
		return bookPublisher;
	}

	public void setBookPublisher(String bookPublisher) {
		this.bookPublisher = bookPublisher;
	}

	public String getLoanDate() {
		return loanDate;
	}

	public void setLoanDate(String loanDate) {
		this.loanDate = loanDate;
	}

	public String getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}

	public String getReturnPeriod() {
		return returnPeriod;
	}

	public void setReturnPeriod(String returnPeriod) {
		this.returnPeriod = returnPeriod;
	}

	public int getPriceStandard() {
		return priceStandard;
	}

	public void setPriceStandard(int priceStandard) {
		this.priceStandard = priceStandard;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getOverdueDate() {
		return overdueDate;
	}

	public void setOverdueDate(int overdueDate) {
		this.overdueDate = overdueDate;
	}

}
