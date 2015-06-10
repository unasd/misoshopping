package shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import shop.service.CategoryBService;
import shop.service.CategoryBVO;
import shop.service.CategoryMVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("categoryBService")
public class CategoryBServiceImpl extends EgovAbstractServiceImpl implements CategoryBService{

	private static final Logger LOGGER = LoggerFactory.getLogger(CategoryBServiceImpl.class);
	
	@Resource(name="categoryBMapper")
	private CategoryBMapper categoryBDAO;
	
	
	@Override
	public List<CategoryBVO> selectCategoryBList(CategoryBVO categoryBVO) {
		// TODO Auto-generated method stub
		LOGGER.debug(categoryBVO.toString());
		return categoryBDAO.selectCategoryBList(categoryBVO);
	}

	@Override
	public void insertCategoryB(CategoryBVO categoryBVO) {
		// TODO Auto-generated method stub
		LOGGER.debug(categoryBVO.toString());
		categoryBDAO.insertCategoryB(categoryBVO);
	}

	@Override
	public List<CategoryMVO> selectCategoryMList(CategoryMVO categoryMVO) {
		// TODO Auto-generated method stub
		LOGGER.debug(categoryMVO.toString());
		return categoryBDAO.selectCategoryMList(categoryMVO);
	}
	
	@Override
	public void insertCategoryM(CategoryMVO categoryMVO) {
		// TODO Auto-generated method stub
		LOGGER.debug(categoryMVO.toString());
		categoryBDAO.insertCategoryM(categoryMVO);
	}

	@Override
	public List<CategoryMVO> selectAllCategoryMlist(CategoryMVO categoryMVO) {
		// TODO Auto-generated method stub
		LOGGER.debug(categoryMVO.toString());
		return categoryBDAO.selectAllCategoryMlist(categoryMVO);
	}

}
