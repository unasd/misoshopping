package shop.service.impl;

import java.util.List;

import shop.service.CategoryVO;
import shop.service.CategoryMVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;


@Mapper("categoryMapper")
public interface CategoryMapper {
	
	/**
	 * 대분류 카테고리 목록을 조회한다.
	 * @param
	 * @return
	 * @exception
	 */
	public List<CategoryVO> selectCategoryBList(CategoryVO categoryVO);
	public int insertCategory(CategoryVO categoryVO);
	
	public List<CategoryMVO> selectAllCategoryMlist(CategoryMVO categoryMVO);
	public List<CategoryMVO> selectCategoryMList(CategoryMVO categoryMVO);
	public void insertCategoryM(CategoryMVO categoryMVO);
}
