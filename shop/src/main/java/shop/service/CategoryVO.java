package shop.service;

public class CategoryVO {
	int category_idx;
	String category_name;
	String category_desc="";
	int upper_category_idx;
	
	public int getCategory_idx() {
		return category_idx;
	}
	public void setCategory_idx(int category_idx) {
		this.category_idx = category_idx;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getCategory_desc() {
		return category_desc;
	}
	public void setCategory_desc(String category_desc) {
		this.category_desc = category_desc;
	}
	public int getUpper_category_idx() {
		return upper_category_idx;
	}
	public void setUpper_category_idx(int upper_category_idx) {
		this.upper_category_idx = upper_category_idx;
	}
}
