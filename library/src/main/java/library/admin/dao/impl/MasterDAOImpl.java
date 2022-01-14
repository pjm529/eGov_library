package library.admin.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.admin.dao.MasterDAO;
import library.common.page.Criteria;
import library.member.domain.MemberVO;

@Repository
public class MasterDAOImpl extends EgovAbstractMapper implements MasterDAO {

	// 관리자 목록
	@Override
	public List<MemberVO> adminList(Criteria cri) {
		return selectList("Master.adminList", cri);
	}

	// 관리자 수
	@Override
	public int adminTotal(Criteria cri) {
		return selectOne("Master.adminTotal", cri);
	}

	// 회원 검색
	@Override
	public MemberVO searchMember(String userId) {
		return selectOne("Master.searchMember", userId);
	}

	// 관리자 권한 보유 중인지 검색
	@Override
	public int adminCheck(String userId) {
		return selectOne("Master.adminCheck", userId);
	}

	// 권한 부여
	@Override
	public void grant(String userId) {
		insert("Master.grant", userId);
	}

}
