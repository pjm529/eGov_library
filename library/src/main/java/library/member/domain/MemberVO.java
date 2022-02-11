package library.member.domain;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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

}
