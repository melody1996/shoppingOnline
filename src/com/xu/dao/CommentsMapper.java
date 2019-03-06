package com.xu.dao;

import java.util.List;
import com.xu.model.Comments;

public interface CommentsMapper {
	
	void insertComment(Comments comment);

	int getCommentCountById(Integer goodsId);

	List<Comments> findCommentsByShopperId(Integer shopperId);

	List<Comments> findCommentById(Integer goodsId);

}