package library.admin.dao;

import java.util.List;

import library.common.page.Criteria;
import library.member.domain.MemberVO;

public interface AdminDAO {
	
	// 회원 목록 출력
	public List<MemberVO> memberList(Criteria cri);
	
	// 총 회원 수
	public int memberTotal(Criteria cri);
}
