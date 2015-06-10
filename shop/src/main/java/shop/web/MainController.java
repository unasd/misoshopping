package shop.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	/*@RequestMapping("/shop.do")
	public ModelAndView mainPage(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("eshopper/index");
		return mav;
	}*/
	@RequestMapping("/origin.do")
	public ModelAndView admin_origin(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("shop/admin/admin_origin");
		return mav;
	}
}
