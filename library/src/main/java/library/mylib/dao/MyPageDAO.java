package library.mylib.dao;

import library.member.domain.MemberVO;

public interface MyPageDAO {
	
	public MemberVO memberInfo(String userId);

}
