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

}
