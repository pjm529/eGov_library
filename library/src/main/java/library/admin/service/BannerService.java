package library.admin.service;

import java.util.List;

import library.admin.domain.BannerVO;

public interface BannerService {

	// 배너 목록
	public List<BannerVO> bannerList();

	// 배너 등록
	public void insertBanner(BannerVO banner);

	// 배너 삭제
	public void deleteBanner(BannerVO banner);

}
