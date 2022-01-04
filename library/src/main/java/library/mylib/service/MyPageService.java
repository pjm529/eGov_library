package library.mylib.service;

import library.member.domain.MemberVO;

public interface MyPageService {
	
	public MemberVO memberInfo(String userId);

	public void modifyMember(MemberVO member); 

	public void modifyPw(MemberVO member);
}
