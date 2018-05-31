<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.min.1.8.2.js" type="text/javascript"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script type="text/javascript" src="js/slide.js"></script>
<script src="js/common_js.js" type="text/javascript"></script>
<script src="js/jquery.foucs.js" type="text/javascript"></script>
<title>修改密码</title>
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
<!--修改密码样式-->
<div class="user_style clearfix" id="user">
<div class="user_title"><em></em>用户中心</div>
  <div class="clearfix user" >
  <!--左侧菜单栏样式-->
  <div class="user_left">
      <div class="user_info">
       <div class="Head_portrait"><img src="images/people.png"  width="80px" height="80px"/><!--头像区域--></div>
       <div class="user_name">用户蜜甘草<a href="#">[个人资料]</a></div>
      </div>
      <ul class="Section">
       <li><a href="#"><em></em><span>我的特色馆</span></a></li>
       <li><a href="user_info.jsp"><em></em><span>个人信息</span></a></li>
       <li><a href="user_Password.jsp"><em></em><span>修改密码</span></a></li>
       <li><a href="#"><em></em><span>我的订单</span></a></li>
       <li><a href="#"><em></em><span>我的评论</span></a></li>
       <li><a href="user_integral.jsp"><em></em><span>我的积分</span></a></li>
       <li><a href="user_Collect.jsp"><em></em><span>我的收藏</span></a></li>
       <li><a href="user_address.jsp"><em></em><span>收货地址管理</span></a></li>
      </ul>
    </div>
    <!--右侧样式-->
    <div class="right_style r_user_style user_right">
      <div class="user_Borders">     
       <div class="title_name">
        <span class="name">修改密码</span>
       </div>
       <!--修改密码样式-->
       <div class="about_user_info">
        <form id="form1" name="form1" method="post" action="">   
       <div class="user_layout">
         <ul >
          <li><label class="user_title_name">原密码：</label><input name="" type="password"  class="add_text"/><i>*</i></li>
          <li><label class="user_title_name">新密码：</label><input name="" type="password"  class="add_text"/><i>*</i></li>
          <li><label class="user_title_name">确认新密码：</label><input name="" type="password"  class="add_text"/><i>*</i></li>         
         </ul>
         <div class="operating_btn"><input name="name" type="submit" value="确认"  class="submit—btn"/></div>
         </div>
          </form>
        
       </div>
      </div>
    </div>
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

