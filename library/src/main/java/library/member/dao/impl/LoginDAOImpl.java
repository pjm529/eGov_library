package library.member.dao.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.member.dao.LoginDAO;
import library.member.domain.MemberVO;

@Repository
public class LoginDAOImpl extends EgovAbstractMapper implements LoginDAO {

	@Override
	public MemberVO login(String userId) {
		return selectOne("Login.login", userId);
	}

}
