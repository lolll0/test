package vo;

public class NonMemberVO {
	private int    customer_no    ;
	private String nonmember_birth;
	private String nonmember_pass ;
	private String nonmember_mail  ;
	
	
	public int getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}
	public String getNonmember_birth() {
		return nonmember_birth;
	}
	public void setNonmember_birth(String nonmember_birth) {
		this.nonmember_birth = nonmember_birth;
	}
	public String getNonmember_pass() {
		return nonmember_pass;
	}
	public void setNonmember_pass(String nonmember_pass) {
		this.nonmember_pass = nonmember_pass;
	}
	public String getNonmember_mail() {
		return nonmember_mail;
	}
	public void setNonmember_mail(String nonmember_mail) {
		this.nonmember_mail = nonmember_mail;
	}
}
