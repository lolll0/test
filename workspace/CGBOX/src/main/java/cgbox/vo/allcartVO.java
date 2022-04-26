package cgbox.vo;

public class allcartVO {
	  
	//prod테이블
	private int prod_no;
	private String prod_name;
	private String prod_category;
	private int prod_price;
	private String prod_detail;
	private String prod_source;
	
	//cart_prod테이블
	private int cart_no;
	
	private int customer_no;
	private int cart_count;
	private String cart_status;
	private int cart_price;
	
	public int getProd_no() {
		return prod_no;
	}
	public void setProd_no(int prod_no) {
		this.prod_no = prod_no;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public String getProd_category() {
		return prod_category;
	}
	public void setProd_category(String prod_category) {
		this.prod_category = prod_category;
	}
	public int getProd_price() {
		return prod_price;
	}
	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	public String getProd_detail() {
		return prod_detail;
	}
	public void setProd_detail(String prod_detail) {
		this.prod_detail = prod_detail;
	}
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public int getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}
	public int getCart_count() {
		return cart_count;
	}
	public void setCart_count(int cart_count) {
		this.cart_count = cart_count;
	}
	public String getCart_status() {
		return cart_status;
	}
	public void setCart_status(String cart_status) {
		this.cart_status = cart_status;
	}
	public String getProd_source() {
		return prod_source;
	}
	public void setProd_source(String prod_source) {
		this.prod_source = prod_source;
	}
	public int getCart_price() {
		return cart_price;
	}
	public void setCart_price(int cart_price) {
		this.cart_price = cart_price;
	}
	
	                          

	
	
}
