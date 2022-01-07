package library.member.domain;

import java.util.List;

public class MemberVO {

	// 회원 id
	private String userId;

	// 회원 비밀번호
	private String userPw;

	// 회원 이름
	private String userName;

	// 회원 생년월일
	private String userBirth;

	// 회원 전화번호
	private String userTel;

	// 회원 이메일
	private String userEmail;

	// 회원 우편번호
	private String userZip;

	// 회원 주소
	private String userAddress;

	// 회원 상세주소
	private String userAddressDetail;

	// 회원 대출가능 도서 수
	private int userAbleLoan;

	// 회원 대출 중 도서 수
	private int userBookCount;

	// 회원 대출불가 일 수
	private String userOverdueDate;

	// 회원가입일
	private String userRegDate;

	// 회원 권한 여부
	private boolean enabled;

	// 회원 권한 리스트
	private List<MemberAuthVO> authList;

	// 회원 대출 총 도서수를 위한 count
	private int count;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserZip() {
		return userZip;
	}

	public void setUserZip(String userZip) {
		this.userZip = userZip;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserAddressDetail() {
		return userAddressDetail;
	}

	public void setUserAddressDetail(String userAddressDetail) {
		this.userAddressDetail = userAddressDetail;
	}

	public int getUserAbleLoan() {
		return userAbleLoan;
	}

	public void setUserAbleLoan(int userAbleLoan) {
		this.userAbleLoan = userAbleLoan;
	}

	public int getUserBookCount() {
		return userBookCount;
	}

	public void setUserBookCount(int userBookCount) {
		this.userBookCount = userBookCount;
	}

	public String getUserOverdueDate() {
		return userOverdueDate;
	}

	public void setUserOverdueDate(String userOverdueDate) {
		this.userOverdueDate = userOverdueDate;
	}

	public String getUserRegDate() {
		return userRegDate;
	}

	public void setUserRegDate(String userRegDate) {
		this.userRegDate = userRegDate;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public List<MemberAuthVO> getAuthList() {
		return authList;
	}

	public void setAuthList(List<MemberAuthVO> authList) {
		this.authList = authList;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

}
