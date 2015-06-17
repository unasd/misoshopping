package shop.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import shop.StockService;
import shop.service.StockVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("StockService")
public class StockServiceImpl extends EgovAbstractServiceImpl implements StockService{
	private static final Logger LOGGER = LoggerFactory.getLogger(StockServiceImpl.class);
	
	@Resource(name="stockMapper")
	private StockMapper stockDAO;
	
	/**
	 * 여러개의 재고정보를 insert하기 위한 셋팅
	 * @param goods_idx
	 * @param toStockColor
	 * @param toStockSize
	 * @return stockInsertList  입력 조건에 따른 재고정보 리스트
	 */
	public List<StockVO> insertQuerySetting(int goods_idx, String[] toStockColor, String[] toStockSize){
		List<StockVO> stockInsertList = new ArrayList<StockVO>();
		StockVO stockVO = null;
		
		if(toStockColor!=null && toStockSize!=null){
			for(String stockColor : toStockColor){
				for(String stockSize : toStockSize){
					stockVO = new StockVO();
					stockVO.setGoods_idx(goods_idx);
					stockVO.setStock_color(stockColor);
					stockVO.setStock_size(stockSize);
					// System.out.println("stockserviceImpl "+stockVO.getGoods_idx()+"/"+stockVO.getStock_color()+"/"+stockVO.getStock_size()+"/"+stockVO.getStock_amount()); // @확인용
					stockInsertList.add(stockVO);
				}
			}
		} else if (toStockColor!=null && toStockSize==null) {
			for(String stockColor : toStockColor){
				stockVO = new StockVO();
				stockVO.setGoods_idx(goods_idx);
				stockVO.setStock_color(stockColor);
				
				stockInsertList.add(stockVO);
			}
		} else if (toStockColor==null && toStockSize!=null){
			for(String stockSize : toStockSize){
				stockVO = new StockVO();
				stockVO.setGoods_idx(goods_idx);
				stockVO.setStock_size(stockSize);
				
				stockInsertList.add(stockVO);
			}
		} else{
			stockVO = new StockVO();
			stockVO.setGoods_idx(goods_idx);
			
			stockInsertList.add(stockVO);
		}
		// System.out.println(stockInsertList.size()); //@확인용
		return stockInsertList;
	}
	
	/**
	 * 상품정보입력 조건에 따라 재고정보 생성, 수량은 0으로 입력된다
	 * @param goods_idx
	 * @param toStockColor
	 * @param toStockSize
	 * @return
	 */
	@Override
	public void insertStockInfos(int goods_idx, String[] toStockColor, String[] toStockSize) {
		// TODO Auto-generated method stub
		List<StockVO> stockInsertList = this.insertQuerySetting(goods_idx, toStockColor, toStockSize);
		Iterator<StockVO> it = stockInsertList.iterator();
		while(it.hasNext()){
			stockDAO.insertStock(it.next());
			LOGGER.debug(it.toString());
		}
	}

	@Override
	public List<StockVO> selectStockList() {
		// TODO Auto-generated method stub
		return stockDAO.selectStockList();
	}
}
