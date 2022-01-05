package library.admin.service;

import java.util.List;

import library.member.domain.MemberVO;

public interface AdminService {

	// 회원 목록 출력
	public List<MemberVO> memberList();
}
