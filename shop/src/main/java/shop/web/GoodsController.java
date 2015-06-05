package shop.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GoodsController {
	
	@RequestMapping("admin.do")
	public ModelAndView adminMain(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("shop/admin/admin_main");
		return mav;
	}
	
	@RequestMapping("nav.do")
	public ModelAndView nav(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("shop/admin/nav");
		return mav;
	}
}
