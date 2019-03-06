$(document).ready(function() {
					/**
					 * shopper注册验证
					 */
					$("#shopperPhone").blur(function() {
						var phone = this.value;
						var RegCellPhone = /^(1)([0-9]{10})?$/;
						var falg = phone.search(RegCellPhone);
						if (falg == -1) {
							alert("手机号不合法！");
							this.focus();
						}
					});
					$("#shopperEmail").blur(function() {
										var email = this.value;
										var RegEmail = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
										var falg = email.search(RegEmail);
										if (falg == -1) {
											alert("邮箱不合法！");
											this.focus();
										}
									});
					$("#ConfirmPassword").blur(function() {
						var password = $("#shopperPassword").val();
						// alert(password);
						var ConfirmPassword = this.value;
						if (password != ConfirmPassword) {
							// alert(password+""+ConfirmPassword);
							alert("两次输入的密码不一致，请重新输入");
							this.focus();
						}
					});
					/**
					 * sellerr注册验证
					 */
					$("#sellerPhone").blur(function() {
						var phone = this.value;
						var RegCellPhone = /^(1)([0-9]{10})?$/;
						var falg = phone.search(RegCellPhone);
						if (falg == -1) {
							alert("手机号不合法！");
							this.focus();
						}
					});
					$("#sellerEmail").blur(function() {
										var email = this.value;
										var RegEmail = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
										var falg = email.search(RegEmail);
										if (falg == -1) {
											alert("邮箱不合法！");
											this.focus();
										}
									});
					$("#sellerIdCardNo").blur(function() {
										var idCardNo = this.value;
										var RegIdCardNo = "[1-9]{2}[0-9]{4}(19|20)[0-9]{2}"
												+ "((0[1-9]{1})|(1[1-2]{1}))((0[1-9]{1})|([1-2]{1}[0-9]{1}|(3[0-1]{1})))"
												+ "[0-9]{3}[0-9x]{1}";
										var falg = idCardNo.search(RegIdCardNo);
										if (falg == -1) {
											alert("身份证号不合法！");
											this.focus();
										}
									});
					$("#sellerConfirmPassword").blur(function() {
						var password = $("#sellerPassword").val();
						// alert(password);
						var sellerConfirmPassword = this.value;
						if (password != sellerConfirmPassword) {
							// alert(password+""+ConfirmPassword);
							alert("两次输入的密码不一致，请重新输入");
							this.focus();
						}
					});
					/**
					 * 添加收货地址验证
					 */
					$("#consigneePhone").blur(function() {
						var phone = this.value;
						var RegCellPhone = /^(1)([0-9]{10})?$/;
						var falg = phone.search(RegCellPhone);
						if (falg == -1) {
							alert("手机号不合法！");
							this.focus();
						}
					});
					$("#consigneePostalCode").blur(function() {
						var postalCode = this.value;
						var RegCellPostalCode = /^[1-9][0-9]{5}$/;
						var falg = postalCode.search(RegCellPostalCode);
						if (falg == -1) {
							alert("邮编不合法！");
							this.focus();
						}
					});
				});