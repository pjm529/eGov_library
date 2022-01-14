package library.admin.domain;

import lombok.Data;

@Data
public class BannerVO {
	
	// 등록자 아이디
	private String userId;
	
	// 경로
	private String path;
	
	// 등록일
	private String regDate;
}
