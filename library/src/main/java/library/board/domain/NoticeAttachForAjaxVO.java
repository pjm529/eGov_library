package library.board.domain;

import lombok.Data;

@Data
public class NoticeAttachForAjaxVO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean image;
}
