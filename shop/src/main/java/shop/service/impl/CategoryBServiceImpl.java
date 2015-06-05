package shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import shop.service.CategoryBService;
import shop.service.CategoryBVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("categoryBService")
public class CategoryBServiceImpl extends EgovAbstractServiceImpl implements CategoryBService{

	private static final Logger LOGGER = LoggerFactory.getLogger(CategoryBServiceImpl.class);
	
	@Resource(name="categoryBMapper")
	private CategoryBMapper categoryBDAO;
	
	
	@Override
	public List<CategoryBVO> selectCategoryBList(CategoryBVO categoryBVO) {
		// TODO Auto-generated method stub
		return categoryBDAO.selectCategoryBList(categoryBVO);
	}
}
