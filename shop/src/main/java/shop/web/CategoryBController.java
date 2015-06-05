package shop.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import shop.service.CategoryBService;
import shop.service.CategoryBVO;

@Controller
public class CategoryBController {
	
	@Resource(name="categoryBService")
	private CategoryBService categoryBService;

	@RequestMapping("/categoryBList.do")
	public ModelAndView categoryBList(@ModelAttribute CategoryBVO categoryBVO){
		List<CategoryBVO> categoryBList = categoryBService.selectCategoryBList(categoryBVO);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoryBList", categoryBList);
		mav.setViewName("shop/test");
		return mav;
	}
}
