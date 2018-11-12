<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
body{
	color:purple;
	font-size: 20px;
	margin: 20px auto;
}
.kfc{

	border:none;
}
.submit{
	float:left;
	color: red;
	border:none;
}
.reset{
	float:right;
	color:green;
	border:none;
}
.title{
  	font-size: 40px;
  	color: red;
}
</style>


<body>
	<form action="login.html" method="post"	name="LoginForm" >
		<table id="Tb" border="1" cellpadding="5" cellspacing="0" bordercolor="red" align="center">
			<tr>
				<td colspan="2" align="center"><span class="title">用户登录</span></td>
			</tr>
			<tr>
				<td>用户名</td>
				<td><input class="kfc" type="text" name="name" placeholder="${ERR_name}"></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input class="kfc" type="password" name="password" placeholder="${ERR_password}"></td>
			</tr>
			<tr>
				<td colspan="2">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
				<input class="submit" type="submit" value="submit" onclick="return check(this);"> 
				<input class="reset" type="reset" value="reset"></td>
				
			</tr>
		</table>
	</form>
</body>

</html>