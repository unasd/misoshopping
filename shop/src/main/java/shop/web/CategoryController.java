package shop.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import shop.service.CategoryService;
import shop.service.CategoryVO;
import shop.service.CategoryMVO;
import shop.service.GoodsService;
import shop.service.GoodsVO;
import shop.service.ShopDefaultVO;

@Controller
public class CategoryController {
	
	@Resource(name="categoryService")
	private CategoryService categoryService;
	
	@RequestMapping("/categoryList.do")
	public ModelAndView categoryList(ShopDefaultVO shopDefaultVO){
		ModelAndView mav = new ModelAndView();
		List<CategoryVO> categoryVOs = categoryService.categoryList(shopDefaultVO);
		
		mav.addObject("shopDefaultVO", shopDefaultVO);
		mav.addObject("categoryVOs", categoryVOs);
		mav.setViewName("/eshopper/admin/categoryManage/categoryList");
		return mav;
	}
	
	@RequestMapping(value="/categoryWrite.do", method=RequestMethod.GET)
	public ModelAndView categoryWrite(){
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("/eshopper/admin/categoryManage/categoryWrite");
		return mav;
	}
	
	/**
	 * 셀렉트박스의 카테고리 목록을 불러온다.
	 * @param categoryVO
	 * @param resp
	 * @throws IOException
	 */
	@RequestMapping("/api/selBoxCateList.do")
	public void selBoxCateList(CategoryVO categoryVO, HttpServletResponse resp) throws IOException{
		StringBuffer categoryBString = categoryService.selectCategoryBList(categoryVO);
		PrintWriter out = resp.getWriter();
		out.print(categoryBString);
	}
	
	/**
	 * 셀렉트박스에서 카테고리 항목을 추가한다.
	 * @param categoryBVO
	 * @param req
	 * @param resp
	 * @throws IOException
	 */
	@RequestMapping("/api/category_add.do")
	public void CategoryBInsert(CategoryVO categoryVO, HttpServletResponse resp) throws IOException{
		//System.out.println("controller called");
		// 현재 로그인한 관리자의 세션에서 아이디를 얻어와 셋팅한다
		categoryVO.setCategory_register("admin");
		int isInsert = categoryService.insertCategory(categoryVO);
		PrintWriter out = resp.getWriter();
		out.print(categoryVO.getCategory_idx());
	}
}
