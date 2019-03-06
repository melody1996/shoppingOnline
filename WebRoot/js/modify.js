$(document).ready(function() {
	$("#shopperConfirmPassword").blur(function() {
		var password = $("#shopperNewPassword").val();
		// alert(password);
		var ConfirmPassword = this.value;
		if (password != ConfirmPassword) {
			// alert(password+""+ConfirmPassword);
			alert("两次输入的密码不一致，请重新输入");
			this.focus();
		}
	});
	$("#sellerConfirmPassword").blur(function() {
		var password = $("#sellerNewPassword").val();
		var ConfirmPassword = this.value;
		if (password != ConfirmPassword) {
			// alert(password+""+ConfirmPassword);
			alert("两次输入的密码不一致，请重新输入");
			this.focus();
		}
	});
	$("#sellerPhone").blur(function() {
		var phone = this.value;
		var RegCellPhone = /^(1)([0-9]{10})?$/;
		var falg = phone.search(RegCellPhone);
		if (falg == -1) {
			alert("手机号不合法！");
			this.focus();
		}
	});
});