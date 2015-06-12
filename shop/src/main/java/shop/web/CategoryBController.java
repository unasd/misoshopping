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

import shop.service.CategoryBService;
import shop.service.CategoryBVO;
import shop.service.CategoryMVO;
import shop.service.GoodsService;
import shop.service.GoodsVO;

@Controller
public class CategoryBController {
	
	@Resource(name="categoryBService")
	private CategoryBService categoryBService;
	//@Resource(name="GoodsService")
	//private GoodsService goodsService;

	
	/**
	 * 
	 * @param categoryMVO
	 * @param req
	 * @param resp
	 * @throws IOException
	 */
	@RequestMapping("/api/categoryMList.do")
	public void categoryBSelect(CategoryMVO categoryMVO, HttpServletRequest req, HttpServletResponse resp) throws IOException{
		String categoryB = req.getParameter("categoryB");
		//System.out.println(categoryB);
		
		List<CategoryMVO> categoryMList = categoryBService.selectCategoryMList(categoryMVO);
		
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		out.println("<option value='x'>중분류</option>");
		for(CategoryMVO categoryMVO2 : categoryMList){
			out.println("<option value="+categoryMVO2.getCategory_m_idx()+">"+categoryMVO2.getCategory_m_name()+"</option>");
		}
		out.println("<option value="+"categoryM_add"+">+항목추가</option>");
		out.println("<option value='0000'>해당없음</option>");
	}
	
	/**
	 * 
	 * @param categoryBVO
	 * @param req
	 * @param resp
	 * @throws IOException
	 */
	@RequestMapping("/api/categoryb_add.do")
	public void CategoryBInsert(CategoryBVO categoryBVO, HttpServletRequest req, HttpServletResponse resp) throws IOException{
		categoryBService.insertCategoryB(categoryBVO);
	}
	
	/**
	 * 
	 * @param categoryMVO
	 * @param req
	 * @param resp
	 * @throws IOException
	 */
	@RequestMapping("/api/categorym_add.do")
	public void CategoryMInsert(CategoryMVO categoryMVO, HttpServletRequest req, HttpServletResponse resp) throws IOException{
		//System.out.println(categoryMVO.getCategory_m_name());
		categoryBService.insertCategoryM(categoryMVO);
	}
}
