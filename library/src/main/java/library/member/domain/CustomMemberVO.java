package library.member.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class CustomMemberVO extends User {

	private MemberVO member;

	public CustomMemberVO(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
		// TODO Auto-generated constructor stub
	}

	public CustomMemberVO(MemberVO member) {
		super(member.getUserId(), member.getUserPw(), 
				member.getAuthList().stream().map(i -> new SimpleGrantedAuthority(i.getAuth()))
				.collect(Collectors.toList()));
		
		this.member = member;
	}

	public MemberVO getMember() {
		return member;
	}
}
