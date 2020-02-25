<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" import="java.util.*" %>
<%@   page   import= "登录界面.* "%>
<%@   page   import= "高考志愿指导.* "%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>用户登录/注册</title>
</head>
<style>
body{
	background-color:#5CADAD;
}
h1{
	text-shadow: 5px 5px 5px #FF0000;
	text-align:center;
}
.div_res,.from_id{
	display:none;
}
.code 
{
 background:	#A3D1D1;
 font-family:Arial;
 font-style:italic;
 color:blue;
 font-size:20px;
 border:1;
 padding:2px 3px;
 letter-spacing:3px;
 font-weight:bolder;
 float:left;
 cursor:pointer;
 width:100px;
 height:30px;
 line-height:30px;
 text-align:center;
 vertical-align:middle;
}
.reg_table{
 border:0;

border-collapse:collapse;   
}
td   {   
border:0;   
}   
</style>
<script> 
/**** div显示/隐藏js ****/
function hidden1(div_1,div_2){	
	document.getElementById(div_1).style.display="none";
	document.getElementById(div_2).style.display="block";
}
/**** 验证码生成js ****/
var code;
function btnClick3(id){
	createCode(id);
}
function createCode(id) 
{
 code = "";
 var codeLength = 6; //验证码的长度
 var checkCode = document.getElementById(id);
 var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
      'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
      'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的
 for(var i = 0; i < codeLength; i++) 
 {
  var charNum = Math.floor(Math.random() * 52);
  code += codeChars[charNum];
 }
 if(checkCode) 
 {
  checkCode.className = "code";
  checkCode.innerHTML = code;
 }
}
/**** 验证是否为空 ****/
function check_empty(field,alerttxt){
	with (field)
	  {
	  if (value==null||value=="")
	    {alert(alerttxt);return false}
	  else {return true}
	  }
}
/**** 是否为正确的验证码 ****/
function check_code(field){
	with (field)
	  {
		  if (value.length<1)
		    {alert("请输入验证码！");
		    
		 	return false
		  }else if(value.toUpperCase() != code.toUpperCase()){
		  	 alert("验证码输入有误,请重新验证！");
		   	 return false
		  }else {return true}
	  }
}
/**** 是否为正确格式的密码 ****/
function check_passw(value){
	if(value.length<8){
  	 alert("输入的密码位数必须大于8！");
   	 return false
  	}else {return true}
}
/**** 两次密码是否相同 ****/
function check_passwcp(value,compare){
	if(value!= compare){
  	 alert("输入的两次密码不同！");
   	 return false
  	}else {return true}
}
/**** 是否为合法Email地址/QQ号 ****/
function isuser_id(value) {

	if(value.search(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/) == -1 && value.search(/^[1-9][0-9]{4,}$/) == -1)
	{    
		alert("用户输入格式不正确！");
		return false				
	}else
        return true
}
/**** 表单验证 ****/
function check_form(thisform){
	with(thisform){
		if(check_code(auth_code)==false)
		{auth_code.focus();return false}
		if(isuser_id(username.value)==false)
		{username.focus();return false}
		if(check_passw(password.value)==false)
		{password.focus();return false}	
		with(from_ids){
			if(value=="2"){
				if(check_passwcp(password1.value,password.value)==false)
				{password1.focus();return false}
			}		
		}
	}
}

</script> 
<body onload="createCode('checkCode1')">
<%
	// 如果用户名已经存在，说明已经登录，跳转到主页
	String username = (String) request.getSession().getAttribute("username");
	if (username != null && username.length() > 0) {
		response.sendRedirect("index.jsp");
		return;
	}
%>
<script>
	alert("请先进行用户登录，若未注册用户，则请选择注册选项！");
</script>
<h1>用户登录/验证</h1>
<div class = "div_select"  style="text-align:center">		
		  <p>	    
		    <label>
		      <input name="query" type="radio" id="query0" value="user_login" checked="checked" onClick="hidden1('user_res','user_login');createCode('checkCode1');"/>
		      登录</label>
		      <label>
		      <input name="query" type="radio" id="query_1" value="user_res" onClick="hidden1('user_login','user_res');createCode('checkCode2');"/>
		      注册</label>
		    <br />
		  </p>
		
	</div>
<div class="div_login" id="user_login">
<form action="<%=request.getContextPath()%>/servlet/LoginServlet" method="post" onsubmit="return check_form(this)">
		<input type="text" name="from_ids" value="1" class="from_id"/>
		<table cellpadding="0" cellspacing="0" border="1" align="center" class="reg_table"> 
		<tr  height="30"> 
			<td >用户(qq/qq邮箱):</td> 
			<td ><input type="text" name="username" id="txt1_user" Onblur="isuser_id(document.getElementById('txt1_user').value);"/></td>
		</tr>
		<tr  height="30"> 
			<td >密码:</td>
			<td ><input type="password" name="password" id="txt1_passw" Onblur="check_passw(document.getElementById('txt1_passw').value);"/></td>
		</tr>
		<tr  height="30">
			<td >验证码:</td>
			<td ><a class="code" id="checkCode1" onclick="createCode('checkCode1')" ></a>&nbsp;&nbsp;<a href="#" onclick="btnClick3('checkCode1')">换一个</a></td>
	 	</tr>
		<tr  height="30">
	 		<td >验证码输入框:</td>
	 		<td ><input type="text" name="auth_code" id="txt1_auth_code"></td>
	 	</tr>
		<tr  height="30"  style="text-align:center">
			<td ><input name="clear" type="reset" /></td>
			<td ><input type="submit" value="登录" /></td>
		</tr>
	</table>
</form> 
</div>
<div class="div_res" id="user_res">
<form action="<%=request.getContextPath()%>/servlet/LoginServlet" method="post" onsubmit="return check_form(this)">
	<input type="text" name="from_ids" value="2" class="from_id"/>
	<table cellpadding="0" cellspacing="0" border="1" align="center" class="reg_table"> 
		<tr  height="30"> 
			<td >用户(qq/qq邮箱):</td> 
			<td ><input type="text" name="username" id="txt2_user" Onblur="isuser_id(document.getElementById('txt2_user').value);"/></td>
		</tr>
		<tr  height="30"> 
			<td >密码:</td>
			<td ><input type="password" name="password" id="txt2_passw" Onblur="check_passw(document.getElementById('txt2_passw').value);"/></td>
		</tr>
		<tr  height="30">
			<td >再次输入密码:</td>
			<td ><input type="password" name="password1" id="txt21_passw" Onblur="check_passwcp(document.getElementById('txt2_passw').value,document.getElementById('txt21_passw').value);"/></td>
		</tr>
		<tr  height="30">
			<td >验证码:</td>
			<td ><a class="code" id="checkCode2" onclick="createCode('checkCode2');" ></a>&nbsp;&nbsp;<a href="#" onclick="btnClick3('checkCode2')">换一个</a></td>
	 	</tr>
		<tr  height="30">
	 		<td >验证码输入框:</td>
	 		<td ><input type="text" name="auth_code" id="txt2_auth_code"></td>
	 	</tr>
		<tr  height="30"  style="text-align:center">
			<td ><input name="clear" type="reset" /></td>
			<td ><input type="submit" value="注册" /></td>
		</tr>
	</table>	
</form> 
</div>
</body>
</html>