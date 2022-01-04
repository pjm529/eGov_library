package library.mylib.dao.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.member.domain.MemberVO;
import library.mylib.dao.MyPageDAO;

@Repository
public class MyPageDAOImpl extends EgovAbstractMapper implements MyPageDAO {

	// 회원 정보 불러오기
	@Override
	public MemberVO memberInfo(String userId) {
		return selectOne("MyPage.info", userId);
	}

	// 회원 정보 수정
	@Override
	public void modifyMember(MemberVO member) {
		update("MyPage.modifyMember", member);
	}

	// 회원 PW 수정
	@Override
	public void modifyPw(MemberVO member) {
		update("MyPage.modifyPw", member);
	}

	// 회원 탈퇴
	@Override
	public void secessionMember(String userId) {
		delete("MyPage.secessionMember", userId);
	}

	// 탈퇴 회원 입력
	@Override
	public void insertSecession(MemberVO member) {
		insert("MyPage.insertSecession", member);
	}

}
