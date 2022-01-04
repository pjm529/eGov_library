package library.member.dao;

import library.member.domain.MemberVO;

public interface SignUpDAO {

	// 중복 아이디 체크
	public String idCheck(String userId) throws Exception;
	
	// 중복 이메일 체크
	public String mailCheck(String userEmail) throws Exception;
	
	// 회원가입
	public void signUp(MemberVO member);
	
	// 권한 입력
	public void insertAuth(String userId);

}
