package library.member.dao;

public interface SignUpDAO {

	// 중복 아이디 체크
	public int idCheck(String userId) throws Exception;
	
	// 중복 이메일 체크
	public int mailCheck(String userEmail) throws Exception;

}
