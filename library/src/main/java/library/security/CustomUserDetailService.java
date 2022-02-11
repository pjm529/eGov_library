package library.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import library.member.dao.LoginDAO;
import library.member.domain.CustomMemberVO;
import library.member.domain.MemberVO;

public class CustomUserDetailService implements UserDetailsService {

	@Autowired
	LoginDAO loginDAO;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

//		System.out.println("CustomUserDetailService 진입, 아이디 확인 : " + username);
		
		MemberVO member = loginDAO.login(username);
		
		return member == null ? null : new CustomMemberVO(member);
	}

}
