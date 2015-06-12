package shop.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface GoodsService {
	void insertGoods(GoodsVO goodsVO);
	List<GoodsVO> selectGoodsList(ShopDefaultVO ShopDefaultVO);
	int selectGoodsListCnt(ShopDefaultVO shopDefaultVO);
	GoodsVO selectOneGoods(GoodsVO goodsVO);
	
	void saveImage(GoodsVO goodsVO, HttpServletRequest req);
}
