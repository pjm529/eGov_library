package library.mylib.dao;

import library.member.domain.MemberVO;

public interface MyPageDAO {
	
	public MemberVO memberInfo(String userId);
	
	public void modifyMember(MemberVO member); 

	public void modifyPw(MemberVO member);
	
	public void secessionMember(String userId);
	
	public void insertSecession(MemberVO member);
}
