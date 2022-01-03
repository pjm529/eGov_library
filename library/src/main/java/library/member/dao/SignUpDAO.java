package library.member.dao;

public interface SignUpDAO {

	// 중복 아이디 체크
	public int idCheck(String userId) throws Exception;

}
