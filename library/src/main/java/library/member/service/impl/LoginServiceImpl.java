package library.member.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.member.dao.LoginDAO;
import library.member.domain.MemberVO;
import library.member.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDAO loginDAO;
	
	@Override
	public MemberVO login(String userId) {
		return loginDAO.login(userId);
	}

}
