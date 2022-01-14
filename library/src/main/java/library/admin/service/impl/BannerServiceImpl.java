package library.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.admin.dao.BannerDAO;
import library.admin.domain.BannerVO;
import library.admin.service.BannerService;

@Service
public class BannerServiceImpl implements BannerService {
	
	@Autowired
	private BannerDAO bannerDAO;
	
	// 배너 목록
	@Override
	public List<BannerVO> bannerList() {
		return bannerDAO.bannerList();
	}

}
