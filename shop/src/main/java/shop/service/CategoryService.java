package shop.service;

import java.util.List;

public interface CategoryService {
	public List<CategoryVO> categoryList(ShopDefaultVO shopDefaultVO);
	public StringBuffer selectCategoryBList(CategoryVO categoryVO);
	public int insertCategory(CategoryVO categoryVO);
	public CategoryVO categoryUpdate1(CategoryVO categoryVO);
	//public int categoryUpdate2(CategoryVO categoryVO);
	public int categoryUpdate2(CategoryVO categoryVO);
	public int categoryDelete(CategoryVO categoryVO);
	public boolean cateNameCheck(CategoryVO categoryVO);
}
