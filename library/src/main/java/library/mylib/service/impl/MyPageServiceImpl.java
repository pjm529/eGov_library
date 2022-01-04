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

}
