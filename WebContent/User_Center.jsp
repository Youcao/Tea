<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" tyle="text/css" />
<script src="js/jquery.min.1.8.2.js" type="text/javascript"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="js/common_js.js" type="text/javascript"></script>
<script src="js/footer.js" type="text/javascript"></script>
<title>用户中心</title>
</head>
<body>
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
		    <div class="img"><img src="images/tianma.png"></div>
		    <div class="content"><p><a href="#">产品名称</a></p><p>颜色分类:紫花8255尺码:XL</p></div>
			<div class="Operations">
			<p class="Price">￥55.00</p>
			<p><a href="#">删除</a></p></div>
		  </li>
		</ul>		
	 <div class="Shopping_style">
	 <div class="p-total">共<b>1</b>件商品　共计<strong>￥ 515.00</strong></div>
	  <a href="#" title="去购物车结算" id="btn-payforgoods" class="Shopping">去购物车结算</a>
	 </div>	 
   </div>	
  </div>
</div>
</div>
<!--内页样式-->
<div class="user_style clearfix" id="user">
  <div class="user_title"><em></em>用户中心</div>
  <!--用户中心布局样式-->
   <!--栏目名称-->
   <div class="user_left">
     <div class="user_info">
       <div class="Head_portrait"><img src="${user.image }"  width="80px" height="80px"/><!--头像区域--></div>
       <div class="user_name">用户:${user.nickname }<a href="#">[个人资料]</a></div>
      </div>
      <ul class="Section">    
       <li><a href="#"><em></em><span>我的特色馆</span></a></li>
       <li><a href="UserServlet?method=UserInfo&userid=${sessionScope.loginedUser.userid }"><em></em><span>个人信息</span></a></li>
       <li><a href="user_Password.jsp"><em></em><span>修改密码</span></a></li>
       <li><a href="#"><em></em><span>我的订单</span></a></li>
       <li><a href="#"><em></em><span>我的评论</span></a></li>
       <li><a href="user_integral.jsp"><em></em><span>我的积分</span></a></li>
       <li><a href="user_Collect.jsp"><em></em><span>我的收藏</span></a></li>
       <li><a href="user_address.jsp"><em></em><span>收货地址管理</span></a></li>
      </ul>
   </div>
 <!--右侧内容展示-->
  <div class="right_style r_user_style">
  <div class="Notice"><span>系统最新公告:</span>为了更好地服务于【每日鲜】的会员朋友及读者 发表意见。</div> 
   <!--用户基本信息-->
   <div class="clearfix">
    <div class="user_info clearfix">
	     <div class="user_name_info">
          <ul>
	       <li class="us_one">
	        <div class="name left">用户名:<b>${user.nickname }</b>,  欢迎你 [<a href="user_Password.jsp">修改密码</a>]  </div>
	        <div class="right time"> <span>上次访问时间：2015-5-21 10:23</span></div>
	      </li>
	      <li class="us_two"> 
	      <dl><dt class="left">账户余额：</dt><dd>￥<b>0</b>元</dd></dl>
	   <dl><dt class="left">账户积分：</dt><dd><b>2355</b>分 &nbsp;<a href="#">[积分商城]</a></dd></dl>
	   <dl><dt class="left">用户等级：</dt><dd><b>${user.userlevel}</b></dd></dl>
	  </li>
	  <li class="us_Order">
	   <dl><dt class="left">未完成订单：</dt><dd><a href="#">0</a></dd></dl>
	   <dl><dt class="left">完成订单：</dt><dd><a href="#">2</a></dd></dl>
	  </li>
	  <li class="us_four">
	  <div class="Address"><em></em><a href="user_address.jsp">地址管理&gt;</a></div>
	  </li>
	 </ul>
    </div>
   </div>  
  </div>
  <!--订单-->
   <div class="user_info_p_s clearfix">
    <div class="left_user_cont">
     <div class="us_Orders left clearfix">
  <div class="Orders_name">
   <div class="title_name">
   <div class="Records">购买记录</div>
   <div class="right select">
   只记录你最近30天的购买记录   </div>
   </div>   
  </div>
  <table>
  <thead>
  <tr>
   <th>产品名称</th>
   <th>数量</th>
   <th>状态</th>
   <th>操作</th>
   </tr>
  </thead>
  <tbody>
   <tr>
    <td class="img">
