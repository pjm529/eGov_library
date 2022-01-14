package library.admin.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.admin.dao.BannerDAO;
import library.admin.domain.BannerVO;

@Repository
public class BannerDAOImpl extends EgovAbstractMapper implements BannerDAO {

	// 배너 목록
	@Override
	public List<BannerVO> bannerList() {
		return selectList("Banner.bannerList");
	}

}
