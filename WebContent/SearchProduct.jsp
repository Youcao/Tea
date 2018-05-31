<%@page import="com.orcale.tea.model.bean.PageBean"%>
<%@page import="com.orcale.tea.model.bean.product"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" tyle="text/css" />
<!--  <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />-->
<script src="js/jquery.min.1.8.2.js" type="text/javascript"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="js/common_js.js" type="text/javascript"></script>
<script src="js/footer.js" type="text/javascript"></script>
<!--[if IE 7]>
<link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css">
<![endif]-->
<title>产品列表</title>
</head>

<body>
<input type="hidden"  id="nowPage" value="1"/>
<!--顶部样式-->
<c:import url="top.jsp"></c:import>
<!--导航栏样式-->
<div id="Menu" class="clearfix">
<div class="Menu_style">
  <div id="allSortOuterbox" class="display">
    <div class="Category"><a href="#" class="Menu_img"><em></em></a></div>
    <div class="hd_allsort_out_box_new">
	 <!--左侧栏目开始-->
	 <div class="Menu_list">	
	    <div class="menu_title">茶叶品种</div>
        <a href="#">贡茗茶</a><a href="#">冠茗茶</a><a href="#">佳茗茶</a><a href="#">珍茗茶</a><a href="#">绿茶</a><a href="#">毛尖茶</a>
	</div>	
    <div class="Menu_list">	
	    <div class="menu_title">茶叶价格</div>
        <a href="#">100以下</a><a href="#">100-200</a><a href="#">200-400</a><a href="#">400-600</a><a href="#">600-900</a><a href="#">1000以上</a>
	</div>	
     <div class="Menu_list">	
	    <div class="menu_title">推荐茶叶</div>
        <ul class="recommend">
         <li><a href="#" title="[2015年新茶]巴山雀舌毛尖茶新茶，含硒">[2015年新茶]巴山雀舌...</a></li>
         <li><a href="#" title="[2015年新茶]巴山雀舌毛尖茶新茶，含硒">[2015年新茶]巴山雀舌...</a></li>
         <li><a href="#" title="[2015年新茶]巴山雀舌毛尖茶新茶，含硒">[2015年新茶]巴山雀舌...</a></li>
         <li><a href="#" title="[2015年新茶]巴山雀舌毛尖茶新茶，含硒">[2015年新茶]巴山雀舌...</a></li>
         <li><a href="#" title="[2015年新茶]巴山雀舌毛尖茶新茶，含硒">[2015年新茶]巴山雀舌...</a></li>
        </ul>
	</div>	
	</div>		
	</div>
    <div class="Navigation" id="Navigation">
		 <ul class="Navigation_name">
			<li><a class="nav_on" id="mynav1"  href="index.jsp"><span>首页</span></a></li>
			<li><a class="nav_on" id="mynav2"  href="#"><span>巴山雀舌</span></a></li>
			<li><a class="nav_on" id="mynav3"  href="#"><span>贡茗</span></a></li>
			<li><a class="nav_on" id="mynav4"  href="#"><span>冠茗</span></a></li>
			<li><a class="nav_on" id="mynav5"  href="#"><span>臧芝堂（藏茶）</span></a></li>
			<li><a class="nav_on" id="mynav6"  href="#"><span>大巴山（茗茶）</span></a></li>
			<li><a class="nav_on" id="mynav7"  href="#"><span>达州（茶）</span></a></li>
			<li><a class="nav_on" id="mynav8"  href="#"><span>活动</span></a></li>
			<li><a class="nav_on" id="mynav8"  href="#"><span>联系我们</span></a></li>
		 </ul>			 
		</div>
	<script>$("#Navigation").slide({titCell:".Navigation_name li"});</script>
    <!--购物车-->	
    
     <div class="hd_Shopping_list" id="Shopping_list">
   <div class="s_cart"><em></em><a href="#">我的购物车</a> <i class="ci-right">&gt;</i><i class="ci-count" id="shopping-amount">0</i></div>
   <div class="dorpdown-layer">
    <div class="spacer"></div>
	 <!--<div class="prompt"></div><div class="nogoods"><b></b>购物车中还没有商品，赶紧选购吧！</div>-->
	 <ul class="p_s_list">	   
		<li>
		    <div class="img"><img src="images/title_img.png"></div>
		    <div class="content"><p><a href="#">产品名称</a></p><p>颜色分类:紫花8255尺码:XL</p></div>
			<div class="Operations">
			<p class="Price">￥55.00</p>
			<p><a href="#">删除</a></p></div>
		  </li>
		</ul>		
	 <div class="Shopping_style">
	 <div class="p-total">共<b>1</b>件商品　共计<strong>￥ 515.00</strong></div>
	  <a href="shopping_cart.jsp" title="去购物车结算" id="btn-payforgoods" class="Shopping">去购物车结算</a>
	 </div>	 
   </div>	
  </div>
