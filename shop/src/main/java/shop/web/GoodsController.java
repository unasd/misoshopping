package shop.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import shop.StockService;
import shop.service.CategoryBService;
import shop.service.CategoryBVO;
import shop.service.CategoryMVO;
import shop.service.GoodsService;
import shop.service.GoodsVO;
import shop.service.RevQnaService;
import shop.service.RevQnaVO;
import shop.service.ShopDefaultVO;

@Controller
public class GoodsController { 
	
	@Resource(name="GoodsService")
	private GoodsService goodsService;
	@Resource(name="categoryBService")
	private CategoryBService categoryBService;
	@Resource(name="RevQnaService")
	private RevQnaService revQnaService;
	@Resource(name="StockService")
	private StockService stockService;
	
	/**
	 * 메인페이지 로딩
	 * @param shopDefaultVO
	 * @param goodsVO
	 * @return
	 */
	@RequestMapping("/main.do")
	public ModelAndView mainList(ShopDefaultVO shopDefaultVO, GoodsVO goodsVO){
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(shopDefaultVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(shopDefaultVO.getPageUnit());
		paginationInfo.setPageSize(shopDefaultVO.getPageSize());
		
		shopDefaultVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		shopDefaultVO.setLastIndex(paginationInfo.getLastRecordIndex());
		shopDefaultVO.setRecordCountPerPage(paginationInfo.getPageSize());
		shopDefaultVO.setB_idx(goodsVO.getCategory_b_idx());
		shopDefaultVO.setM_idx(goodsVO.getCategory_m_idx());
		
		ModelAndView mav = new ModelAndView();
		List<GoodsVO> goodsList = goodsService.selectGoodsList(shopDefaultVO);
		List<CategoryBVO> categoryBList = categoryBService.selectCategoryBList(new CategoryBVO());
		List<CategoryMVO> categoryMList = categoryBService.selectAllCategoryMlist(new CategoryMVO());
		
		//categoryM을 분류별로 나눠 리스트에
		for(int i=0; i<categoryBList.size(); i++){
			int b_idx = categoryBList.get(i).getCategory_b_idx();
			List<CategoryMVO> selectCateMList = new ArrayList<CategoryMVO>();
			for(int j=0; j<categoryMList.size(); j++){
				if(b_idx==categoryMList.get(j).getCategory_b_idx()){
					// category_b_index가 i인 categoryM을 selectCateMList에 담는다
					selectCateMList.add(categoryMList.get(j));
					// 해당하는 categoryB의 인스턴스에 categoryMList를 셋팅
					categoryBList.get(i).setCategoryML(selectCateMList);
				}
			}
		} // categoryM 분류 끝
		
		mav.addObject("goodsList", goodsList);
		mav.addObject("categoryBList", categoryBList);
		mav.setViewName("eshopper/index");
		return mav;
	}
	
	/**
	 * 
	 * @param shopDefaultVO
	 * @param goodsVO
	 * @return
	 */
	@RequestMapping("/shop.do")
	public ModelAndView shopList(ShopDefaultVO shopDefaultVO, GoodsVO goodsVO){
		
		
		// @확인용 System.out.println("pageIndex : "+shopDefaultVO.getPageIndex());
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(shopDefaultVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(shopDefaultVO.getPageUnit());
		paginationInfo.setPageSize(shopDefaultVO.getPageSize());
		
		shopDefaultVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		shopDefaultVO.setLastIndex(paginationInfo.getLastRecordIndex());
		shopDefaultVO.setRecordCountPerPage(paginationInfo.getPageSize());
		shopDefaultVO.setB_idx(goodsVO.getCategory_b_idx());
		shopDefaultVO.setM_idx(goodsVO.getCategory_m_idx());
		
		// @확인용 System.out.println(goodsVO.getCategory_b_idx());
		// @확인용 System.out.println(goodsVO.getCategory_m_idx());
		// @확인용 System.out.println("sdVO b_idx="+shopDefaultVO.getB_idx()+"/ sdVO m_idx="+shopDefaultVO.getM_idx());;
		
		// @확인용 System.out.println("orderval = "+shopDefaultVO.getOrderValue()+" / ascdesc ="+shopDefaultVO.getAscDesc());
		
		ModelAndView mav = new ModelAndView();
		List<GoodsVO> goodsList = goodsService.selectGoodsList(shopDefaultVO);
		
		int totCnt = goodsService.selectGoodsListCnt(shopDefaultVO);
		// @확인용 System.out.println("totCnt : "+totCnt);
		paginationInfo.setTotalRecordCount(totCnt);
		
		List<CategoryBVO> categoryBList = categoryBService.selectCategoryBList(new CategoryBVO());
		List<CategoryMVO> categoryMList = categoryBService.selectAllCategoryMlist(new CategoryMVO());
		
		/**categoryM을 분류별로 나눠 리스트에*/
		for(int i=0; i<categoryBList.size(); i++){
			int b_idx = categoryBList.get(i).getCategory_b_idx();
			List<CategoryMVO> selectCateMList = new ArrayList<CategoryMVO>();
			for(int j=0; j<categoryMList.size(); j++){
				if(b_idx==categoryMList.get(j).getCategory_b_idx()){
					// category_b_index가 i인 categoryM을 selectCateMList에 담는다
					selectCateMList.add(categoryMList.get(j));
					// 해당하는 categoryB의 인스턴스에 categoryMList를 셋팅
					categoryBList.get(i).setCategoryML(selectCateMList);
				}
			}
		} // categoryM 분류 끝
		
		mav.addObject("shopDefaultVO", shopDefaultVO);
		mav.addObject("goodsList", goodsList);
		mav.addObject("paginationInfo", paginationInfo);
		mav.addObject("categoryBList", categoryBList);
		mav.setViewName("eshopper/shop");
		return mav;
	}
	
	/**
	 * 상품상세 조회
	 * @param goodsVO
	 * @return
	 */
	@RequestMapping("/details.do")
	public ModelAndView details(GoodsVO goodsVO, ShopDefaultVO shopDefaultVO, HttpServletRequest req){
		System.out.println(goodsVO.getGoods_idx());
		// goods_idx 값을 셋팅
		//RevQnaVO revQnaVO = new RevQnaVO();
		// revQnaVO.setGoods_idx(goodsVO.getGoods_idx());
		
		List<CategoryBVO> categoryBList = categoryBService.selectCategoryBList(new CategoryBVO());
		List<CategoryMVO> categoryMList = categoryBService.selectAllCategoryMlist(new CategoryMVO());
		GoodsVO detailsGVO = goodsService.selectOneGoods(goodsVO);
		// goods_idx값을 갖고 후기DB의 리스트를 불러옴  
		List<RevQnaVO> revQnaList = revQnaService.selectRevQnaList(goodsVO.getGoods_idx());
		// @확인용 System.out.println(revQnaList);
		
		/**categoryM을 분류별로 나눠 리스트에*/
		for(int i=0; i<categoryBList.size(); i++){
			int b_idx = categoryBList.get(i).getCategory_b_idx();
			List<CategoryMVO> selectCateMList = new ArrayList<CategoryMVO>();
			for(int j=0; j<categoryMList.size(); j++){
				if(b_idx==categoryMList.get(j).getCategory_b_idx()){
					// category_b_index가 i인 categoryM을 selectCateMList에 담는다
					selectCateMList.add(categoryMList.get(j));
					// 해당하는 categoryB의 인스턴스에 categoryMList를 셋팅
					categoryBList.get(i).setCategoryML(selectCateMList);
				}
			}
		} // categoryM 분류 끝
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoryBList", categoryBList);
		mav.addObject("detailsGVO", detailsGVO);
		mav.addObject("revQnaList", revQnaList);
		mav.setViewName("/eshopper/productDetails");
		return mav;
	}
	

	/**
	 * 
	 * @param categoryBVO
	 * @return
	 */
	@RequestMapping("/goodsInfo.do")
	public ModelAndView categoryBList(@ModelAttribute CategoryBVO categoryBVO){
		List<CategoryBVO> categoryBList = categoryBService.selectCategoryBList(categoryBVO);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoryBList", categoryBList);
		mav.setViewName("eshopper/admin/goodsInfo");
		return mav;
	}
	
	/**
	 * 상품정보 추가
	 * @param goodsVO
	 * @param req
	 * @param resp
	 * @param model
	 * @return 추가과정 성공여부
	 */
	@RequestMapping("/goods_insert.do")
	public ModelAndView goodsInsert(GoodsVO goodsVO, HttpServletRequest req, HttpServletResponse resp){
		ModelAndView mav = new ModelAndView();
		String success = "n";
		MultipartFile goods_file = goodsVO.getGoods_file();
		String originFileName = goods_file.getOriginalFilename();
		String genId = UUID.randomUUID().toString();
		String toStockColor[] = null, toStockSize[] = null;
		
		/** 색상옵션 셋팅 */
		if(goodsVO.getIs_color().equals("y")){
			String resultOption="";
			int colorCount = Integer.parseInt(req.getParameter("color_option"));
			toStockColor = new String[colorCount];
			for(int i=0; i<colorCount; i++){
				resultOption = resultOption+req.getParameter("color_option"+i)+"/";
				toStockColor[i] = req.getParameter("color_option"+i);
			}
			goodsVO.setColor_option(resultOption);
		}
		
		/** 사이즈옵션 셋팅 */
		if(goodsVO.getIs_size().equals("y")){
			String resultOption="";
			int sizeCount = Integer.parseInt(req.getParameter("size_option"));
			toStockSize = new String[sizeCount];
			for(int i=0; i<sizeCount; i++){
				resultOption = resultOption+req.getParameter("size_option"+i)+"/";
				toStockSize[i] = req.getParameter("size_option"+i);
			}
			goodsVO.setSize_option(resultOption);
		}
		
		// 업로드된 파일이 이미지 파일이라면 
		if(goods_file.getContentType().contains("image")){
			String goods_img = genId+"."+originFileName;
			String goods_thumb = "thumb."+genId+originFileName;
			goodsVO.setGoods_img(goods_img);
			goodsVO.setGoods_thumb(goods_thumb);
			
			// goods_file과 goodsVO를 goodsService의 save메소드로 보내
			// 리사이징과 썸네일생성 후 
			// goodsVO에 지정된 경로로 파일저장
			goodsService.saveImage(goodsVO, req);
			
			// 셋팅된 goodsVO insert
			goodsService.insertGoods(goodsVO);
			
			// 입력받은 재고정보 insert
			stockService.insertStockInfos(goodsVO.getGoods_idx(), toStockColor, toStockSize);
			
			// 입력완료 메시지
			success = "y";
			//model.addAttribute("success", success);
		} // if 끝
		
		mav.setViewName("eshopper/admin/goodsInfo");
		mav.addObject("success", success);
		return mav;
	}
}
