package shop.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import shop.service.CategoryService;
import shop.service.CategoryVO;
import shop.service.CategoryMVO;
import shop.service.GoodsService;
import shop.service.GoodsVO;

@Controller
public class CategoryController {
	
	@Resource(name="categoryService")
	private CategoryService categoryService;
	//@Resource(name="GoodsService")
	//private GoodsService goodsService;
	
	/**
	 * 카테고리 목록을 불러옴
	 * @param categoryVO
	 * @param resp
	 * @throws IOException
	 */
	@RequestMapping("/api/categoryList.do")
	public void categoryBList(CategoryVO categoryVO, HttpServletResponse resp) throws IOException{
		StringBuffer categoryBString = categoryService.selectCategoryBList(categoryVO);
		PrintWriter out = resp.getWriter();
		out.print(categoryBString);
	}
	
	/**
	 * 카테고리 항목을 추가함
	 * @param categoryBVO
	 * @param req
	 * @param resp
	 * @throws IOException
	 */
	@RequestMapping("/api/category_add.do")
	public void CategoryBInsert(CategoryVO categoryVO, HttpServletResponse resp) throws IOException{
		//System.out.println("name : "+categoryVO.getCategory_name()+"/ upper: "+categoryVO.getUpper_category_idx());
		int isInsert = categoryService.insertCategory(categoryVO);
		PrintWriter out = resp.getWriter();
		//out.print(categoryVO.getCategory_idx()+" ");
		out.print(isInsert);
	}
}
