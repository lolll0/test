package cgbox.vo;

public class MemberVO {
               
	private int customer_no ;
	private String grade_no    ;
	private String member_id   ;
	private String member_name ;
	private String member_mail ;
	private String member_pass ;
	private String member_birth;
	private String member_tel  ;
	private int member_point;
	
	public int getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}
	public String getGrade_no() {
		return grade_no;
	}
	public void setGrade_no(String grade_no) {
		this.grade_no = grade_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_mail() {
		return member_mail;
	}
	public void setMember_mail(String member_mail) {
		this.member_mail = member_mail;
	}
	public String getMember_pass() {
		return member_pass;
	}
	public void setMember_pass(String member_pass) {
		this.member_pass = member_pass;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_tel() {
		return member_tel;
	}
	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}
	public int getMember_point() {
		return member_point;
	}
	public void setMember_point(int member_point) {
		this.member_point = member_point;
	}
	@Override
	public String toString() {
		return "MemberVO [customer_no=" + customer_no + ", grade_no=" + grade_no + ", member_id=" + member_id
				+ ", member_name=" + member_name + ", member_mail=" + member_mail + ", member_pass=" + member_pass
				+ ", member_birth=" + member_birth + ", member_tel=" + member_tel + ", member_point=" + member_point
				+ "]";
	}
	   
	
	
}