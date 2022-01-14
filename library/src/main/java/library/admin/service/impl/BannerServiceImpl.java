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

	// 배너 등록
	@Override
	public void insertBanner(BannerVO banner) {
		bannerDAO.insertBanner(banner);
	}

	// 배너 삭제
	@Override
	public void deleteBanner(BannerVO banner) {
		bannerDAO.deleteBanner(banner);
	}

}
