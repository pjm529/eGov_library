package library.member.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberAuthVO {

	// 회원 아이디
	private String userId;

	// 회원 권한
	private String auth;

}
