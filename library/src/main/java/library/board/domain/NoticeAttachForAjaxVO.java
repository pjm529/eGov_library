package library.board.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeAttachForAjaxVO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean image;
}
