package shop.service;

import org.springframework.web.multipart.MultipartFile;

public class GoodsVO {
	private String goods_name;
	private String goods_desc;
	private int goods_price;
	private MultipartFile goods_file;
	private String goods_img;
	private String goods_thumb;
	private int goods_idx;
	private String goods_regdate;
	private int category_b_idx;
	private int category_m_idx;
	private String is_color="n";
	private String color_option="n";
	private String is_size="n";
	private String size_option="n";
	
	
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
	public int getCategory_b_idx() {
		return category_b_idx;
	}
	public void setCategory_b_idx(int category_b_idx) {
		this.category_b_idx = category_b_idx;
	}
	public int getCategory_m_idx() {
		return category_m_idx;
	}
	public void setCategory_m_idx(int category_m_idx) {
		this.category_m_idx = category_m_idx;
	}
	public MultipartFile getGoods_file() {
		return goods_file;
	}
	public void setGoods_file(MultipartFile goods_file) {
		this.goods_file = goods_file;
	}
	public String getIs_color() {
		return is_color;
	}
	public void setIs_color(String is_color) {
		this.is_color = is_color;
	}
	public String getColor_option() {
		return color_option;
	}
	public void setColor_option(String color_option) {
		this.color_option = color_option;
	}
	public String getIs_size() {
		return is_size;
	}
	public void setIs_size(String is_size) {
		this.is_size = is_size;
	}
	public String getSize_option() {
		return size_option;
	}
	public void setSize_option(String size_option) {
		this.size_option = size_option;
	}
	
}
