package shop.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StockController {
	
	@RequestMapping("/stockList.do")
	public ModelAndView stockList(){
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/eshopper/admin/stockManage");
		return mav;
	}
}
