package shop.service.impl;

import java.util.List;

import shop.service.CategoryBVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;


/**
 * 대분류 카테고리 목록을 조회한다.
 * @param
 * @return
 * @exception
 */
@Mapper("categoryBMapper")
public interface CategoryBMapper {
	List<CategoryBVO> selectCategoryBList(CategoryBVO categoryBVO);
}
