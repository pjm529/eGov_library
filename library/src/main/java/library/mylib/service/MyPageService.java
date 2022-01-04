package library.mylib.service;

import library.member.domain.MemberVO;

public interface MyPageService {

	// 회원 정보 불러오기
	public MemberVO memberInfo(String userId);

	// 회원 정보 수정
	public void modifyMember(MemberVO member);

	// 회원 PW 수정
	public void modifyPw(MemberVO member);

	// 회원 탈퇴
	public void secessionMember(MemberVO member);
}
