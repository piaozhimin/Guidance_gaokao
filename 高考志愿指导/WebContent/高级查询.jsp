<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" import="java.util.*" %>
<%@   page   import= "高考志愿指导.* "%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link href="查询样式.css" rel="stylesheet" type="text/css"> 
<script language="JavaScript" src="查询_功能.js" charset="UTF-8"> </script>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>高考志愿指导（高级查询）</title>
</head>

<body>
	<div class='body_colors'>
		<input type="button" id='color_1' value='' style="background-color:#5CADAD" onclick="body_color('#5CADAD')"/>
	    <input type="button" id='color_2' value='' style="background-color:#9999CC" onclick="body_color('#9999CC')"/>
	    <input type="button" id='color_3' value='' style="background-color:#02C874" onclick="body_color('#02C874')"/>
	</div><br>
	<h1>高考志愿指导（高级查询）</h1>
	<%
			request.setCharacterEncoding("UTF-8");
			String[] result;
			//每页显示记录数
			int PageSize = 20; //每页显示记录数
			int StartRow = 0; //开始显示记录的编号
			int PageNo=0;//需要显示的页数
			int CounterStart=0;//每页页码的初始值
			int CounterEnd=0;//显示页码的最大值
			int RecordCount=0;//总记录数;
			int MaxPage=0;//总页数
			int PrevStart=0;//前一页
			int NextPage=0;//下一页
			int LastRec=0;
			int LastStartRecord=0;//最后一页开始显示记录的编号
			//获取需要显示的页数，由用户提交
			if(request.getParameter("PageNo")==null){ //如果为空，则表示第1页
			  if(StartRow == 0){
			     PageNo = StartRow + 1; //设定为1
			  }
			}else{
			  PageNo = Integer.parseInt(request.getParameter("PageNo")); //获得用户提交的页数
			  StartRow = (PageNo - 1) * PageSize; //获得开始显示的记录编号
			}
			String km=request.getParameter("kemu");//文理科
		    String proe=request.getParameter("pro");//考生所在省份
		    int sco;//考生分数
		    int yer;//参考年份
		    String scst=request.getParameter("schoolsite");//学校所在省份
		    String paiwei=request.getParameter("site");//参考排位
		    String majn=request.getParameter("majorname");//专业名称
		    int i=0;
		    //多个if用于页面跳转
		    if(km==null){
		    	km="理科";
		    }
		    if(proe==null){
		    	proe="贵州";
		    }
		    if(request.getParameter("score")==null){
		    	sco=600;
		    }
		    else{
		    	sco=Integer.parseInt(request.getParameter("score"));
		    }
		    if(request.getParameter("years")==null||request.getParameter("years").equals("请选择参考年份：")){
		    	yer=1;
		    }
		    else{
		    	yer=Integer.parseInt(request.getParameter("years"));
		    }
		    if(scst==null||scst.equals("请输入学校所在地！")||scst.equals("")){
		    	scst="%";
		    }
		    if(paiwei==null||paiwei.equals("请选择参考排位：")){
		    	paiwei="midlle";
		    }
		    if(majn==null||majn.equals("请输入您想填报的专业！")||majn.equals("")){
		    	majn="%";
		    }   
		    getMessage getmessage=new getMessage();
		    result=getmessage.getResult_high(proe,km,sco,PageNo,yer,scst,paiwei,majn);
		    int count=result.length;
		    RecordCount=Integer.parseInt(result[count-1]);
		    MaxPage = RecordCount % PageSize;
		    if(RecordCount % PageSize == 0){
		      MaxPage = RecordCount / PageSize;
		    }else{
		       MaxPage = RecordCount/PageSize+1;
		    }
	%>
	<div class = "div_select">
		<form method="post" name="form1" target="_self" id="form1" action="简单查询.jsp">
		  <p>	 
		    <label>
		      <input name="简单查询" type="radio" id="查询方式_1" value="low-level" onclick="document.getElementById('form1').submit();"/>
		      简单查询</label>
	         <label>
		      <input name="高级查询" type="radio" id="查询方式_0" value="high-level" checked="checked" />
		      高级查询</label>
		    <br />
		  </p>
		</form>
	</div>
	<form method="post" name="form2" target="_self" id="form2" action="高级查询.jsp" onsubmit="return check_form(this)">
		<div class="div_2" align="center">
			<table cellpadding="0" cellspacing="0" border="0"> 
				<tr  height="30"> 
					<td width="200">
						参考年份：<br>
						 <select name="years" >
					  		<%if(yer==1){%>
					  			<option value="1" selected>近一年</option>
					  			<option value="2">近两年</option>
						  		<option value="3">近三年</option>
						  		<option value="4">近四年</option>
					  		<%}else if(yer==2){%>
					  			<option value="2" selected>近两年</option>
					  			<option value="1">近一年</option>
			  					<option value="3">近三年</option>
						  		<option value="4">近四年</option>
						  	<%}else if(yer==3){%>
						  		<option value="3" selected>近三年</option>
						  		<option value="1">近一年</option>
						  		<option value="2">近两年</option>
						  		<option value="4">近四年</option>
					  		<%}else {%>
					  			<option value="4" selected>近四年</option>
					  			<option value="1">近一年</option>
						  		<option value="2">近两年</option>
						  		<option value="3">近三年</option>
			  				<% }%>
					    </select>
				
					</td>
					<td width="200">
						考生类别：<br>
			    		<select name="kemu" id="kemus">
					  		<option value=<%=km %> selected><%=km %></option>
					  		<%if(km.equals("理科")){%>
					  			<option value="文科">文科</option>
					  		<%}else{%>
					  			<option value="理科">理科</option>
					  		<%} %>					  		
			    		</select>
	    				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    			</td>
	    		<td width="200">
	    			参考排位：
	    			<select name="site" >
					  		<%if(paiwei.equals("hight")){%>
					  			<option value="hight" selected>此分数最高排位位</option>
					  			<option value="midlle">此分数中间排位</option>
			  					<option value="low">此分数最低排位</option>
					  		<%}else if(paiwei.equals("midlle")){%>
					  			<option value="midlle" selected>此分数中间排位</option>
					  			<option value="hight">此分数最高排位位</option>
			  					<option value="low">此分数最低排位</option>
					  		<%}else {%>
					  			<option value="low" selected>此分数最低排位</option>
					  			<option value="hight">此分数最高排位位</option>
					  			<option value="midlle">此分数中间排位</option>
			  				<% }%>
		    	  </select>
		    	</td></tr>
	   		<tr  height="30"> 
		    	<td width="200">
		    		
			   		考生所在省份:<input width="200" class="province" type="text" value=<%=proe%> id="txt_4province" name="pro" onclick="txt_pro('txt_4province')" onmouseover="div_pro('txt_4province','div_4pro')"/>
					<div id="div_4pro" class="cla_pro">
					<div id="div_41" class="cla_pro_zimu">
					        <input id="butn1" type="button" value="ABCFG">
					        <input id="butn2" type="button" value="HJLNQ">
					        <input id="butn3" type="button" value="STXY">
					</div>
					<div id="div_4provinces" class="cla_pro_name">
						<div id="div_4provinces1">
					        &nbsp;A	<input id="butn_a" type="button" value="安徽"><br />
					        &nbsp;B	<input id="butn_b" type="button" value="北京"><br />
					        &nbsp;C	<input id="butn_c" type="button" value="重庆"><br />
					        &nbsp;F	<input id="butn_f" type="button" value="福建"><br />
					        &nbsp;G	<input id="butn_g1" type="button" value="广东">
					            <input id="butn_g2" type="button" value="广西">
					            <input id="butn_g3" type="button" value="甘肃">
					            <input id="butn_g4" type="button" value="贵州">
					    </div>
					    <div id="div_4provinces2">
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
					    <div id="div_4provinces3">
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
				<td width="200">	
				</td>	
	   			<td width="200">
	   				学校所在省份:
					<input name="schoolsite" value=<%=scst%> id='schoolst' type="text"  onclick="txt_pro('schoolst')" onmouseover="div_pro('schoolst','div_5pro')"/>
						<div id="div_5pro" class="cla_pro">
					<div id="div_51" class="cla_pro_zimu">
					        <input id="butn1" type="button" value="ABCFG">
					        <input id="butn2" type="button" value="HJLNQ">
					        <input id="butn3" type="button" value="STXY">
					</div>
					<div id="div_5provinces" class="cla_pro_name">
						<div id="div_5provinces1">
					        &nbsp;A	<input id="butn_a" type="button" value="安徽"><br />
					        &nbsp;B	<input id="butn_b" type="button" value="北京"><br />
					        &nbsp;C	<input id="butn_c" type="button" value="重庆"><br />
					        &nbsp;F	<input id="butn_f" type="button" value="福建"><br />
					        &nbsp;G	<input id="butn_g1" type="button" value="广东">
					            <input id="butn_g2" type="button" value="广西">
					            <input id="butn_g3" type="button" value="甘肃">
					            <input id="butn_g4" type="button" value="贵州">
					    </div>
					    <div id="div_5provinces2">
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
					    <div id="div_5provinces3">
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
		    <tr  height="30"> 
				<td width="200">
					专业名称：
		    		<input name="majorname" value=<%=majn%> id='major' type="text"  onClick="this.style.color='black';this.value='';" onBlur="this.style.color=''"/>
		    	</td>
		    	<td width="200">
		    		<br>
		    		<input type="submit" value="提交" />	
				</td>	
		    	<td width="200">
		    		考生分数：
					<input width="200" name="score" type="text" value=<%=sco%> id="scores" onClick="this.style.color='black';this.value='';" onBlur="this.style.color=''"/>					
		    	 </td>
		    </tr>
	   		</table>
	      </div>
	      <p class="STYLE13" align="center">注：对于未选择的选项为默认值（“%”表示）！</p>
	<div class="div_3" align="center">
		<%
		    if(result.length>1){
		%>
			<table cellpadding="0" cellspacing="0" border="1" align="center"> 
		 		 <tr bgcolor="	#7373B9">
		 		 	<th scope="col">考生省份</th>
		 		 	<th scope="col">科目</th>	
		 		 	<th scope="col">学校排名</th>	 		 	
				    <th scope="col">学校名称</th>
				    <th scope="col">学校所在省份</th>
				    <th scope="col">专业名称</th>
				    <th scope="col">2013年平均分</th>
				    <th scope="col">2014年平均分</th>
				    <th scope="col">2015年平均分</th>
				    <th scope="col">2016年平均分</th>
				    <th scope="col">录取批次</th>
				  </tr>
	   <% 
	   	int k=0;
		 while(i<result.length-1)
		   { 
			 k++;
			 if(k%2==0){
			 %> 
			  <tr align="center" height="30"> 
			 <%}else{%>
				<tr align="center" height="30" bgcolor="#E1E1E1"><%}%>
			  <td><%=result[i++]%></td>
			 	<td><%=result[i++]%></td>
			 	<td><%=result[i++]%></td>
			  	<td><%=result[i++]%></td> 
			   <td><%=result[i++]%></td>
			   <td><%=result[i++]%></td>
			   <td><%=result[i++]%></td>
			   <td><%=result[i++]%></td>
			   <td><%=result[i++]%></td>
			   <td><%=result[i++]%></td>
			   <td><%=result[i++]%></td>
			   </tr>
	 		<%
			}
	%>
		</table>
	<p>
	<%}
		else{%><br><font class="STYLE13">没有符合条件的讯息，请检查输入的分数、专业、以及学校所在地是否有效！</font><%} %>
	</p> 
	</div>
	<div align="center">
			<table width="100%" border="0" class="InternalHeader" >
			 <tr>
			    <td>
			    <span class="STYLE13"><font>总共<%=RecordCount%>条记录 - 当前页：<%=PageNo+1+"/"+MaxPage %></font></span></td>
			    <td><select name="PageNo" id="PageNos" >
					<%for(int j=0;j<MaxPage;j++){ %>
					<option value=<%=j%> onclick="document.getElementById('form2').submit();">第<%=j+1%>页</option>
			  		<%} %>
				</select></td>
			 </tr>
			</table>
		</div>
</form>
	
</body>
</html>