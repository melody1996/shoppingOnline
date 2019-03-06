package com.xu.service;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.github.pagehelper.PageHelper;
import com.xu.dao.CommentsMapper;
import com.xu.dao.GoodsMapper;
import com.xu.dao.ShopMapper;
import com.xu.dao.ShopperMapper;
import com.xu.model.Comments;
import com.xu.model.Goods;
import com.xu.model.Shop;
import com.xu.model.Shopper;
import com.xu.utils.BeanUtil;
import com.xu.utils.PagedResult;

@Service
@Transactional
public class CommentsService {
	@Resource
	private GoodsMapper goodsMapper;
	@Resource
	private CommentsMapper commentsMapper;
	@Resource
	private ShopperMapper shopperMapper;

	public void insertComment(Comments comment) {
		commentsMapper.insertComment(comment);

	}

	public List<Comments> findCommentByShopperId(Integer shopperId) {
		List<Comments> comments = commentsMapper.findCommentsByShopperId(shopperId);
		return comments;
	}

	public PagedResult<Comments> findCommentById(Integer goodsId, Integer pageNumber, Integer pageSize) {
		PageHelper.startPage(pageNumber, pageSize);
		// 2. 查询数据库，获取数据
		List<Comments> comments = commentsMapper.findCommentById(goodsId);
		for (int i = 0; i < comments.size(); i++) {
			Goods goods = goodsMapper.findGoodById(comments.get(i).getGoodsId());
			Shopper shopper = shopperMapper.findShopperById(comments.get(i).getShopperId());
			comments.get(i).setGoods(goods);
			comments.get(i).setShopper(shopper);
		}
		// 3. 通过分页工具类加载分页数据
		BeanUtil.toPagedResult(comments);
		return BeanUtil.toPagedResult(comments);
	}
}
