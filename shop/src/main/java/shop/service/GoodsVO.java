package shop.service;

import org.springframework.web.multipart.MultipartFile;

public class GoodsVO {
	private int goods_idx;
	private String goods_name;
	private String goods_desc;
	private int goods_price;
	private MultipartFile goods_file;
	private String goods_img;
	private String goods_thumb;
	private int category_idx;
	private String goods_color;
	private String goods_size;
	private String goods_regdate;
	private String goods_register;
	
	
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getGoods_desc() {
		return goods_desc;
	}
	public void setGoods_desc(String goods_desc) {
		this.goods_desc = goods_desc;
	}
	public int getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}
	public String getGoods_img() {
		return goods_img;
	}
	public void setGoods_img(String goods_img) {
		this.goods_img = goods_img;
	}
	public String getGoods_thumb() {
		return goods_thumb;
	}
	public void setGoods_thumb(String goods_thumb) {
		this.goods_thumb = goods_thumb;
	}
	public int getGoods_idx() {
		return goods_idx;
	}
	public void setGoods_idx(int goods_idx) {
		this.goods_idx = goods_idx;
	}
	public String getGoods_regdate() {
		return goods_regdate;
	}
	public void setGoods_regdate(String goods_regdate) {
		this.goods_regdate = goods_regdate;
	}
	public int getCategory_idx() {
		return category_idx;
	}
	public void setCategory_idx(int category_idx) {
		this.category_idx = category_idx;
	}
	public MultipartFile getGoods_file() {
		return goods_file;
	}
	public void setGoods_file(MultipartFile goods_file) {
		this.goods_file = goods_file;
	}
	public String getGoods_color() {
		return goods_color;
	}
	public void setGoods_color(String goods_color) {
		this.goods_color = goods_color;
	}
	public String getGoods_size() {
		return goods_size;
	}
	public void setGoods_size(String goods_size) {
		this.goods_size = goods_size;
	}
	public String getGoods_register() {
		return goods_register;
	}
	public void setGoods_register(String goods_register) {
		this.goods_register = goods_register;
	}
}
