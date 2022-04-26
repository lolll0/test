package cgbox.vo;

public class SeatVO {
	private int seat_no;
	private int theater_no;
	private String seat_row;
	private String seat_col;
	private String seat_class;
	
	public int getSeat_no() {
		return seat_no;
	}
	public void setSeat_no(int seat_no) {
		this.seat_no = seat_no;
	}
	public int getTheater_no() {
		return theater_no;
	}
	public void setTheater_no(int theater_no) {
		this.theater_no = theater_no;
	}
	public String getSeat_row() {
		return seat_row;
	}
	public void setSeat_row(String seat_row) {
		this.seat_row = seat_row;
	}
	public String getSeat_col() {
		return seat_col;
	}
	public void setSeat_col(String seat_col) {
		this.seat_col = seat_col;
	}
	public String getSeat_class() {
		return seat_class;
	}
	public void setSeat_class(String seat_class) {
		this.seat_class = seat_class;
	}


}
