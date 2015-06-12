package shop.service;

import java.util.List;

public interface RevQnaService {
	void insertRevQna(RevQnaVO revQnaVO);
	List<RevQnaVO> selectRevQnaList(int goods_idx);
}
