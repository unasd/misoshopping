package shop.service.impl;

import java.util.List;

import shop.service.CategoryVO;
import shop.service.CategoryMVO;
import shop.service.ShopDefaultVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;


@Mapper("categoryMapper")
public interface CategoryMapper {
	
	/**
	 * 카테고리 관리페이지 리스트를 로딩한다.
	 * @param shopDefaultVO
	 * @return
	 */
	public List<CategoryVO> categoryList(ShopDefaultVO shopDefaultVO);
	/**
	 * 셀렉트박스 카테고리 목록을 로딩한다.
	 * @param categoryVO
	 * @return
	 */
	public List<CategoryVO> selectCategoryBList(CategoryVO categoryVO);
	/**
	 * 셀렉트박스 카테고리를 추가한다.
	 * @param categoryVO
	 * @return
	 */
	public int insertCategory(CategoryVO categoryVO);
	
	public CategoryVO categoryUpdate1(CategoryVO categoryVO);
	
	//public int categoryUpdate2(CategoryVO categoryVO);
	
	public int categoryUpdate2(CategoryVO categoryVO);
	
	public int categoryDelete(CategoryVO categoryVO);
	
	public CategoryVO cateNameCheck(CategoryVO categoryVO);
}
