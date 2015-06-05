package shop.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	@RequestMapping("/shop.do")
	public ModelAndView mainPage(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("shop/main");
		return mav;
	}
}
