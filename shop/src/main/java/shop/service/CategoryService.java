package shop.service;

import java.util.List;

public interface CategoryService {
	public List<CategoryVO> categoryList(ShopDefaultVO shopDefaultVO);
	public StringBuffer selectCategoryBList(CategoryVO categoryVO);
	public int insertCategory(CategoryVO categoryVO);
}
