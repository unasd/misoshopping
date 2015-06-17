package shop.service;

public class StockVO {
	private int goods_idx;
	private String stock_size="n";
	private int stock_amount;
	private String stock_color="n";
	private String goods_name="";
	private String category_b_name="";
	
	public int getGoods_idx() {
		return goods_idx;
	}
	public void setGoods_idx(int goods_idx) {
		this.goods_idx = goods_idx;
	}
	public String getStock_size() {
		return stock_size;
	}
	public void setStock_size(String stock_size) {
		this.stock_size = stock_size;
	}
	public int getStock_amount() {
		return stock_amount;
	}
	public void setStock_amount(int stock_amount) {
		this.stock_amount = stock_amount;
	}
	public String getStock_color() {
		return stock_color;
	}
	public void setStock_color(String stock_color) {
		this.stock_color = stock_color;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getCategory_b_name() {
		return category_b_name;
	}
	public void setCategory_b_name(String category_b_name) {
		this.category_b_name = category_b_name;
	}
}
