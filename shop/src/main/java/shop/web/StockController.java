package shop.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import shop.StockService;
import shop.service.StockVO;

@Controller
public class StockController {
	
	@Resource(name="StockService")
	private StockService stockService;
	
	@RequestMapping("/stockList.do")
	public ModelAndView stockList(){
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/eshopper/admin/stockManage");
		return mav;
	}
	
	
	@RequestMapping(value="/stockListJson.do", produces="application/json;charset=UTF-8")
	public @ResponseBody String stockListJson(HttpServletRequest req, HttpServletResponse resp) throws IOException{
		String stockListJson="";
		
		List<StockVO> stockList = stockService.selectStockList();
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			stockListJson = mapper.writeValueAsString(stockList);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//PrintWriter out = resp.getWriter();
		//out.print(stockListJson);
		return stockListJson;
	}
}
