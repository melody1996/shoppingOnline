//界面加载/刷新
function flush(){
	var totalPrice = 0;
	var sum=0;
	var checkDelete = document.getElementsByName("ids");
	for(var i=0; i<checkDelete.length; i++) {
   		if (checkDelete[i].type == "checkbox" && checkDelete[i].checked) {
   			var goodsNumber=checkDelete[i].nextSibling.nextSibling.value;
   			var total = checkDelete[i].nextSibling.nextSibling.nextSibling.nextSibling.value;
   			sum=parseInt(sum);
			sum += parseInt(goodsNumber);
			totalPrice=parseInt(totalPrice);
			totalPrice+=parseInt(total);
   		} 			
	}
		$('#totalPrice').append(totalPrice);
		$('#sum').append(sum);
		var checkedsub = $("input[type='checkbox'][id='subcheck']:checked").length;
		if(checkedsub==0){
			$("#balanceButton").attr("disabled",true);
			$("#balanceButton").css("background-color","grey");
		}else{
			$("#balanceButton").attr("disabled",false);
			$("#balanceButton").css("background-color","red");
		}
}
//选中商品
function checkReturn(obj) {
		var sum= $('#sum').text();
		var totalPrice=$('#totalPrice').text();
		var goodsNumber=obj.nextSibling.nextSibling.value;
		var total = obj.nextSibling.nextSibling.nextSibling.nextSibling.value;
		// alert(obj.checked)
		if(obj.checked){
			// alert(goodsNumber);
			// alert(total);
			sum=parseInt(sum);
			sum += parseInt(goodsNumber);
			totalPrice=parseInt(totalPrice);
			totalPrice+=parseInt(total);
			// alert(sum);
		}else{
			sum -= parseInt(goodsNumber);
			totalPrice-=parseInt(total);
		}
		$('#sum').text("");
		$('#totalPrice').text("");
		$('#sum').append(sum);
		$('#totalPrice').append(totalPrice);
		var objIds = obj.value;	
		// 当没有选中某个子复选框时,checkboxall取消选中
		if (!$("#subcheck").checked) {
			$("#checkboxall").attr("checked", false);
			
		}
		// 获取subcheck的个数
		var chsub = $("input[type='checkbox'][id='subcheck']").length;
		// 获取选中的subcheck的个数
		var checkedsub = $("input[type='checkbox'][id='subcheck']:checked").length;
		if (checkedsub == chsub) {
			// 控制全选按钮的选中
			$("#checkboxall").prop("checked",true);
		}
		if(checkedsub==0){
			$("#balanceButton").attr("disabled",true);
			$("#balanceButton").css("background-color","grey");
		}else{
			$("#balanceButton").attr("disabled",false);
			$("#balanceButton").css("background-color","red");
		}
}
// 全选
	function funcCheckAll() {
   		// 判断全选按钮是否是已选中状态
   		// $("#checkboxall").prop("checked")说明已选中
   		// JQuery版本不同，if条件不同
   		if ($("#checkboxall").prop("checked")) {
   			// 将各个子单选按钮设为选中状态
   			$('input[name=ids]').prop("checked",true);
   			//提交按钮置为可点
   			$("#balanceButton").attr("disabled",false);
   			$("#balanceButton").css("background-color","red");
   			var totalPrice = 0;
   			$.each($(".goodsTotalPrice span"), function(index, item) {
   				//如果数字有小数点，就使用 parsetFloat()
   				totalPrice += parseFloat($.trim($(item).text()));
   			});
   			$('#totalPrice').text("");
   			$('#totalPrice').append(totalPrice);
   			var sum = 0;
   			$.each($(".sumGoods input"), function(index, item) {
   				//如果数字有小数点，就使用 parsetFloat()
   				sum += parseInt($(item).val());
   			});
   			$('#sum').text("");
   			$('#sum').append(sum);
   		} else { // 此时全选按钮起到反选作用
       	 	// 将选中状态改为非选中
   			$('input[name=ids]').prop("checked",false);
   			//提交按钮置为不可点
   			$("#balanceButton").attr("disabled",true);
   			$("#balanceButton").css("background-color","grey");
   			$('#sum').text("0");
   			$('#totalPrice').text("0");
   		}
   		// 将'反选'按钮置为非选中状态
   		$('input[name=checkboxInverse]').prop("checked",false);
	}
	// 反选
	function funcCheckInverse() {
		// 将'全选'按钮置为非选中状态
   		$('input[name=checkboxbutton]').removeAttr('checked');
   	    // 获取所有子选框
   		var checkDelete = document.getElementsByName("ids");
   		for(var i=0; i<checkDelete.length; i++) {
       		// 判断全选按钮是否是已选中状态
       		if (checkDelete[i].type == "checkbox" && checkDelete[i].checked) {
       			// 将子选框设为非选中状态
       			checkDelete[i].checked = false;
       		} else { 
       			// 将子选框设为选中状态
       			checkDelete[i].checked = true;
       		}
   		}
	}
	// 失去焦点修改商品数量
	function modifyNumber(t){ // 失去焦点
		var goodsId = t.parentElement.previousSibling.previousSibling.value;
		var goodsNumber = t.value;
		 $.ajax({
			type : "post",
			async : true,
			url : "modifyGoodNumber.do?goodsId="+goodsId+"&goodsNumber="+goodsNumber,
			dataType : "text",
			success : function(res) {
				if (res == "yes") {
					location.href = "showCart.do";
				} else if (res == "not_login") {
					alert("登陆超时，请重新登录");
					location.href = "login.jsp";
				} else {
					alert("商品数量超限!");
				}
			}
		});
	}
	// 失去判断商品数量是否超限
	function checkNumber(t){ // 失去焦点
		var goodsId = t.parentElement.previousSibling.previousSibling.value;
//		alert(goodsId);
		var goodsNumber = t.value;
//		alert(goodsNumber);
		 $.ajax({
			type : "post",
			async : true,
			url : "checkGoodNumber.do?goodsId="+goodsId+"&goodsNumber="+goodsNumber,
			dataType : "text",
			success : function(res) {
				if (res == "no") {
					alert("商品数量超限!");
				}
			}
		});
	}