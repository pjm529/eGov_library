package library.mylib.dao;

import library.member.domain.MemberVO;

public interface MyPageDAO {
	
	// 회원 정보 불러오기
	public MemberVO memberInfo(String userId);
	
	// 회원 정보 수정
	public void modifyMember(MemberVO member); 

	// 회원 PW 수정
	public void modifyPw(MemberVO member);
	
	// 회원 탈퇴
	public void secessionMember(String userId);
	
	// 탈퇴 회원 입력
	public void insertSecession(MemberVO member);
}
