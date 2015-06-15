package shop.service;

public class StockVO {
	private int goods_idx;
	private String stock_size;
	private int stock_amount;
	private String stock_color;
	
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
}
