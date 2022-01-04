package library.member.service;

import library.member.domain.MemberVO;

public interface SearchService {

	public String searchId(MemberVO member);

	public int searchPw(MemberVO member);
	
	public void resetPw(MemberVO member);

}
