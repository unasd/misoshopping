package shop.web;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import shop.service.CategoryBService;
import shop.service.CategoryBVO;
import shop.service.GoodsService;
import shop.service.GoodsVO;

@Controller
public class GoodsController { 
	
	@Resource(name="GoodsService")
	private GoodsService goodsService;
	@Resource(name="categoryBService")
	private CategoryBService categoryBService;
	
	@RequestMapping("nav.do")
	public ModelAndView nav(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("shop/admin/nav");
		return mav;
	}
	
	@RequestMapping("/goods_insert.do")
	public String goodsInsert(GoodsVO goodsVO, HttpServletRequest req, HttpServletResponse resp, Model model){
		
		String success = "n";
		MultipartFile goods_file = goodsVO.getGoods_file();
		String originFileName = goods_file.getOriginalFilename();
		String genId = UUID.randomUUID().toString();
		//ServletContext ctx = req.getSession().getServletContext();
		//String realPath = ctx.getRealPath("upload/");
		
		// 업로드된 파일이 이미지 파일이라면 
		if(goods_file.getContentType().contains("image")){
			//String goods_img = realPath+"\\upimg\\"+genId+"."+originFileName;
			//String goods_thumb = realPath+"\\upimg\\thumb\\"+"thumb."+genId+originFileName;
			String goods_img = genId+"."+originFileName;
			String goods_thumb = "thumb."+genId+originFileName;
			goodsVO.setGoods_img(goods_img);
			goodsVO.setGoods_thumb(goods_thumb);
			
			// goods_file과 goodsVO를 goodsService의 save메소드로 보내
			// 리사이징과 썸네일생성 후 
			// goodsVO에 지정된 경로로 파일저장
			goodsService.saveImage(goodsVO, req);
			
			// 셋팅된 goodsVO를 goodsService를 통해 insert
			goodsService.insertGoods(goodsVO);
			
			success = "y";
			model.addAttribute("success", success);
			//return model;
		}/* else{
			return null;
		}*/
		model.addAttribute("success", success);
		//retrun "redirect:"+url;
		return "shop/admin/admin_main";
	}
	
	@RequestMapping("/goods_list.do")
	public ModelAndView goodsList(GoodsVO goodsVO, CategoryBVO categoryBVO){
		ModelAndView mav = new ModelAndView();
		
		List<GoodsVO> goodsList = goodsService.selectGoodsList(goodsVO);
		mav.addObject("goodsList", goodsList);
		
		List<CategoryBVO> categoryBList = categoryBService.selectCategoryBList(categoryBVO);
		mav.addObject("categoryBList", categoryBList);
		
		mav.setViewName("shop/main");
		return mav;
	}
}
