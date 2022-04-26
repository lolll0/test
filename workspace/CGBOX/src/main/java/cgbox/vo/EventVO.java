package cgbox.vo;

import java.sql.Date;

public class EventVO {

	private int event_no;
	private String event_title;
	private String event_content;
	private Date event_start;
	private Date event_end;
	private String event_src;
	private String event_detail;
	
	public Date getEvent_start() {
		return event_start;
	}
	public void setEvent_start(Date event_start) {
		this.event_start = event_start;
	}
	public Date getEvent_end() {
		return event_end;
	}
	public void setEvent_end(Date event_end) {
		this.event_end = event_end;
	}
	
	public String getEvent_detail() {
		return event_detail;
	}
	public void setEvent_detail(String event_detail) {
		this.event_detail = event_detail;
	}
	public int getEvent_no() {
		return event_no;
	}
	public void setEvent_no(int event_no) {
		this.event_no = event_no;
	}
	public String getEvent_title() {
		return event_title;
	}
	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}
	public String getEvent_content() {
		return event_content;
	}
	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}
	
	public String getEvent_src() {
		return event_src;
	}
	public void setEvent_src(String event_src) {
		this.event_src = event_src;
	}
	
	
}
