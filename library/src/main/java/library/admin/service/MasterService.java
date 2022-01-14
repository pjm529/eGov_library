package library.admin.service;

import java.util.List;

import library.common.page.Criteria;
import library.member.domain.MemberVO;

public interface MasterService {

	// 관리자 목록
	public List<MemberVO> adminList(Criteria cri);

	// 관리자 수
	public int adminTotal(Criteria cri);
}
