package library.member.service;

import library.member.domain.MemberVO;

public interface LoginService {
	
	public MemberVO login(String userId);

}
