<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" import="java.util.*" %>
<%@   page   import= "高考志愿指导.* "%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link href="查询样式.css" rel="stylesheet" type="text/css"> 
<script language="JavaScript" src="查询_功能.js" charset="UTF-8"> </script> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>高考志愿指导</title>
</head>

<body>
	<div class='body_colors'>
		<input type="button" id='color_1' value='' style="background-color:#5CADAD" onclick="body_color('#5CADAD')"/>
	    <input type="button" id='color_2' value='' style="background-color:#9999CC" onclick="body_color('#9999CC')"/>
	    <input type="button" id='color_3' value='' style="background-color:#02C874" onclick="body_color('#02C874')"/>
	</div><br>
	<h1>高考志愿指导</h1>
	
	<div class = "div_select" >
		
		  <p>
		  	<input class="shuoming" type="button" onClick="shuomings();" value="说明"/>	    
		    <label>
		      <input name="query" type="radio" id="query0" value="low-level" checked="checked" onClick="hidden1('div_high','div_low')"/>
		      简单查询</label>
		      <label>
		      <input name="query" type="radio" id="query_1" value="high-level" onClick="hidden1('div_low','div_high')"/>
		      高级查询</label>
		    <br />
		  </p>
		
	</div>
	<div id='div_low'>
			<form method="post" name="form1" target="_self" id="form_low" action="简单查询.jsp" onsubmit="return check_form(this)">
			<table cellpadding="0" cellspacing="0" border="1" align="center" > 
				<tr  height="30"> 
				<td >
				<select name="kemu" id="kemus">
					<option >请选择文/理科！</option>
			  		<option value="理科">理科</option>
			  		<option value="文科">文科</option>
		    	</select>
		    	</td>
		    	</tr>
		    	<tr height="30"> 
				<td width="200" id="sum_pro">			
					<input width="200" class="province" type="text" value="请输入你所在的省份！" id="txt_province" name="pro" onclick="txt_pro('txt_province')" onmouseover="div_pro('txt_province','div_pro')"/>
					<div id="div_pro" class="cla_pro">
					<div id="div_1" class="cla_pro_zimu">
					        <input id="butn1" type="button" value="ABCFG">
					        <input id="butn2" type="button" value="HJLNQ">
					        <input id="butn3" type="button" value="STXY">
					</div>
					<div id="div_provinces" class="cla_pro_name">
						<div id="div_provinces1">
					        &nbsp;A	<input id="butn_a" type="button" value="安徽"><br />
					        &nbsp;B	<input id="butn_b" type="button" value="北京"><br />
					        &nbsp;C	<input id="butn_c" type="button" value="重庆"><br />
					        &nbsp;F	<input id="butn_f" type="button" value="福建"><br />
					        &nbsp;G	<input id="butn_g1" type="button" value="广东">
					            <input id="butn_g2" type="button" value="广西">
					            <input id="butn_g3" type="button" value="甘肃">
					            <input id="butn_g4" type="button" value="贵州">
					    </div>
					    <div id="div_provinces2">
					        &nbsp;H	<input id="butn_h1" type="button" value="河北">
					        		<input id="butn_h2" type="button" value="河南">
					                <input id="butn_h3" type="button" value="湖北"><br />
					                &nbsp;&nbsp;&nbsp;&nbsp;
					                <input id="butn_h4" type="button" value="湖南">
					                <input id="butn_h5" type="button" value="海南">
					                <input id="butn_h6" type="button" value="黑龙江"><br />
					        &nbsp;J	&nbsp;<input id="butn_j1" type="button" value="吉林">
					                <input id="butn_j2" type="button" value="江苏">
					                <input id="butn_j3" type="button" value="江西"><br />
					        &nbsp;L	<input id="butn_l" type="button" value="辽宁"><br />
					        &nbsp;N	<input id="butn_n1" type="button" value="内蒙古">
					                <input id="butn_n2" type="button" value="宁夏">					        
					    </div>
					    <div id="div_provinces3">
					    	&nbsp;Q <input id="butn_q" type="button" value="青海"><br />
					        &nbsp;S	<input id="butn_s1" type="button" value="上海">
					        		<input id="butn_s2" type="button" value="四川"><br />
					        		&nbsp;&nbsp;&nbsp;&nbsp;
					                <input id="butn_s3" type="button" value="山西">
					                <input id="butn_s4" type="button" value="山东">
					                <input id="butn_s5" type="button" value="陕西"><br />           
					        &nbsp;X	<input id="butn_x1" type="button" value="新疆">
					        		<input id="butn_x2" type="button" value="西藏"><br />
					        &nbsp;Y	<input id="butn_y1" type="button" value="云南">
					    </div>
					</div>
					</div>			  		    	 
	    	</td>
		    </tr>
	    	<tr height="30"> 
				<td>
	    	<input width="200" name="score" type="text" class='txt_color' value="请输入您的分数！" id="txt_scores1" onclick="txt_pro('txt_scores1')"/>
	   		</td>
		    	</tr>
			<tr align="center" height="30"> 
				<td>
				<input name="clear" type="reset" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	         	<input type="submit" value="提交" />
	        </td>
		    	</tr>
	        </table>
	        </form>
		</div>
	   <div class="div_3" id="div_high"  style="display:none;">
			<form method="post" name="form2" target="_self" id="form2" action="高级查询.jsp" onsubmit="return check_form(this)">
			<table cellpadding="0" cellspacing="0" border="1" align="center" > 
				<tr  height="30"> 
				<td>
				<select name="kemu" id="kemus">
					<option >请选择文/理科！</option>
			  		<option value="理科">理科</option>
			  		<option value="文科">文科</option>
		    	</select>
		    	</td>
		    	</tr>
		    	<tr height="30"> 
				<td width="200">
			  	 <input width="200" class="province" type="text" value="请输入你所在的省份！" id="txt_1province" name="pro" onclick="txt_pro('txt_1province')" onmouseover="div_pro('txt_1province','div_1pro')"/>
					<div id="div_1pro" class="cla_pro">
					<div id="div_11" class="cla_pro_zimu">
					        <input id="butn1" type="button" value="ABCFG">
					        <input id="butn2" type="button" value="HJLNQ">
					        <input id="butn3" type="button" value="STXY">
					</div>
					<div id="div_1provinces" class="cla_pro_name">
						<div id="div_1provinces1">
					        &nbsp;A	<input id="butn_a" type="button" value="安徽"><br />
					        &nbsp;B	<input id="butn_b" type="button" value="北京"><br />
					        &nbsp;C	<input id="butn_c" type="button" value="重庆"><br />
					        &nbsp;F	<input id="butn_f" type="button" value="福建"><br />
					        &nbsp;G	<input id="butn_g1" type="button" value="广东">
					            <input id="butn_g2" type="button" value="广西">
					            <input id="butn_g3" type="button" value="甘肃">
					            <input id="butn_g4" type="button" value="贵州">
					    </div>
					    <div id="div_1provinces2">
					          &nbsp;H	<input id="butn_h1" type="button" value="河北">
					        		<input id="butn_h2" type="button" value="河南">
					                <input id="butn_h3" type="button" value="湖北"><br />
					                &nbsp;&nbsp;&nbsp;&nbsp;
					                <input id="butn_h4" type="button" value="湖南">
					                <input id="butn_h5" type="button" value="海南">
					                <input id="butn_h6" type="button" value="黑龙江"><br />
					        &nbsp;J	&nbsp;<input id="butn_j1" type="button" value="吉林">
					                <input id="butn_j2" type="button" value="江苏">
					                <input id="butn_j3" type="button" value="江西"><br />
					        &nbsp;L	<input id="butn_l" type="button" value="辽宁"><br />
					        &nbsp;N	<input id="butn_n1" type="button" value="内蒙古">
					                <input id="butn_n2" type="button" value="宁夏">					        
					    </div>
					    <div id="div_1provinces3">
					    	&nbsp;Q <input id="butn_q" type="button" value="青海"><br />
					        &nbsp;S	<input id="butn_s1" type="button" value="上海">
					        		<input id="butn_s2" type="button" value="四川"><br />
					        		&nbsp;&nbsp;&nbsp;&nbsp;
					                <input id="butn_s3" type="button" value="山西">
					                <input id="butn_s4" type="button" value="山东">
					                <input id="butn_s5" type="button" value="陕西"><br />           
					        &nbsp;X	<input id="butn_x1" type="button" value="新疆">
					        		<input id="butn_x2" type="button" value="西藏"><br />
					        &nbsp;Y	<input id="butn_y1" type="button" value="云南">
					    </div>
					</div>
					</div>
		    	</td>
			    </tr>
		    <tr height="30"> 
				<td width="200">
				  <select name="years" >
				    <option>请选择参考年份：</option>
			  		<option value="1">近一年</option>
			  		<option value="2">近两年</option>
			  		<option value="3">近三年</option>
			  		<option value="4">近四年</option>
		    	  </select>
		    	</td>
		    </tr>
		    <tr height="30"> 
				<td width="200">
		    	  <input name="schoolsite" class="province" type="text" value="请输入学校所在地！" id="txt_province_s" onclick="txt_pro('txt_province_s')" onmouseover="div_pro('txt_province_s','div_2pro')"/>
		    	 	<div id="div_2pro" class="cla_pro">
					<div id="div_21" class="cla_pro_zimu">
					        <input id="butn1" type="button" value="ABCFG">
					        <input id="butn2" type="button" value="HJLNQ">
					        <input id="butn3" type="button" value="STXY">
					</div>
					<div id="div_2provinces" class="cla_pro_name">
						<div id="div_2provinces1">
					        &nbsp;A	<input id="butn_a" type="button" value="安徽"><br />
					        &nbsp;B	<input id="butn_b" type="button" value="北京"><br />
					        &nbsp;C	<input id="butn_c" type="button" value="重庆"><br />
					        &nbsp;F	<input id="butn_f" type="button" value="福建"><br />
					        &nbsp;G	<input id="butn_g1" type="button" value="广东">
					            <input id="butn_g2" type="button" value="广西">
					            <input id="butn_g3" type="button" value="甘肃">
					            <input id="butn_g4" type="button" value="贵州">
					    </div>
					    <div id="div_2provinces2">
					         &nbsp;H<input id="butn_h1" type="button" value="河北">
					        		<input id="butn_h2" type="button" value="河南">
					                <input id="butn_h3" type="button" value="湖北"><br />
					                &nbsp;&nbsp;&nbsp;&nbsp;
					                <input id="butn_h4" type="button" value="湖南">
					                <input id="butn_h5" type="button" value="海南">
					                <input id="butn_h6" type="button" value="黑龙江"><br />
					        &nbsp;J	&nbsp;<input id="butn_j1" type="button" value="吉林">
					                <input id="butn_j2" type="button" value="江苏">
					                <input id="butn_j3" type="button" value="江西"><br />
					        &nbsp;L	<input id="butn_l" type="button" value="辽宁"><br />
					        &nbsp;N	<input id="butn_n1" type="button" value="内蒙古">
					                <input id="butn_n2" type="button" value="宁夏">					        
					    </div>
					    <div id="div_2provinces3">
					    	&nbsp;Q <input id="butn_q" type="button" value="青海"><br />
					        &nbsp;S	<input id="butn_s1" type="button" value="上海">
					        		<input id="butn_s2" type="button" value="四川"><br />
					        		&nbsp;&nbsp;&nbsp;&nbsp;
					                <input id="butn_s3" type="button" value="山西">
					                <input id="butn_s4" type="button" value="山东">
					                <input id="butn_s5" type="button" value="陕西"><br />           
					        &nbsp;X	<input id="butn_x1" type="button" value="新疆">
					        		<input id="butn_x2" type="button" value="西藏"><br />
					        &nbsp;Y	<input id="butn_y1" type="button" value="云南">
					    </div>
					</div>
					</div>
		    	 </td>
	    	 </tr>
    	  	<tr height="30"> 
				<td width="200">
				  <select name="site" >
					<option>请选择参考排位：</option>
			  		<option value="hight">此分数最高排位</option>
			  		<option value="midlle">此分数中间排位</option>
			  		<option value="low">此分数最低排位</option>
		    	  </select>
		    	</td>
		    </tr>
		    <tr height="30"> 
				<td width="200">
		    	   <input name="majorname" class='txt_color' type="text" value="请输入您想填报的专业！" id="txt_majname" onclick="txt_pro('txt_majname')"/>
		    	</td>
		    </tr>
	    	<tr height="30"> 
				<td>
	    	<input width="200" name="score" class='txt_color' type="text" value="请输入您的分数！" id="txt_scores2" onclick="txt_pro('txt_scores2')"/>
	   		</td>
		    	</tr>
			<tr align="center" height="30"> 
				<td>
				<input name="clear" type="reset" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	         	<input type="submit" value="提交" />
	        </td>
		    	</tr>
	        </table>
	        </form>
	   </div>
</body>
</html>