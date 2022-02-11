package library.board.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CalendarVO {
	// 일정번호
	private int calNo;

	// 그룹id
	private String groupId;

	// 일정내용
	private String title;

	// 일정 등록자
	private String userId;

	// 시작일
	private String start;

	// 종료일
	private String end;

	// 하루종일
	private boolean allDay;

	// 글자 색상
	private String textColor;

	// 배경 색
	private String backgroundColor;

	// 외곽선 색
	private String borderColor;

	// 등록일
	private String regDate;

}
