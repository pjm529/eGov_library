package library.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.admin.dao.AdminDAO;
import library.admin.service.AdminService;
import library.common.page.Criteria;
import library.member.domain.MemberVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;
	
	// 회원 목록 조회
	@Override
	public List<MemberVO> memberList(Criteria cri) {
		return adminDAO.memberList(cri);
	}

	// 총 회원 수
	@Override
	public int memberTotal(Criteria cri) {
		return adminDAO.memberTotal(cri);
	}

	// 회원 정보 조회
	@Override
	public MemberVO memberInfo(String userId) {
		return adminDAO.memberInfo(userId);
	}

	// 회원 정보 수정
	@Override
	public void memberModify(MemberVO member) {
		adminDAO.memberModify(member);
	}

	// 회원 탈퇴
	@Override
	public void memberDelete(MemberVO member) {
		
		// 회원 탈퇴
		adminDAO.memberDelete(member.getUserId());
		
		// 탈퇴 회원 입력
		adminDAO.insertSecession(member);
		
	}

}
