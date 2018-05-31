<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!--顶部样式-->
<div id="top">
  <div class="top">
    <div class="Collection"><em></em><a href="#">收藏我们</a></div>
	<div class="hd_top_manu clearfix">
	  <ul class="clearfix">
	   <li class="hd_menu_tit zhuce" data-addclass="hd_menu_hover">欢迎光临本店！<a href="login.jsp" class="red">
	   <c:if test="${empty sessionScope.loginedUser }">[请登录]</a> 
	   </c:if>
		<c:if test="${not empty sessionScope.loginedUser }">
			<span  class="loged">
			<img src="${sessionScope.loginedUser.image }" style="width: 16px;height: 16px;border-radius: 5px;position: relative;top: 3px"/>			
			<a  href="UserServlet?method=loadUserInfo&userid=${sessionScope.loginedUser.userid }" title="个人中心" onmouseover="this.style.textDecoration='underline'" onmouseout="this.style.textDecoration='' ">
			
			<span style="position: relative;top: 0px;color:red;">${sessionScope.loginedUser.nickname }</span>
			</a>
			
			<a  href="UserServlet?method=loginoff" style="color: green;text-shadow: -2px -2px 10px white">安全退出</a>			
			</span>
		</c:if>
		新用户<a href="registered.jsp" class="red">[免费注册]</a></li>
	   <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="#">我的订单</a></li> 
	   <li class="hd_menu_tit" data-addclass="hd_menu_hover"> <a href="#">购物车(<b>0</b>)</a> </li>
	   <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="#">联系我们</a></li>
	   <li class="hd_menu_tit list_name" data-addclass="hd_menu_hover"><a href="#" class="hd_menu">客户服务</a>
	    <div class="hd_menu_list">
		   <ul>
		    <li><a href="#">常见问题</a></li>
			<li><a href="#">在线退换货</a></li>
		    <li><a href="#">在线投诉</a></li>
			<li><a href="#">配送范围</a></li>
		   </ul>
		</div>	   
	   </li>
	  </ul>
	</div>
  </div>
</div>
<!--logo和搜索样式-->
<div id="header"  class="header">
  <div class="logo">
  <a href="#"><img src="images/logo.png" /></a>
  <div class="phone">
   免费咨询热线:<span class="telephone">400-3404-000</span>
  </div>
  </div>
  <div class="Search">
  <form action="productServlet"id="searchform" method="get">
  <input type="hidden"   name="method"  value="searchAny"/>
    <p>
    <% if(request.getParameter("key")!=null){ %>
	<input id="s" name="key" type="text"  class="text" value="<%=new String(request.getParameter("key").getBytes("UTF-8"))%>"/>
	<%}else{ %>
	<input id="s" name="key" type="text"  class="text" />
	<% }%>
    <input name="Search" type="submit" value=""  class="Search_btn"/>
    <table id="allteaname" style="width:100px;border:1px solid black;position: absolute ; display: none; width: 416px;top: 141px;font-family: Microsoft YaHei;">
	</table>
	</p>
	<!--  <p class="Words"><a href="#">西湖龙井</a><a href="#">茉莉花</a><a href="#">菊花</a><a href="#">西红柿</a><a href="#">橙子</a><a href="#">苹果</a></p>-->
</form>
</div>
</div>
<script src="js/jquery-1.7.2.min.js"></script>
<script>
$(document).ready(function(){
	/**
	搜索框模糊匹配ajax代码
	**/
	$("#s").keyup(function(){
		
		$.post("productServlet",
					{
						"key":$(this).val(),
						"method":"mohuSearch"
					},
					function(data,status){
						var   allteaname=data.getElementsByTagName("title");
						if(allteaname.length>0){
							$("#allteaname").css("display","block");
							
							  for (var i=0;i<document.getElementById("allteaname").rows.length;i++)
							     {
								  document.getElementById("allteaname").deleteRow(i);
							     }
							//document.getElementById("allPipei").rows.length=0;//清空表格之前的所有航
							for(var  n=0;n<allteaname.length;n++)
							{
								var  tr=document.getElementById("allteaname").insertRow();
								tr.style.width="416px";
								tr.style.cursor="pointer";
								
								var  td=tr.insertCell();
								td.innerHTML=allteaname[n].childNodes[0].nodeValue;
								td.style.textAlign="left";
								td.style.width="416px";
								td.style.cursor="pointer";
								td.onclick=function(){
									$("#s").val(this.innerHTML);
									$("#allteaname").css("display","none");
								}
								tr.onmouseover=function(){
									this.style.backgroundColor='skyblue';
								}
								tr.onmouseout=function(){
									this.style.backgroundColor='';
								}
							}
						}
					
						
					
				   })
	});
});

</script>
