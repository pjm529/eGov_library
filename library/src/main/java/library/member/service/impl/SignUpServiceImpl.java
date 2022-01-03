package library.member.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.member.dao.SignUpDAO;
import library.member.service.SignUpService;

@Service
public class SignUpServiceImpl implements SignUpService {

	@Autowired
	private SignUpDAO signUpDAO;
	
	// 중복 아이디 체크
	@Override
	public int idCheck(String userId) throws Exception {
		return signUpDAO.idCheck(userId);
	}
}
