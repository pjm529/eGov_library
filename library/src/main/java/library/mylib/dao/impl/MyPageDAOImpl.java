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

	@Override
	public void modifyPw(MemberVO member) {
		update("MyPage.modifyPw", member);
	}

	@Override
	public void secessionMember(String userId) {
		delete("MyPage.secessionMember", userId);
	}

	@Override
	public void insertSecession(MemberVO member) {
		insert("MyPage.insertSecession", member);
	}

}
