package shop.service.impl;

import java.util.List;

import shop.service.GoodsVO;
import shop.service.ShopDefaultVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("goodsMapper")
public interface GoodsMapper {
	void insertGoods(GoodsVO goodsVO);
	List<GoodsVO> selectGoodsList(ShopDefaultVO ShopDefaultVO);
	int selectGoodsListCnt(ShopDefaultVO ShopDefaultVO);
	GoodsVO selectOneGoods(GoodsVO goodsVO);
}
