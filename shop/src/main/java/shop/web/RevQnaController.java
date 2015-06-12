package shop.web;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.JSONTest;
import shop.service.RevQnaService;
import shop.service.RevQnaVO;

@Controller
@RequestMapping("/revQna")
public class RevQnaController {
	
	@Resource(name="RevQnaService")
	private RevQnaService revQnaService;
	
	@RequestMapping("/revAdd.do")
	public @ResponseBody RevQnaVO revAdd(RevQnaVO revQnaVO) {
		System.out.println("call");
		/*revQnaService.insertRevQna(revQnaVO);
		HashMap<String, String> ajaxMap = new HashMap<String, String>();
		ajaxMap.put("added", "added");
		ajaxMap.put("add", "add");*/
		//model.addAttribute(ajaxMap);
		//PrintWriter out = resp.getWriter();
		//out.println("success");
		
		//return ajaxMap;
		return revQnaVO;
	}
	
	@RequestMapping(value="/jsonTest.do", produces="application/json")
	public @ResponseBody JSONTest jsonTest() {
		System.out.println("jsontest called");
	    	//가상의 배열및 리스트에 데이터 add
	    	ArrayList<String> arraylist = new ArrayList<String>();
	    	arraylist.add("a");
	    	arraylist.add("b");
	    	String[] array = {"a","b","c"};
	    	
	    	//VO객체에 SET한후 vo객체자체를 return
	    	JSONTest test = new JSONTest();
	    	test.setId(1);
	    	test.setTxt("textTxt");
	    	test.setList(arraylist);
	    	test.setArr(array);
		return test;
	}

}
