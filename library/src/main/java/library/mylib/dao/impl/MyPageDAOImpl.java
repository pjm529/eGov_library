package library.mylib.dao.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.member.domain.MemberVO;
import library.mylib.dao.MyPageDAO;

@Repository
public class MyPageDAOImpl extends EgovAbstractMapper implements MyPageDAO {

	@Override
	public MemberVO memberInfo(String userId) {
		return selectOne("MyPage.info", userId);
	}

	@Override
	public void modifyMember(MemberVO member) {
		update("MyPage.modifyMember", member);
	}

}
