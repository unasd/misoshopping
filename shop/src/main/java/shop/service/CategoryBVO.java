package shop.service;

public class CategoryBVO {
	int category_b_idx;
	String category_b_name;
	String category_b_desc="";
	
	public int getCategory_b_idx() {
		return category_b_idx;
	}
	public void setCategory_b_idx(int category_b_idx) {
		this.category_b_idx = category_b_idx;
	}
	public String getCategory_b_name() {
		return category_b_name;
	}
	public void setCategory_b_name(String category_b_name) {
		this.category_b_name = category_b_name;
	}
	public String getCategory_b_desc() {
		return category_b_desc;
	}
	public void setCategory_b_desc(String category_b_desc) {
		this.category_b_desc = category_b_desc;
	}
}