</div>
</div>
<!--内页样式-->
 <div class="Inside_pages">
    <div class="products">
    <!--当前位置（面包屑）-->
     <div class="Location_link">
     <em></em><a href="#">产品中心</a>  &lt;   <a href="#">巴山雀舌</a>  
     </div>
    <!--筛选条件样式-->
      <div class="products_Select marginbottom">
       <div class="Filter">
  <div class="Filter_list clearfix">
   <div class="Filter_title"><span>品牌：</span></div>
   <div class="Filter_Entire"><a href="#">全部</a></div>
   <div class="p_f_name">
    <a href="#" title="莱家/Loacker">莱家/Loacker </a>  
	<a href="#" title="">丽芝士/Richeese</a>  
	<a href="#" title="白色恋人/SHIROI KOIBITO ">白色恋人/SHIROI KOIBITO </a> 
	<a href="#">爱时乐/Astick </a> 
	<a href="#">利葡/LiPO </a> 
	<a href="#">友谊牌/Tipo </a> 
	<a href="#"> 三立/SANRITSU  </a>  
	<a href="#"> 皇冠/Danisa </a>  
	<a href="#">丹麦蓝罐/Kjeldsens</a>  
   </div>
  </div>
  <div class="Filter_list clearfix">
  <div class="Filter_title"><span>包装方式：</span></div>
  <div class="Filter_Entire"><a href="#">全部</a></div>
  <div class="p_f_name">
  <a href="#">袋装</a><a href="#">盒装</a><a href="#">罐装</a><a href="#">礼盒装</a><a href="#">散装(称重)</a>
  </div>
  </div>
  <div class="Filter_list clearfix">
  <div class="Filter_title"><span>价格：</span></div>
  <div class="Filter_Entire"><a href="#">全部</a></div>
  <div class="p_f_name">
    <a href="#">0-50</a><a href="#">50-150</a><a href="#">150-500</a><a href="#">500-1000</a><a href="#">1000以上</a>
  </div>
  </div>
 </div>
      </div>
      <!--产品列表列表-->
      <div class="products_list marginbottom">
      <div class="Sorted">
  <div class="Sorted_style">
   <a href="#" class="on">综合<i class="icon-angle-down"></i></a>
   <a href="#">销量<i class="icon-angle-down"></i></a>
   <a href="#">价格<i class="icon-angle-down"></i></a>
   <a href="#">新品<i class="icon-angle-down"></i></a>
   </div>
   <!--页数-->
   <div class="s_Paging">
   <span> 1/12</span>
   <a href="#" class="on">&lt;</a>
   <a href="#">&gt;</a>
   </div>
 </div>
 <!--产品列表样式-->
 <div class="p_list  clearfix">
   <ul>
    
	<%
	ArrayList<product>  allproduct =(ArrayList<product>)request.getAttribute("product");
	for(product p:allproduct)
	{
		%>
		 <li class="gl-item">
	<div class="Borders">
	 <div class="img"><a href="productServlet?method=detail&teaid=<%=p.getTeaid() %>"><img src="<%=p.getMainimag() %>" style="width:220px;height:220px"/></a></div>	 
	 <div class="name"><a href="productServlet?method=detail&teaname=<%=p.getTeaname()%>"><%=p.getTeaname() %></a></div>
     <div class="Price">商城价：<b>¥<%=p.getShangchengjia() %></b><span>原价：<em>¥<%=p.getYuanjia() %></em></span></div>
	 <div class="Review">已有<a href="#">2345</a>评论</div>
	 <div class="p-operate">
	  <a href="Product_Detailed.jsp?teaId=<%=p.getTeaid()%>" class="p-o-btn Collect"><em></em>详情</a>
	  <a href="shoppingCarServlet?method=add&teaid=<%=p.getTeaid()%>" class="p-o-btn shop_cart"><em></em>加入购物车</a>
	 </div>
	 </div>
	</li>
		<%
	}
	%>
	
   </ul>
   <div class="Paging_style">
     <a href="#" class="pn-prev disabled">&lt;上一页</a>
	 <a href="#" class="on">1</a>
	 <a href="#">2</a>
	 <a href="#">3</a>
	 <a href="#">4</a>
	 <a href="#">下一页&gt;</a>
	 <a href="#">尾页</a>
	<span class="p-skip"><em>共<b>232</b>页&nbsp;&nbsp;到第</em><input id="page_jump_num" value="1" onkeydown="javascript:if(event.keyCode==13){page_jump();return false;}" class="input-txt"><em>页</em><a href="javascript:page_jump();" class="btn btn-default">确定</a></span>
   </div>
   <div style="width: 100%;margin: auto;text-align: center;">
						 
						<a  href="productServlet?method=searchlistproductByPage&searchpage=1&searchcount=15"  class="pages">首页</a>
						<a  href="productServlet?method=searchlistproductByPage&searchpage=${requestScope.pageBean.previousPage}&searchcount=15"  class="pages">上一页</a>
						<a  href="productServlet?method=searchlistproductByPage&searchpage=2&searchcount=15"  class="pages">下一页</a>
						<a  href="productServlet?method=searchlistproductByPage&searchpage=${requestScope.pageBean.allPages}&searchcount=15"  class="pages">尾页</a>
						
						当前第${requestScope.pageBean.nowPage}页/总共${requestScope.pageBean.allPages}页，
						每页${requestScope.pageBean.everPageCount}条/总共${requestScope.pageBean.allCount}条,
						跳到第
						
						
						</div>
  
 </div>
      </div>
      <!--分页样式-->
    <div class="Paging marginbottom">
    
    </div>
    </div>    
      <div style="margin: auto;display: none;" id="loading"><img src="images/loading.gif" style="width: 50px;height: 50px;"/></div>   
      <!--友情链接-->
       <div class="Links">
        <div class="link_title">友情链接</div>
        <div class="link_address"><a href="#">四川茶叶协会</a>  <a href="#">链接地址</a>  <a href="#">链接地址</a>  <a href="#">链接地址 </a>   <a href="#">链接地址</a> <a href="#">链接地址</a> <a href="#">链接地址</a></div>
       </div>
 </div>
 <!--底部样式-->
