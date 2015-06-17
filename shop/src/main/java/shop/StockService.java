package shop;

import java.util.List;

import shop.service.StockVO;

public interface StockService {
	void insertStockInfos(int goods_idx, String[] toStockColor, String[] toStockSize);
	List<StockVO> selectStockList();
}
