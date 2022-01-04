package library.member.service;

import library.member.domain.MemberVO;

public interface SignUpService {

	// 중복 아이디 체크
	public int idCheck(String userId) throws Exception;

	// 중복 이메일 체크
	public int mailCheck(String userEmail) throws Exception;

	// 회원가입
	public void signUp(MemberVO member);
}
