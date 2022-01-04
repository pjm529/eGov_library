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
	
	@Override
	public MemberVO memberInfo(String userId) {
		return myPageDAO.memberInfo(userId);
	}

	@Override
	public void modifyMember(MemberVO member) {
		myPageDAO.modifyMember(member);
	}

	@Override
	public void modifyPw(MemberVO member) {
		myPageDAO.modifyPw(member);
	}

	@Override
	public void secessionMember(MemberVO member) {
		
		// 회원탈퇴
		myPageDAO.secessionMember(member.getUserId());
		
		// 탈퇴회원 테이블 추가
		myPageDAO.insertSecession(member);
	}

}
