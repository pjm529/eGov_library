package library.member.dao;

import library.member.domain.MemberVO;

public interface LoginDAO {

	public MemberVO login(String userId);

}
