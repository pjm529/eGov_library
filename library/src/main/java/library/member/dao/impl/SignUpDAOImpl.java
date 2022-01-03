package library.member.dao.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.member.dao.SignUpDAO;

@Repository
public class SignUpDAOImpl extends EgovAbstractMapper implements SignUpDAO {

	@Override
	public int idCheck(String userId) throws Exception {
		return selectOne("SignUp.idCheck", userId);
	}
	
}
