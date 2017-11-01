
var flag = [0, 0, 0];
function checkUsername(username) {
	var reId = /([_\a-zA-Z0-9]){4,19}$/;
	var b_id = reId.test(username);
	if (!b_id) {
		document.getElementById("userName_note").innerHTML = "<font color=red>\u672a\u8f93\u5165\u7528\u6237\u540d\u6216\u683c\u5f0f\u9519\u8bef</font>";
		flag[0] = 0;
	} else {
		document.getElementById("userName_note").innerHTML = "<font color=#ee9955>\u8f93\u5165\u5408\u6cd5</font>";
		flag[0] = 1;
	}
}
function checkPassword(password) {
	var pwId = /([_\a-zA-Z0-9]){6,19}$/;
	var p_id = pwId.test(password);
	if (!p_id) {
		document.getElementById("passWord_note").innerHTML = "<font color=red>\u68c0\u67e5\u5bc6\u7801\u683c\u5f0f</font>";
		flag[1] = 0;
	} else {
		document.getElementById("passWord_note").innerHTML = "<font color=#ee9955>\u5bc6\u7801\u5408\u6cd5</font>";
		flag[1] = 1;
	}
}
function checkrepassword(repassword) {
	var password = document.getElementById("password1").value;
	var secondPassword = document.getElementById("password2").value;
	if (password != secondPassword) {
		document.getElementById("SecondPassword_note").innerHTML = "<font color=red>\u4e8c\u6b21\u5bc6\u7801\u8f93\u5165\u4e0d\u4e00\u81f4</font>";
		flag[2] = 0;
	} else {
		document.getElementById("SecondPassword_note").innerHTML = "<font color=#ee9955>\u5bc6\u7801\u5408\u6cd5</font>";
		flag[2] = 1;
	}
}
function registSubmit() {
	if (flag[0] == 0) {
		alert("\u8bf7\u8f93\u5165\u6b63\u786e\u7528\u6237\u540d");
		return false;
	} else {
		if (flag[1] == 0) {
			alert("\u8bf7\u68c0\u67e5\u4e24\u6b21\u5bc6\u7801\u662f\u5426\u8f93\u5165\u6b63\u786e");
			return false;
		} else {
			if (flag[2] == 0) {
				alert("\u8bf7\u68c0\u67e5\u4e24\u6b21\u5bc6\u7801\u662f\u5426\u8f93\u5165\u6b63\u786e");
				return false;
			}
		}
	}
}

