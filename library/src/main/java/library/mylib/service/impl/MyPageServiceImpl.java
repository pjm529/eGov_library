package library.mylib.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.member.domain.MemberVO;
import library.mylib.dao.MyPageDAO;
import library.mylib.service.MyPageService;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDAO myPageDAO;

	// 회원 정보 조회
	@Override
	public MemberVO memberInfo(String userId) {
		return myPageDAO.memberInfo(userId);
	}

	// 회원 정보 수정
	@Override
	public void modifyMember(MemberVO member) {
		myPageDAO.modifyMember(member);
	}

	// 회원 PW 수정
	@Override
	public void modifyPw(MemberVO member) {
		myPageDAO.modifyPw(member);
	}

	
	// 회원탈퇴
	@Override
	public void secessionMember(MemberVO member) {
		
		// 회원탈퇴
		myPageDAO.secessionMember(member.getUserId());
		
		// 탈퇴회원 테이블 추가
		myPageDAO.insertSecession(member);
	}

}
