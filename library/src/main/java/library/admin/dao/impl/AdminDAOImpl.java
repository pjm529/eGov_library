package library.admin.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.admin.dao.AdminDAO;
import library.member.domain.MemberVO;

@Repository
public class AdminDAOImpl extends EgovAbstractMapper implements AdminDAO {

	// 회원 목록 출력
	@Override
	public List<MemberVO> memberList() {
		return selectList("Admin.memberList");
	}

}
