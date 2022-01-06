package library.mylib.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.common.domain.DateVO;
import library.common.page.Criteria;
import library.mylib.dao.MyLoanDAO;
import library.mylib.service.MyLoanService;
import library.search.domain.BookVO;

@Service
public class MyLoanServiceImpl implements MyLoanService {

	@Autowired
	private MyLoanDAO myLoanDAO;

	// 대출 내역 조회
	@Override
	public List<BookVO> loanHistoryList(String userId, Criteria cri, DateVO date) {

		HashMap<String, Object> map = new HashMap<>();

		map.put("userId", userId);
		map.put("cri", cri);
		map.put("date", date);

		return myLoanDAO.loanHistoryList(map);
	}

	// 대출 총 권수
	@Override
	public int historyTotal(String userId, DateVO date) {

		HashMap<String, Object> map = new HashMap<>();

		map.put("userId", userId);
		map.put("date", date);

		return myLoanDAO.historyTotal(map);
	}

}
