package shop.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import shop.service.CategoryBService;
import shop.service.CategoryBVO;
import shop.service.CategoryMVO;

@Controller
public class CategoryBController {
	
	@Resource(name="categoryBService")
	private CategoryBService categoryBService;

	@RequestMapping("/categoryBList.do")
	public ModelAndView categoryBList(@ModelAttribute CategoryBVO categoryBVO){
		List<CategoryBVO> categoryBList = categoryBService.selectCategoryBList(categoryBVO);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoryBList", categoryBList);
		mav.setViewName("shop/admin/admin_main");
		return mav;
	}
	
	@RequestMapping("/api/categoryMList.do")
	public void categoryBSelect(CategoryMVO categoryMVO, HttpServletRequest req, HttpServletResponse resp) throws IOException{
		String categoryB = req.getParameter("categoryB");
		//System.out.println(categoryB);
		
		List<CategoryMVO> categoryMList = categoryBService.selectCategoryMList(categoryMVO);
		
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		out.println("<option value="+">중분류</option>");
		for(CategoryMVO categoryMVO2 : categoryMList){
			out.println("<option value="+categoryMVO2.getCategory_m_idx()+">"+categoryMVO2.getCategory_m_name()+"</option>");
		}
		out.println("<option value="+"categoryM_add"+">+항목추가</option>");
	}
	
	@RequestMapping("/api/categoryb_add.do")
	public void CategoryBInsert(CategoryBVO categoryBVO, HttpServletRequest req, HttpServletResponse resp) throws IOException{
		categoryBService.insertCategoryB(categoryBVO);
	}
	
	@RequestMapping("/api/categorym_add.do")
	public void CategoryMInsert(CategoryMVO categoryMVO, HttpServletRequest req, HttpServletResponse resp) throws IOException{
		System.out.println(categoryMVO.getCategory_m_name());
		categoryBService.insertCategoryM(categoryMVO);
	}
}
