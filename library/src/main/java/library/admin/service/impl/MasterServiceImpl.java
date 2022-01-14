package library.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.admin.dao.MasterDAO;
import library.admin.service.MasterService;
import library.common.page.Criteria;
import library.member.domain.MemberVO;

@Service
public class MasterServiceImpl implements MasterService {

	@Autowired
	private MasterDAO masterDAO;

	// 관리자 목록
	@Override
	public List<MemberVO> adminList(Criteria cri) {
		return masterDAO.adminList(cri);
	}

	// 관리자 수
	@Override
	public int adminTotal(Criteria cri) {
		return masterDAO.adminTotal(cri);
	}

	// 회원 검색
	@Override
	public MemberVO searchMember(String userId) {
		return masterDAO.searchMember(userId);
	}

	// 관리자 권한 보유 중인지 검색
	@Override
	public int adminCheck(String userId) {
		return masterDAO.adminCheck(userId);
	}

	// 권한 부여
	@Override
	public void grant(String userId) {
		masterDAO.grant(userId);
	}

	// 권한 해제
	@Override
	public void revoke(String userId) {
		masterDAO.revoke(userId);
	}

}
