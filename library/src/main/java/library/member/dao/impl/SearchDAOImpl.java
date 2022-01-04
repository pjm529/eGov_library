package library.member.dao.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.member.dao.SearchDAO;
import library.member.domain.MemberVO;

@Repository
public class SearchDAOImpl extends EgovAbstractMapper implements SearchDAO {

	@Override
	public String searchId(MemberVO member) {
		return selectOne("Search.searchId", member);
	}

}
