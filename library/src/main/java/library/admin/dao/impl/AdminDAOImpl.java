package library.admin.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.admin.dao.AdminDAO;
import library.common.page.Criteria;
import library.member.domain.MemberVO;

@Repository
public class AdminDAOImpl extends EgovAbstractMapper implements AdminDAO {

	// 회원 목록 출력
	@Override
	public List<MemberVO> memberList(Criteria cri) {
		return selectList("Admin.memberList", cri);
	}

	// 총 회원수
	@Override
	public int memberTotal(Criteria cri) {
		return selectOne("Admin.memberTotal", cri);
	}

	// 회원 정보 조회
	@Override
	public MemberVO memberInfo(String userId) {
		return selectOne("Admin.memberInfo", userId);
	}

	// 회원 정보 수정
	@Override
	public void memberModify(MemberVO member) {
		update("Admin.memberModify", member);
	}

	// 회원 탈퇴
	@Override
	public void memberDelete(String userId) {
		delete("Admin.memberDelete", userId);
	}

	// 탈퇴 회원 입력
	@Override
	public void insertSecession(MemberVO member) {
		insert("Admin.insertSecession", member);
	}

}
