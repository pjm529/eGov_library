package library.mylib.dao;

public interface ReserveDAO {

	// 제 1열람실 잔여 좌석
	public int rd1UsingSeat();

	// 제 1열람실 사용 중 좌석
	public int rd1UsedSeat();

	// 제 2열람실 잔여 좌석
	public int rd2UsingSeat();

	// 제 2열람실 사용 중 좌석
	public int rd2UsedSeat();

	// 노트북실 잔여 좌석
	public int nbUsingSeat();

	// 노트북실 사용 중 좌석
	public int nbUsedSeat();
}
