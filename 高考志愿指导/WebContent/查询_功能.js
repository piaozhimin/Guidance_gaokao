/**
 * 查询界面的js功能
 */

function shuomings(){
	alert("本页面是高考志愿查询总界面，你可以根据需要选择简单查询（选择考生类别、输入考生省份与分数，即可获得较为广泛的查询结果）或者高级查询（除了需要简单查询的三项外，还可以选择参考年份、参考排位（参考排位即此分数对应的第一名为最高排位，最后一名为最低排位），考生想要填报的专业，以及学校所在地，之后即可获得较为精确的查询结果（若未选择，则为默认值））!")
	}
function kaoshengProvince(){
	getElementById('provinces').style.color='black';
}
function hidden1(div_1,div_2){
	
	document.getElementById(div_1).style.display="none";
	document.getElementById(div_2).style.display="block";
}
//背景颜色改变函数
function body_color(color){
	document.body.style.backgroundColor=color;
}
function txt_pro(ids){
	var TxtP=document.getElementById(ids);
		TxtP.value="";	
		TxtP.style.color='red';
}
	
function div_pro(txt_p,div_p)
	{
		var aTxtP=document.getElementById(txt_p);
		var aDiv1=document.getElementById(div_p);
		var bDiv1=aDiv1.getElementsByTagName('div');
		var bBtn1=bDiv1[0].getElementsByTagName('input');		
		var cDiv1=bDiv1[1].getElementsByTagName('div');
		var cBtn1=bDiv1[1].getElementsByTagName('input');
		aTxtP.style.color='red';
		for(var j=0;j<bBtn1.length;j++){				
					cDiv1[j].style.display='none';
		};
		aDiv1.style.display='block';
		cDiv1[0].style.display='block';	
		aDiv1.onmouseover=function(){
			aDiv1.style.display='block';
		}		
		for(var i=0;i<bBtn1.length;i++)
		{
			bBtn1[i].index=i;			
			bBtn1[i].onclick=function()
			{
				for(var j=0;j<bBtn1.length;j++){
					bBtn1[j].className='';					
					cDiv1[j].style.display='none';
				};
				this.className='active';
				cDiv1[this.index].style.display='block';
			};
		};
		aDiv1.onmouseout=function()
		{
			aDiv1.style.display='none';
		};
		for(var k=0;k<cBtn1.length;k++){
			cBtn1[k].index=k;
			cBtn1[k].onclick=function()
			{
				aTxtP.value=cBtn1[this.index].value;
			};	
		};
		aTxtP.onmouseout=function()
		{
			aDiv1.style.display='none';
		};
	};
	
/**** 表单验证所用js ****/
	//验证是否为空
function check_empty(field,alerttxt){
	with (field)
	  {
	  if (value==null||value=="")
	    {alert(alerttxt);return false}
	  else {return true}
	  }
}
	//验证分数是否输入正确
function check_score(field,alerttxt){
	with (field)
	  {
	  if (value==null||value=="请输入您的分数！"||value=="")
	    {alert(alerttxt);return false}
	  else if(value<100||value>999){
		 alert("输入分数不正确（过大或过小）！");return false
	  }
	  else {return true}
	  }
}
	//验证考生省份
function check_province(field,alerttxt,checktxt){
	with (field)
	  {
		  if (value==null||value==checktxt||value=="")
		    {alert(alerttxt);return false}
		  else {return true}
		
	  }
}
	//验证选择框的正确
function check_select(field,alerttxt,checktxt){
	with (field)
	  {
	  if (value==null||value==checktxt)
	    {alert(alerttxt);return false}
	  else {return true}
	  }
}
//表单验证
function check_form(thisform){
	with(thisform){
		if(check_select(kemu,"考生类别未选择!","请选择文/理科！")==false)
		{kemu.focus();return false}
		if(check_province(pro,"考生省份未填!","请输入你所在的省份！")==false)
		{pro.focus();return false}
		if(check_score(score,"考生分数未填!")==false)
		{score.focus();return false}		
	}
}
