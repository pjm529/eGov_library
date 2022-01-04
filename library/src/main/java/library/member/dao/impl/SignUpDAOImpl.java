package library.member.dao.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.member.dao.SignUpDAO;
import library.member.domain.MemberVO;

@Repository
public class SignUpDAOImpl extends EgovAbstractMapper implements SignUpDAO {

	// 중복 아이디 체크
	@Override
	public String idCheck(String userId) throws Exception {
		return selectOne("SignUp.idCheck", userId);
	}

	// 중복 이메일 체크
	@Override
	public String mailCheck(String userEmail) throws Exception {
		return selectOne("SignUp.mailCheck", userEmail);
	}

	// 회원가입
	@Override
	public void signUp(MemberVO member) {
		insert("SignUp.signUp", member);
	}
	
}
