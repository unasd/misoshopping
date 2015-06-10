package shop.service.impl;

import java.util.List;

import shop.service.CategoryBVO;
import shop.service.CategoryMVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;


@Mapper("categoryBMapper")
public interface CategoryBMapper {
	
	/**
	 * 대분류 카테고리 목록을 조회한다.
	 * @param
	 * @return
	 * @exception
	 */
	public List<CategoryBVO> selectCategoryBList(CategoryBVO categoryBVO);
	public void insertCategoryB(CategoryBVO categoryBVO);
	
	public List<CategoryMVO> selectCategoryMList(CategoryMVO categoryMVO);
	public void insertCategoryM(CategoryMVO categoryMVO);
}
