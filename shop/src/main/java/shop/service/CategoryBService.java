package shop.service;

import java.util.List;

public interface CategoryBService {
	public List<CategoryBVO> selectCategoryBList(CategoryBVO categoryBVO);
	public void insertCategoryB(CategoryBVO categoryBVO);

	public List<CategoryMVO> selectCategoryMList(CategoryMVO categoryMVO);
	public void insertCategoryM(CategoryMVO categoryMVO);
}
