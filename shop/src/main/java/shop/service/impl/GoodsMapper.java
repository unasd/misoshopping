package shop.service.impl;

import java.util.List;

import shop.service.GoodsVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("goodsMapper")
public interface GoodsMapper {
	public void insertGoods(GoodsVO goodsVO);
	public List<GoodsVO> selectGoodsList(GoodsVO goodsVO);
}
