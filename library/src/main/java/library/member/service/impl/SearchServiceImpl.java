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
	
	@Override
	public String searchId(MemberVO member) {
		return searchDAO.searchId(member);
	}

	@Override
	public int searchPw(MemberVO member) {
		return searchDAO.searchPw(member);
	}

	@Override
	public void resetPw(MemberVO member) {
		searchDAO.resetPw(member);
	}

}
