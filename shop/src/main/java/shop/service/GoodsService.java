package shop.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface GoodsService {
	public void insertGoods(GoodsVO goodsVO);
	public List<GoodsVO> selectGoodsList(GoodsVO goodsVO);
	
	public void saveImage(GoodsVO goodsVO, HttpServletRequest req);
}
