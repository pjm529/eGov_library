package library.common.util;

import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	
	public static String date(String type) {
		Date now = new Date();
		Calendar cal = Calendar.getInstance();

		// 현재 시간으로 설정
		cal.setTime(now);

		// 현재 날짜의 년
		int year = cal.get(Calendar.YEAR);
		
		// 현재 날짜의 월
		int month = cal.get(Calendar.MONTH) + 1;

		if (type.equals("year")) {
			
			// year 리턴
			return Integer.toString(year);
		} else {
			
			// month 리턴
			return Integer.toString(month);
		}
	}
}
