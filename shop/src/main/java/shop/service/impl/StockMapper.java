package shop.service.impl;

import java.util.List;

import shop.service.StockVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("stockMapper")
public interface StockMapper {
	void insertStock(StockVO stockVO);
	List<StockVO> selectStockList();
}