<a href="#"><span class="left"><img src="common/images/cp-2.jpg"></span>
	<span class="left">产品名称敬龙云</span></a>
	</td>
	<td>2</td>
	<td>完成</td>
	<td><a href="#">查看</a></td>
   </tr>
    <tr>
    <td class="img">
<a href="#"><span class="left"><img src="common/images/cp-2.jpg"></span>
	<span class="left">产品名称敬龙云</span></a>
	</td>
	<td>2</td>
	<td>完成</td>
	<td><a href="#">查看</a></td>
   </tr>
   </tbody>
  </table>
   <div class="us_jls">共2条记录</div>
  </div>
    </div> 
    <!--右侧记录样式-->
    <div class="right_user_recording">
    <div class="us_Record">
	  <div id="Record_p" class="Record_p">
	    <div class="title_name">
		<span class="name left">浏览历史</span>
		 <span class="pageState right"><span>1</span>/7</span>		</div>
	 
						<div class="hd">
							<a class="next">&lt;</a>
							<a class="prev">&gt;</a>						</div>
						<div class="bd">
						<ul >
                        <li class="clone">
							<div class="p_width">
								<div class="pic"><a href=""><img src="Products/11.jpg"></a></div>	
								<div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
								<div class="Purchase_info"><span class="p_Price">￥32.50</span> <a href="#" class="Purchase">立即购买</a></div>
							</div>	
								</li>
							<li >
							<div class="p_width">
								<div class="pic"><a href=""><img src="Products/11.jpg"></a></div>	
								<div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
								<div class="Purchase_info"><span class="p_Price">￥32.50</span> <a href="#" class="Purchase">立即购买</a></div>
							</div>		
							</li>
								<li >
								<div class="p_width">
								<div class="pic"><a href=""><img src="Products/9.jpg"></a></div>	
								<div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
								<div class="Purchase_info"><span class="p_Price">￥32.50</span> <a href="#" class="Purchase">立即购买</a></div>
							</div>	
								</li>
								<li >
									<div class="p_width">
								<div class="pic"><a href=""><img src="Products/8.jpg"></a></div>	
								<div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
								<div class="Purchase_info"><span class="p_Price">￥32.50</span> <a href="#" class="Purchase">立即购买</a></div>
							</div>							
								</li>
								<li >
									<div class="p_width">
								<div class="pic"><a href=""><img src="Products/7.jpg"></a></div>	
								<div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
								<div class="Purchase_info"><span class="p_Price">￥32.50</span> <a href="#" class="Purchase">立即购买</a></div>
							</div>							
								</li>
                                	<li >
									<div class="p_width">
								<div class="pic"><a href=""><img src="Products/6.jpg"></a></div>	
								<div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
								<div class="Purchase_info"><span class="p_Price">￥32.50</span> <a href="#" class="Purchase">立即购买</a></div>
							</div>				
								</li>
                                	<li >
									<div class="p_width">
								<div class="pic"><a href=""><img src="Products/5.jpg"></a></div>	
								<div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
								<div class="Purchase_info"><span class="p_Price">￥32.50</span> <a href="#" class="Purchase">立即购买</a></div>
							</div>	
								</li>
                                	<li >
									<div class="p_width">
								<div class="pic"><a href=""><img src="Products/3.jpg"></a></div>	
								<div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
								<div class="Purchase_info"><span class="p_Price">￥32.50</span> <a href="#" class="Purchase">立即购买</a></div>
							</div>	
								</li>
								<li class="clone" >
							<div class="p_width">
								<div class="pic"><a href=""><img src="Products/12.jpg"></a></div>	
								<div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
								<div class="Purchase_info"><span class="p_Price">￥32.50</span> <a href="#" class="Purchase">立即购买</a></div>
							</div>		
							</li></ul></div>
						
					</div>
					<script type="text/javascript">jQuery("#Record_p").slide({ mainCell:".bd ul",effect:"leftLoop",vis:1,autoPlay:false });</script>
	    </div>
    </div>
   </div>
   <!--收藏商品-->
   <div class="Collections_p">
   <div class="title_name">收藏的商品</div>
    <div id="Collect_Products" class="Collect_Products">
						<div class="hd">
							<a class="next">&lt;</a>
							<a class="prev">&gt;</a>
						</div>
						<div class="bd">
							<ul >
                            <li class="clone" style="float: left; width: 160px;">
							<div class="pic"><a href=""><img src="Products/11.jpg"></a></div>	
						<div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
									<div class="p_Price">￥32.50</div>		
								</li>
								<li style="float: left; width: 160px;">
									<div class="pic"><a href=""><img src="Products/12.jpg"></a></div>
									<div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
									<div class="p_Price">￥32.50</div>
								</li>
								<li style="float: left; width: 160px;">
									<div class="pic"><a href=""><img src="Products/10.jpg"></a></div>	
									<div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
									<div class="p_Price">￥32.50</div>							
								</li>
								<li style="float: left; width: 160px;">
										<div class="pic"><a href=""><img src="Products/9.jpg"></a></div>	
									<div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
									<div class="p_Price">￥32.50</div>								
								</li>
                                	<li style="float: left; width: 160px;">
										<div class="pic"><a href=""><img src="Products/8.jpg"></a></div>	
									<div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
									<div class="p_Price">￥32.50</div>					
								</li>
                                	<li style="float: left; width: 160px;">
										<div class="pic"><a href=""><img src="Products/1.jpg"></a></div>	
									<div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
									<div class="p_Price">￥32.50</div>		
								</li>
                                	<li style="float: left; width: 160px;">
										<div class="pic"><a href=""><img src="Products/1.jpg"></a></div>	
									<div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
									<div class="p_Price">￥32.50</div>		
								</li>
							<li class="clone" style="float: left; width: 160px;">
									<div class="pic"><a href=""><img src="Products/5.jpg"></a></div>
									<div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
									<div class="p_Price">￥32.50</div>
								</li><li class="clone" style="float: left; width: 160px;">
									<div class="pic"><a href=""><img src="Products/4.jpg"></a></div>	
									<div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
									<div class="p_Price">￥32.50</div>							
								</li><li class="clone" style="float: left; width: 160px;">
										<div class="pic"><a href=""><img src="Products/3.jpg"></a></div>	
									<div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
									<div class="p_Price">￥32.50</div>								
								</li><li class="clone" style="float: left; width: 160px;">
										<div class="pic"><a href=""><img src="Products/2.jpg"></a></div>	
									<div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
									<div class="p_Price">￥32.50</div>					
								</li><li class="clone" style="float: left; width: 160px;">
										<div class="pic"><a href=""><img src="Products/1.jpg"></a></div>	
									<div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
									<div class="p_Price">￥32.50</div>		
								</li></ul></div>
						</div>
					
	<script type="text/javascript">jQuery("#Collect_Products").slide({ mainCell:".bd ul",effect:"leftLoop",vis:5,autoPlay:false });</script>
 </div>
   <!--结束-->
 </div>
</div>
<div class="footerbox">
   <!--友情链接-->
       <div class="Links">
        <div class="link_title">友情链接</div>
        <div class="link_address"><a href="#">四川茶叶协会</a>  <a href="#">链接地址</a>  <a href="#">链接地址</a>  <a href="#">链接地址 </a>   <a href="#">链接地址</a> <a href="#">链接地址</a> <a href="#">链接地址</a></div>
       </div>
</div>
<!--底部样式-->
<c:import url="foot.jsp"></c:import>
</body>
</html>
