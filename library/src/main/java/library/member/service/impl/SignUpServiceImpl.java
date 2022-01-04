package library.member.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.member.dao.SignUpDAO;
import library.member.domain.MemberVO;
import library.member.service.SignUpService;

@Service
public class SignUpServiceImpl implements SignUpService {

	@Autowired
	private SignUpDAO signUpDAO;
	
	// 중복 아이디 체크
	@Override
	public String idCheck(String userId) throws Exception {
		return signUpDAO.idCheck(userId);
	}

	// 중복 이메일 체크
	@Override
	public String mailCheck(String userEmail) throws Exception {
		return signUpDAO.mailCheck(userEmail);
	}

	// 회원가입
	@Override
	public void signUp(MemberVO member) {
		
		// 회원 정보 입력
		signUpDAO.signUp(member);
		
		// 권한 입력
		signUpDAO.insertAuth(member.getUserId());
	}
}
