package shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.omg.CORBA.portable.ValueOutputStream;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import shop.service.RevQnaService;
import shop.service.RevQnaVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("RevQnaService")
public class RevQnaServiceImpl extends EgovAbstractServiceImpl implements RevQnaService {

	private static final Logger LOGGER = LoggerFactory.getLogger(RevQnaServiceImpl.class);
	
	@Resource(name="revQnaMapper")
	private RevQnaMapper revQnaDAO;
	
	@Override
	public void insertRevQna(RevQnaVO revQnaVO) {
		// TODO Auto-generated method stub
		LOGGER.debug(revQnaVO.toString());
		revQnaDAO.insertRevQna(revQnaVO);
	}

	@Override
	public List<RevQnaVO> selectRevQnaList(int goods_idx) {
		// TODO Auto-generated method stub
		LOGGER.debug(String.valueOf(goods_idx));
		return revQnaDAO.selectRevQnaList(goods_idx);
	}
}
