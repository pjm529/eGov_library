package library.admin.dao;

import java.util.List;

import library.member.domain.MemberVO;

public interface AdminDAO {
	
	// 회원 목록 출력
	public List<MemberVO> memberList();
}
