package library.mylib.service;

public interface ReserveService {

	// 열람실 잔여 좌석
	public int usingSeat(String roomType);

	// 열람실 사용 중 좌석
	public int usedSeat(String roomType);

}
