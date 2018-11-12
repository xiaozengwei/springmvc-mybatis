<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src=" <%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src=" <%=request.getContextPath()%>/js/jquery.dataTable.min.js"></script>
	
</head>
<style type="text/css">
.wrapper {
  background: #50a3a2;
  background: -webkit-linear-gradient(top left, #50a3a2 0%, #53e3a6 100%);
  background: linear-gradient(to bottom right, #50a3a2 0%, #53e3a6 100%);
  opacity:0.8;
  position:absolute;
  top: 50%;
  left: 0;
  width: 100%;
  height: 500px;
  margin-top: -200px;
  overflow: hidden;
}
.container {
  max-width: 600px;
  margin: 0 auto;
  padding: 80px 0;
  height: 400px;
  text-align: center;
}
.container h2 {
  font-size: 40px;
  font-weight: 200;
}
form {
  padding: 20px 0;
  position: relative;
  z-index: 2;
}
form input {
  outline: 0;
  border: 1px solid rgba(255, 255, 255, 0.4);
  background-color: rgba(255, 255, 255, 0.2);
  width: 250px;
  border-radius: 3px;
  padding: 10px 15px;
  margin: 0 auto 10px auto;
  display: block;
  text-align: center;
  font-size: 18px;
  color: white;
  font-weight: 300;
}
form input:hover {
  background-color: rgba(255, 255, 255, 0.4);
}
form input:focus {
  background-color: white;
  width: 300px;
  color: #53e3a6;
}
form select{
	outline: 0;
	border: 1px solid rgba(255, 255, 255, 0.4);
	background-color: rgba(255, 255, 255, 0.2);
	width: 250px;
	border-radius: 3px;
	padding: 10px 15px;
	margin: 0 auto 10px auto;
	display: block;
	text-align: center;
	font-size: 18px;
	color: white;
	font-weight: 300;
}
form select:focus{
	background-color: white;
	width: 300px;
	color: #53e3a6;
}
form button {
  outline: 0;
  background-color: white;
  border: 0;
  padding: 10px 15px;
  color: #53e3a6;
  border-radius: 3px;
  width: 250px;
  cursor: pointer;
  font-size: 18px;
}
form button:hover {
  background-color: #f5f7f9;
}
</style>

<script type="text/javascript">
	window.onload=function(){
		 $.ajax({
			Type:"POST",
			url:"identity.html",
			dataType:"json",
			data:{	
				"user":'123'
			},
			success : function(data){
				var oSelect = document.getElementById("select");
				s=JSON.stringify(data.rows)
		    	for(var i=0;i<data.total;i++){
		    		var option=document.createElement('option');
		    		$(option).text((data.rows[i]['identity']));
		    		oSelect.appendChild(option);
		    	 } 
			},
			error : function(data){
				alert("error");
			}
		})
	};
	
	var oButton = document.getElementById("login-button")
	oButton.onclick = function(){
		var name = document.getElementById("name").value
		reg=/[\u0391-\uFFE5]+/
		if(name.match(reg)){
			alert("对不起，您输入的英文字母类型格式不正确!");
			return
		}else{
			alert("fdsaf")
		}
	}
</script>

<body>
	<div class="wrapper">
		<div class="container">
			<h2>单招系统</h2>
			<form action="login.html" 	name="LoginForm" >
				<input  id="name" type="text" name="name" placeholder="Username" required="required">
				<input  id="password" type="password" name="password" placeholder="Password" required="required">
				<select id="select" name="select3">
	  				<option value="null">--请选择--</option>
<!-- 					 <option value="student">学生</option>
	  				<option value="teacher">老师</option>
	  				<option value="admin">管理员</option> -->
				</select>
				<button type="submit" id="login-button">Login</button>
			</form>
		</div>
	</div>

</body>

</html>