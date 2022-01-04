package library.member.dao;

import library.member.domain.MemberVO;

public interface SearchDAO {
	
	public String searchId(MemberVO member);

	public int searchPw(MemberVO member);
	
	public void resetPw(MemberVO member);
}
