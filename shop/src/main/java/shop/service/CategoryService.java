package shop.service;

import java.util.List;

public interface CategoryService {
	public StringBuffer selectCategoryBList(CategoryVO categoryVO);
	public int insertCategory(CategoryVO categoryVO);
}
