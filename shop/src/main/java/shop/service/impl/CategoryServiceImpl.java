package shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import shop.service.CategoryService;
import shop.service.CategoryVO;
import shop.service.CategoryMVO;
import shop.service.ShopDefaultVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("categoryService")
public class CategoryServiceImpl extends EgovAbstractServiceImpl implements CategoryService{

	private static final Logger LOGGER = LoggerFactory.getLogger(CategoryServiceImpl.class);
	
	@Resource(name="categoryMapper")
	private CategoryMapper categoryDAO;

	
	@Override
	public List<CategoryVO> categoryList(ShopDefaultVO shopDefaultVO) {
		// TODO Auto-generated method stub
		LOGGER.debug(shopDefaultVO.toString());
		return categoryDAO.categoryList(shopDefaultVO);
	}
	
	@Override
	public StringBuffer selectCategoryBList(CategoryVO categoryVO) {
		// TODO Auto-generated method stub
		LOGGER.debug(categoryVO.toString());
		StringBuffer categoryBString 
			= this.categoryListBuilder(categoryDAO.selectCategoryBList(categoryVO));
		//System.out.println(categoryBString);
		return  categoryBString;
	}

	@Override
	public int insertCategory(CategoryVO categoryVO) {
		// TODO Auto-generated method stub
		LOGGER.debug(categoryVO.toString());
		return categoryDAO.insertCategory(categoryVO);
	}
	
	private StringBuffer categoryListBuilder(List<CategoryVO> categoryVOList){
		StringBuffer categoryString = new StringBuffer();
		
		for(CategoryVO categoryVO : categoryVOList){
			categoryString.append("<option value='"+categoryVO.getCategory_idx()+"'>"+categoryVO.getCategory_name()+"</option>");
		}																		
		return categoryString;
	}

	@Override
	public CategoryVO categoryUpdate1(CategoryVO categoryVO) {
		// TODO Auto-generated method stub
		LOGGER.debug(categoryVO.toString());
		return categoryDAO.categoryUpdate1(categoryVO);
	}

	@Override
	public int categoryUpdate2(CategoryVO categoryVO) {
		LOGGER.debug(categoryVO.toString());
		return categoryDAO.categoryUpdate2(categoryVO);
	}

	@Override
	public int categoryDelete(CategoryVO categoryVO) {
		LOGGER.debug(categoryVO.toString());
		return categoryDAO.categoryDelete(categoryVO);
	}

	@Override
	public boolean cateNameCheck(CategoryVO categoryVO) {
		LOGGER.debug(categoryVO.toString());
		categoryDAO.cateNameCheck(categoryVO);
		return false;
	}
}
