package library.admin.service;

import java.util.List;

import library.common.page.Criteria;
import library.member.domain.MemberVO;

public interface AdminService {

	// 회원 목록 출력
	public List<MemberVO> memberList(Criteria cri);

	// 총 회원 수
	public int memberTotal(Criteria cri);

	// 회원 정보 조회
	public MemberVO memberInfo(String userId);

	// 회원 정보 수정
	public void memberModify(MemberVO member);

	// 회원 탈퇴
	public void memberDelete(MemberVO member);
}
