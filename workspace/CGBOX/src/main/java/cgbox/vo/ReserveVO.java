package cgbox.vo;

public class ReserveVO {

	private int seat_no;
	private int screen_no;
	private int ticket_no;
	private String screen_day;
	
	
	public String getScreen_day() {
		return screen_day;
	}
	public void setScreen_day(String screen_day) {
		this.screen_day = screen_day;
	}
	public int getSeat_no() {
		return seat_no;
	}
	public void setSeat_no(int seat_no) {
		this.seat_no = seat_no;
	}
	public int getScreen_no() {
		return screen_no;
	}
	public void setScreen_no(int screen_no) {
		this.screen_no = screen_no;
	}
	public int getTicket_no() {
		return ticket_no;
	}
	public void setTicket_no(int ticket_no) {
		this.ticket_no = ticket_no;
	}
	
	
}
