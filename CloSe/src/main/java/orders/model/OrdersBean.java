package orders.model;

public class OrdersBean {
	private int orders_number;
	private String orders_date;
	private int amount;
	private int qty;
	private int product_number;
	private String member_id;
	private int cart_number;
	
	public OrdersBean() {
		super();
	}
	public OrdersBean(int orders_number, String orders_date, int amount, int qty, int product_number, String member_id,
			int cart_number) {
		super();
		this.orders_number = orders_number;
		this.orders_date = orders_date;
		this.amount = amount;
		this.qty = qty;
		this.product_number = product_number;
		this.member_id = member_id;
		this.cart_number = cart_number;
	}
	public int getOrders_number() {
		return orders_number;
	}
	public void setOrders_number(int orders_number) {
		this.orders_number = orders_number;
	}
	public String getOrders_date() {
		return orders_date;
	}
	public void setOrders_date(String orders_date) {
		this.orders_date = orders_date;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getProduct_number() {
		return product_number;
	}
	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getCart_number() {
		return cart_number;
	}
	public void setCart_number(int cart_number) {
		this.cart_number = cart_number;
	}
	
	
}
