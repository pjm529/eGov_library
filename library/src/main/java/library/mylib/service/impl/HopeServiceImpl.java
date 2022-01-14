package library.mylib.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.mylib.dao.HopeDAO;
import library.mylib.domain.HopeVO;
import library.mylib.service.HopeService;

@Service
public class HopeServiceImpl implements HopeService {

	@Autowired
	private HopeDAO hopeDAO;
	
	// 희망도서 신청
	@Override
	public void insertHope(HopeVO hope) {
		hopeDAO.insertHope(hope);
	}

}
