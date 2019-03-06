//封装好的万能分页js
function addressPage(pages, total) {
	function getParameter(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if (r != null)
			return unescape(r[2]);
		return null;
	}
	// init
	$(function() {
		var totalPage = pages;
		var totalRecords = total;
		var pageNo = getParameter('pageNumber');
		if (!pageNo) {
			pageNo = 1;
		}
		// 生成分页
		jpager.generPageHtml({// jpager与上面div的id相同
			pno : pageNo,
			// 总页码
			total : totalPage,
			// 总数据条数
			totalRecords : totalRecords,
			// 链接前部
			hrefFormer : 'showAddress',// 这里与controller中用于分页的方法相同
			// 链接尾部
			hrefLatter : '.do',
			getLink : function(n) {
				return this.hrefFormer + this.hrefLatter + "?pageNumber=" + n;
			},
		});
	});
}

function searchGoodsPage(pages, total) {
	function getParameter(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if (r != null)
			return unescape(r[2]);
		return null;
	}
	// init
	$(function() {
		var totalPage = pages;
		var totalRecords = total;
		var pageNo = getParameter('pageNumber');
		if (!pageNo) {
			pageNo = 1;
		}
		// 生成分页
		jpager.generPageHtml({// jpager与上面div的id相同
			pno : pageNo,
			// 总页码
			total : totalPage,
			// 总数据条数
			totalRecords : totalRecords,
			// 链接前部
			hrefFormer : 'searchGoods',// 这里与controller中用于分页的方法相同
			// 链接尾部
			hrefLatter : '.do',
			getLink : function(n, keywords, shopname) {
				return this.hrefFormer + this.hrefLatter + "?pageNumber=" + n
						+ "&keywords=" + keywords + "&shopname=" + shopname;
			},
		});
	});
}

function showAllGoodsPage(pages, total) {
	function getParameter(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if (r != null)
			return unescape(r[2]);
		return null;
	}
	// init
	$(function() {
		var totalPage = pages;
		var totalRecords = total;
		var pageNo = getParameter('pageNumber');
		if (!pageNo) {
			pageNo = 1;
		}
		// 生成分页
		jpager.generPageHtml({// jpager与上面div的id相同
			pno : pageNo,
			// 总页码
			total : totalPage,
			// 总数据条数
			totalRecords : totalRecords,
			// 链接前部
			hrefFormer : 'showAllGoods',// 这里与controller中用于分页的方法相同
			// 链接尾部
			hrefLatter : '.do',
			getLink : function(n) {
				return this.hrefFormer + this.hrefLatter + "?pageNumber=" + n;
			},
		});
	});
}

function commentPage(pages, total) {
	function getParameter(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if (r != null)
			return unescape(r[2]);
		return null;
	}
	// init
	$(function() {
		var totalPage = pages;
		var totalRecords = total;
		var pageNo = getParameter('pageNumber');
		if (!pageNo) {
			pageNo = 1;
		}
		// 生成分页
		jpager.generPageHtml({// jpager与上面div的id相同
			pno : pageNo,
			// 总页码
			total : totalPage,
			// 总数据条数
			totalRecords : totalRecords,
			// 链接前部
			hrefFormer : 'showGoodsCommentById',// 这里与controller中用于分页的方法相同
			// 链接尾部
			hrefLatter : '.do',
			goodsId : $("#goodsId").val(),
			getLink : function(n) {
				var goodsId = $("#goodsId").val();
				return this.hrefFormer + this.hrefLatter + "?pageNumber=" + n
						+ "&goodsId=" + goodsId;
			},
		});
	});
}
/**
 * 进入店铺
 * 
 * @param pages
 * @param total
 * @returns
 */
function showShopGoodsPage(pages, total) {
	function getParameter(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if (r != null)
			return unescape(r[2]);
		return null;
	}
	// init
	$(function() {
		var totalPage = pages;
		var totalRecords = total;
		var pageNo = getParameter('pageNumber');
		if (!pageNo) {
			pageNo = 1;
		}
		// 生成分页
		jpager.generPageHtml({// jpager与上面div的id相同
			pno : pageNo,
			// 总页码
			total : totalPage,
			// 总数据条数
			totalRecords : totalRecords,
			// 链接前部
			hrefFormer : 'showAllGoodsByShopId',// 这里与controller中用于分页的方法相同
			// 链接尾部
			hrefLatter : '.do',
			shopId : $("#shopId").val(),
			getLink : function(n) {
				var shopId = $("#shopId").val();
				return this.hrefFormer + this.hrefLatter + "?pageNumber=" + n
						+ "&shopId=" + shopId;
			},
		});
	});
}
/**
 * 卖家商品列表
 * 
 * @param pages
 * @param total
 * @returns
 */
function seller_ShopGoodsPage(pages, total) {
	function getParameter(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if (r != null)
			return unescape(r[2]);
		return null;
	}
	// init
	$(function() {
		var totalPage = pages;
		var totalRecords = total;
		var pageNo = getParameter('pageNumber');
		if (!pageNo) {
			pageNo = 1;
		}
		// 生成分页
		jpager.generPageHtml({// jpager与上面div的id相同
			pno : pageNo,
			// 总页码
			total : totalPage,
			// 总数据条数
			totalRecords : totalRecords,
			// 链接前部
			hrefFormer : 'showShopAllGoods',// 这里与controller中用于分页的方法相同
			// 链接尾部
			hrefLatter : '.do',
			shopId : $("#shopId").val(),
			getLink : function(n) {
				var shopId = $("#shopId").val();
				return this.hrefFormer + this.hrefLatter + "?pageNumber=" + n
						+ "&shopId=" + shopId;
			},
		});
	});
}
/**
 * 卖家首页商品列表
 * 
 * @param pages
 * @param total
 * @returns
 */
function manageShopGoodsPage(pages, total) {
	function getParameter(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if (r != null)
			return unescape(r[2]);
		return null;
	}
	// init
	$(function() {
		var totalPage = pages;
		var totalRecords = total;
		var pageNo = getParameter('pageNumber');
		if (!pageNo) {
			pageNo = 1;
		}
		// 生成分页
		jpager.generPageHtml({// jpager与上面div的id相同
			pno : pageNo,
			// 总页码
			total : totalPage,
			// 总数据条数
			totalRecords : totalRecords,
			// 链接前部
			hrefFormer : 'showShopGoods',// 这里与controller中用于分页的方法相同
			// 链接尾部
			hrefLatter : '.do',
			shopId : $("#shopId").val(),
			getLink : function(n) {
				var shopId = $("#shopId").val();
				return this.hrefFormer + this.hrefLatter + "?pageNumber=" + n
						+ "&shopId=" + shopId;
			},
		});
	});
}
