package library.member.service;

public interface SignUpService {

	// 중복 아이디 체크
	public int idCheck(String userId) throws Exception;

}
