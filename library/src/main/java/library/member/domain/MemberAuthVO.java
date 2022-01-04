package library.member.domain;

public class MemberAuthVO {
	
	// 회원 아이디
	private String userId;
	
	// 회원 권한
	private String auth;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}
	
	
	
}
