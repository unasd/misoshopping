package shop.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import shop.JSONTest;
import shop.service.RevQnaService;
import shop.service.RevQnaVO;

@Controller
@RequestMapping("/revQna")
public class RevQnaController {
	
	@Resource(name="RevQnaService")
	private RevQnaService revQnaService;
	
	/**
	 * 후기, 문의글 추가
	 * @param revQnaVO
	 * @param resp
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/revAdd.do", produces="application/json;charset=UTF-8")
	public @ResponseBody String revAdd(RevQnaVO revQnaVO, HttpServletResponse resp) throws IOException {
		String refreshRQJson="";
		
		//resp.setContentType("application/json;charset=UTF-8");
		revQnaService.insertRevQna(revQnaVO);
		List<RevQnaVO> refreshRQList = revQnaService.selectRevQnaList(revQnaVO.getGoods_idx());
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			refreshRQJson = mapper.writeValueAsString(refreshRQList);
			System.out.println(refreshRQJson);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//PrintWriter out = resp.getWriter();
		//out.print(refreshRQJson);

		return refreshRQJson;
	}
	
	/**
	 * 자동 json리턴 테스트
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/jsonTest.do", produces="application/json;charset=UTF-8")
	public @ResponseBody String jsonTest(HttpServletResponse resp) throws IOException {
	    	//가상의 배열및 리스트에 데이터 add
	    	ArrayList<String> arraylist = new ArrayList<String>();
	    	arraylist.add("a");
	    	arraylist.add("b");
	    	String[] array = {"a","b","c"};
	    	String jsonTest="";
	    	
	    	//VO객체에 SET한후 vo객체자체를 return
	    	JSONTest test = new JSONTest();
	    	test.setId(1);
	    	test.setTxt("한글");
	    	test.setList(arraylist);
	    	test.setArr(array);
	    	
	    	ObjectMapper mapper = new ObjectMapper();
	    	try {
	    		
				jsonTest = mapper.writeValueAsString(test);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	return jsonTest;
	    	//return null;
	}
}
