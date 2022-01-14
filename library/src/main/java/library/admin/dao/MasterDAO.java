package library.admin.dao;

import java.util.List;

import library.common.page.Criteria;
import library.member.domain.MemberVO;

public interface MasterDAO {
	
	// 관리자 목록
	public List<MemberVO> adminList(Criteria cri);
	
	// 관리자 수
	public int adminTotal(Criteria cri);
	
	// 회원 검색
	public MemberVO searchMember(String userId);
	
	// 관리자 권한 보유 중인지 검색
	public int adminCheck(String userId);
	
	// 권한 부여
	public void grant(String userId);

}
