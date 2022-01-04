package library.member.service;

import library.member.domain.MemberVO;

public interface SearchService {

	// ID 찾기
	public String searchId(MemberVO member);

	// PW 찾기
	public int searchPw(MemberVO member);
	
	// PW 초기화
	public void resetPw(MemberVO member);

}
