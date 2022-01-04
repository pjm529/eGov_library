package library.member.dao.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.member.dao.SearchDAO;
import library.member.domain.MemberVO;

@Repository
public class SearchDAOImpl extends EgovAbstractMapper implements SearchDAO {

	// ID 찾기
	@Override
	public String searchId(MemberVO member) {
		return selectOne("Search.searchId", member);
	}

	// PW 찾기
	@Override
	public int searchPw(MemberVO member) {
		return selectOne("Search.searchPw", member);
	}

	// PW 초기화
	@Override
	public void resetPw(MemberVO member) {
		update("Search.resetPw", member);
	}

}
