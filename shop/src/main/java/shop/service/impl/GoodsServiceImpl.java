package shop.service.impl;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import shop.service.GoodsService;
import shop.service.GoodsVO;
import shop.service.ShopDefaultVO;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("GoodsService")
public class GoodsServiceImpl extends EgovAbstractServiceImpl implements GoodsService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(GoodsServiceImpl.class); 
	
	
	@Resource(name="goodsMapper")
	private GoodsMapper goodsDAO;
	
	@Override
	public void insertGoods(GoodsVO goodsVO) {
		// TODO Auto-generated method stub
		LOGGER.debug(goodsVO.toString());
		goodsDAO.insertGoods(goodsVO);
	}

	@Override
	public void saveImage(GoodsVO goodsVO, HttpServletRequest req) {
		// TODO Auto-generated method stub
		
		ServletContext ctx = req.getSession().getServletContext();
		String realPath = ctx.getRealPath("upload");
		
		File imageFile = new File(realPath+"\\upimg\\"+goodsVO.getGoods_img());
		File imageThumbFile = new File(realPath+"\\upimg\\thumb\\"+goodsVO.getGoods_thumb());
		try {
			BufferedImage originImage = ImageIO.read(goodsVO.getGoods_file().getInputStream());
			int originWidth = originImage.getWidth();
			int originHeight = originImage.getHeight();
			int thumbWidth = 320;
			
			float imgRatio = (float)thumbWidth/(float)originWidth;
			int thumbHeight = Math.round(originHeight*imgRatio);
			//System.out.println(originHeight+" * "+imgRatio+" = "+thumbHeight);
			
			BufferedImage thumbImage = new BufferedImage(thumbWidth, thumbHeight, BufferedImage.TYPE_INT_RGB);
			Graphics2D g = thumbImage.createGraphics();
			g.drawImage(originImage, 0, 0, thumbWidth, thumbHeight, null);
			FileOutputStream fos = new FileOutputStream(imageThumbFile);
			String contentType = goodsVO.getGoods_file().getContentType();
			String imgFormat = contentType.split("/")[1];
			ImageIO.write(thumbImage, imgFormat, fos);
			
			goodsVO.getGoods_file().transferTo(imageFile);
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<GoodsVO> selectGoodsList(ShopDefaultVO ShopDefaultVO) {
		// TODO Auto-generated method stub
		LOGGER.debug(ShopDefaultVO.toString());
		return goodsDAO.selectGoodsList(ShopDefaultVO);
	}

	@Override
	public int selectGoodsListCnt(ShopDefaultVO shopDefaultVO) {
		// TODO Auto-generated method stub
		LOGGER.debug(shopDefaultVO.toString());
		return goodsDAO.selectGoodsListCnt(shopDefaultVO);
	}

	@Override
	public GoodsVO selectOneGoods(GoodsVO goodsVO) {
		// TODO Auto-generated method stub
		LOGGER.debug(goodsVO.toString());
		return goodsDAO.selectOneGoods(goodsVO);
	}
}
