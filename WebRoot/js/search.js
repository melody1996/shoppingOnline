/**
* 初始化搜索框
*/
$(function() {
	$(".bodys p").not(":first").hide();
	$(".searchbox ul li").click(function() {
		var index = $(this).index();
		if (index == 0) {
			$(this).find("a").addClass("style1");
			$(".searchbox ul li").eq(1).find("a").removeClass("style2");
			$(".searchbox ul li").eq(2).find("a").removeClass("style3");
			$("#shopname").val("");
		}
		if (index == 1) {
			$(this).find("a").addClass("style2");
			$(".searchbox ul li").eq(0).find("a").removeClass("style1");
			$(".searchbox ul li").eq(2).find("a").removeClass("style3");
			$("#keywords").val("");
		}
		var index = $(this).index();
		$(".bodys p").eq(index).show().siblings().hide();
	});

	$(".close_btn").hover(function() {
		$(this).css({
			color : 'black'
		})
	}, function() {
		$(this).css({
			color : '#999'
		})
	}).on('click', function() {
		$("#detailedSearch").fadeOut("fast");
		$("#detailedSearch1").fadeOut("fast");

		$("#mask").css({
			display : 'none'
		});
		$(".error_cuo").hide();
		iniForm();
	});

	function iniForm() {
		$("#searchByUser")[0].reset();
		$("#searchByBoard")[0].reset();
	}

	$("#changto_user").click(function() {
		$("#detailedSearch").fadeOut("slow");
		$("#detailedSearch1").fadeIn("slow");
	})
	$("#changeto_board").click(function() {
		$("#detailedSearch1").fadeOut("slow");
		$("#detailedSearch").fadeIn("slow");
	})
});
function submitSearch(t) {
	var keywords = $("input[name='keywords']").val();
	var shopname = $("input[name='shopname']").val();
	var regu = "^[ ]+$";
	var re = new RegExp(regu);
	if ($(t).attr("class") == "button1") {
		$("input[name='searchFlag']").val(1);
		if (keywords.length == 0 || re.test(keywords)) {
			alert("请输入关键字！")
		} else {
			$("#commonSearch").submit();
		}
	} else {
		$("input[name='searchFlag']").val(2);
		if (shopname.length == 0 || re.test(shopname)) {
			alert("请输入店铺名！")
		} else {
			$("#commonSearch").submit();
		}
	}
	$("input[name='keyword']").val("");
	$("input[name='shopname']").val("");
}
