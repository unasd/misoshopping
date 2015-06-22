package shop.service.impl;

import java.util.List;

import shop.service.CategoryVO;
import shop.service.RevQnaVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("revQnaMapper")
public interface RevQnaMapper {
	void insertRevQna(RevQnaVO revQnaVO);
	List<RevQnaVO> selectRevQnaList(int goods_idx);
}
