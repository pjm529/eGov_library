package library.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.admin.dao.AdminDAO;
import library.admin.service.AdminService;
import library.member.domain.MemberVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;
	
	// 회원 목록 조회
	@Override
	public List<MemberVO> memberList() {
		return adminDAO.memberList();
	}

	// 총 회원 수
	@Override
	public int memberTotal() {
		return adminDAO.memberTotal();
	}

}
