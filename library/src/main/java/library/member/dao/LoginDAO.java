package library.member.dao;

import library.member.domain.MemberVO;

public interface LoginDAO {

	// 로그인
	public MemberVO login(String userId);

}
