package library.admin.service;

import java.util.List;

import library.admin.domain.BannerVO;

public interface BannerService {

	// 배너 목록
	public List<BannerVO> bannerList();

}