<c:import url="foot.jsp"></c:import>

		<script type="text/javascript">
			$(document).ready(function(){
				$("#goto").change(function(){
					location.href='productServlet?method=searchlistproductByPage&searchpage='+$(this).val()+'&searchcount=15';//用js发起请求
				})
			})
		</script>
</body>
</html>
<script>
	$(document).ready(function(){
		$(window).scroll(function(){
			var scrollTop = $(this).scrollTop();
			var scrollHeight = $(document).height();
			var windowHeight = $(this).height();
			if(Math.round(scrollTop) + windowHeight >= scrollHeight){
				
				$("#loading").css("display","block");
				setTimeout(function(){
					//1.当滚动到网页地步当时候应该发起ajax请求下一页当数据
					var  nowPage=$("#nowPage").val();
					$.get("productServlet?method=listTeaByAjaxRequest&page="+(nowPage+1)+"&count=15",function(data){
						for(var  n=0;n<data.length;n++)
						{
							//var  newCar="<li><a   name='sellCar'   href='CarServlet?method=detail&carid="+data[n].id+"' class='single-image video picture'><img style='width: 200px;height: 120px;' src='"+data[n].image+"' alt='' /></a><a href='CarServlet?method=detail&carid="+data[n].id+"' class='list-meta'><h6 class='title-list-item'>"+data[n].goumaishijian+"&nbsp;"+data[n].pailiang+"&nbsp;"+data[n].xilie+"</h6></a><div class='detailed'><span class='cost'>"+data[n].jiage+"万</span><span>"+data[n].pailiang+"</span> <br /><b>"+data[n].gonglishu+"公里</b></div><a href='CarServlet?method=detail&carid="+data[n].id+"' class='button orange'>详情</a>&nbsp;<a href='ShoppingCarServlet?method=add&carid="+data[n].id+"'  target='_blank'><img onmouseover=this.style.boxShadow='-1px  -1px  12px red' onmouseout=this.style.boxShadow=''  src='images/shoppingCar.png' width='25' height='25' title='添加到购物车' style='margin: 0px;padding: 0px;position: relative;top: 8px;border-radius:12.5px' /></a><label class='compare'><input  name='compare'  value='"+data[n].id+"'  type='checkbox' /><a href='javascript:compare()'>比较</a></label></li>"
							var  newTea="<li class='gl-item'><div class='Borders'><div class='img'><a href='productServlet?method=detail&teaid="+data[n].teaid+"'><img src='"+data[n].image+"' style='width:220px;height:220px'/></a></div>	 <div class='name'><a href='productServlet?method=detail&teaid="+data[n].teaid+"'>"+data[n].teaname+"</a></div><div class='Price'>商城价：<b>¥"+data[n].shangchengjia+"</b><span>原价：<em>¥"+data[n].yuanjia+"</em></span></div><div class='Review'>已有<a href='#'>2345</a>评论</div><div class='p-operate'><a href='#' class='p-o-btn Collect'><em></em>收藏</a><a href='shoppingCarServlet?method=add&teaid="+data[n].teaid+"' class='p-o-btn shop_cart'><em></em>加入购物车</a></div></div></li>"
							$("#ajaxTea").append(newTea);
						}
						$("#loading").css("display","none");
					});
				}, 5000);
					
			}
		})
	})
</script>