package library.member.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.member.dao.SearchDAO;
import library.member.domain.MemberVO;
import library.member.service.SearchService;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchDAO searchDAO;

	// ID 찾기
	@Override
	public String searchId(MemberVO member) {
		return searchDAO.searchId(member);
	}

	
	// PW 찾기
	@Override
	public int searchPw(MemberVO member) {
		return searchDAO.searchPw(member);
	}

	// PW 초기화
	@Override
	public void resetPw(MemberVO member) {
		searchDAO.resetPw(member);
	}

}
