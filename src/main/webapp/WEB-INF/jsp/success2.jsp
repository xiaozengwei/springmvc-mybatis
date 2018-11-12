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
#div2{
	width:80px;
	background:#999;
	display: none;
	position: absolute;
	margin: 0;
	padding: 0;
	
}
td{
width: 185px;
}
ul{
	float: left;
	margin: 0;
	padding: 0;
}
li{
	list-style: none;
	border-bottom:1px solid green; 
}
</style>

<script type="text/javascript">
	window.onload=function (){
		$.ajax({
				Type:"POST",
				url:"createTable.html",
				dataType:"json",
				 data : { 
				      "hf":"123"
				     },
				success : function(data) {
					var count=data.total;
					var alluser=data.rows;
					var table=document.getElementById('Tb');
					for(var i=0;i<count;i++){
						var oTr=document.createElement('tr');
						var name=alluser[i].name;
						var email=alluser[i].email;
						var password=alluser[i].password;
						var id=alluser[i].id;
						table.appendChild(oTr);
						oTr.id=i;
						var checkOTr=document.getElementById(i);
						var td1=document.createElement('td');
						td1.innerHTML=id;
						checkOTr.appendChild(td1);
						var td2=document.createElement('td');
						td2.innerHTML=name;
						checkOTr.appendChild(td2);
						var td3=document.createElement('td');
						td3.innerHTML=password;
						checkOTr.appendChild(td3);
						var td4=document.createElement('td');
						td4.innerHTML=email;
						checkOTr.appendChild(td4);					
					}
					var oTable=document.getElementById('Tb');
					var aTrs=oTable.getElementsByTagName('tr');
					for(var i=0;i<aTrs.length;i++){
						aTrs[i].oncontextmenu=function(ev){					//鼠标右击事件
							var currentTr=this;
							var oEvent=ev||event;				
							div2.style.top=oEvent.clientY+'px';
							div2.style.left=oEvent.clientX+'px';
							div2.style.display='block';		
							var aLis=document.getElementsByTagName('li');
						
							
							
							for(var i=0;i<aLis.length;i++){							
								aLis[i].onmouseover=function(){				//li的mouseover事件
									for(var i=0;i<aLis.length;i++){
										aLis[i].style.color='';
									}
									this.style.color='yellow';
								}								
								aLis[i].onclick=function(){									//li的单击事件
				
									//3.编辑onclick开始
									if(this.innerHTML=="3.編輯"){
										var aTds=currentTr.getElementsByTagName('td');
										var aInputs=currentTr.getElementsByTagName('input');
										var aInputsValue=new Array();
										var user=new Object();
										for(var i=0;i<aTds.length;i++){
											aTds[i].innerHTML="<input type='text' value='"+aTds[i].innerHTML+"'>"										
										}						
				    					document.onkeydown=function(ev){
											var oEvent=ev||event;
											if(oEvent.keyCode==13){
												var a=confirm("是否更新到数据库？");
												if(a==true){
														for(var i=0;i<aInputs.length;i++){
															aInputsValue[i]=aInputs[i].value;
														}
														for(var i=0;i<aInputsValue.length;i++){														
															aTds[i].innerHTML=aInputsValue[i];
														}
														user.id=aInputsValue[0];
														user.name=aInputsValue[1];
														user.password=aInputsValue[2];
														user.email=aInputsValue[3];
														$.ajax({
															type:"POST",
															url:"handle.html",
															dataType:"json",
															data:{
																"edit":JSON.stringify(user)
															},
															success:function(data){																	
															},
															error:function(data){																
															}
														});
												}
											}
										}
									}
									//3.编辑onclick结束
									
									//1.創建onclick开始
									if(this.innerHTML=="1.創建"){
										$.ajax({
											type:"POST",
											url:"handle.html",
											dataType:"json",
											data:{
												"createUser":"createUser"
											},
											success:function(data){
												$("#aBody").hide();
												var html='<form action="createUer.html" method="post"	>';
												html+='<table id="Tb" border="1" cellpadding="5" cellspacing="0" bordercolor="red" align="center">';
												html+='<tr>';
												html+='<td colspan="2" align="center"><span class="title">创建用户</span></td>'
												html+='</tr>';
												html+='<tr>';
												html+='<td>用户名</td>';
												html+='<td><input type="text" name="userId" placeholder="name"></td>';
												html+='</tr>';
												html+='<tr>';
												html+='<td>密码</td>';
												html+='<td><input type="password" name="password" placeholder="password"></td>';
												html+='</tr>';
												html+='<td>邮箱</td>';
												html+='<td><input type="text" name="email" placeholder="e-mail"></td>';
												html+='</tr>';
												html+='<tr>';
												html+='<td colspan="2" align="center">';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
												html+='<input class="submit" type="submit" value="创建" >';
												html+='</tr>';
												html+='</table>';
												html+='</form>';
												$("#aBody").html(html);
												$("#aBody").show();;
											},
											error:function(data){
												alert("error");
											}
										});
									}
									//1.創建onclick结束
									//2.删除onclick开始
									if(this.innerHTML=='2.删除'){
										var a = confirm("是否更新到数据库？");
										if(a==true){
											currentUser=new Object();
											var array=new Array();
											var aCurrentTrs = currentTr.getElementsByTagName('td');
											for(var i=0;i<aCurrentTrs.length;i++){
												array[i]=aCurrentTrs[i].innerHTML;
											}
											currentUser.id=array[0];
											currentUser.name=array[1];
											currentUser.password=array[2];
											currentUser.email=array[3];
											document.getElementById('Tb').removeChild(currentTr);
											var json=JSON.stringify(currentUser);
											$.ajax({
												Type:"POST",
												url:"handle.html",
												dataType:'json',
												data:{
													"delete":json
												},
												success:function(data){											
												},
												error:function(error){												
												}
											});
										}								
									}
									//2.删除onclick结束
								}
							}
							return false;
						};
					}
				
					
				},
				error: function (data) {
					alert("传输失败");
				}
		})	
	};
		document.onclick=function(){
			var div2=document.getElementById("div2");
			div2.style.display='none';
		}
</script>


<body id="aBody">
	<div id='div1'>
		<table id="Tb" border="1" cellpadding="5" cellspacing="0" bordercolor="red" align="center" >
			<tr>
				<td>学号</td>
				<td>姓名</td>
				<td>密码</td>
				<td>邮箱</td>
			</tr>
		</table>
	</div>
	<div id='div2'>
		<ul>
			<li>1.創建</li>
			<li>2.删除</li>
			<li>3.編輯</li>
		</ul>
	</div>
</body>
</html>