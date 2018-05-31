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
<!--<link rel="stylesheet" href="css/font-awesome-ie7.min.css">-->
<![endif]-->
<title>购物车</title>
<script type="text/javascript">
$(document).ready(function () {
   //全选
   $("#CheckedAll").click(function () {
	   if (this.checked) {                 //如果当前点击的多选框被选中
		   $('input[type=checkbox][name=checkitems]').attr("checked", true);
	   } else {
		   $('input[type=checkbox][name=checkitems]').attr("checked", false);
	   }
   });
   $('input[type=checkbox][name=checkitems]').click(function () {
	   var flag = true;
	   $('input[type=checkbox][name=checkitems]').each(function () {
		   if (!this.checked) {
			   flag = false;
		   }
	   });

	   if (flag) {
		   $('#CheckedAll').attr('checked', true);
	   } else {
		   $('#CheckedAll').attr('checked', false);
	   }
   });
   //输出值
   $("#send").click(function () {
	      if($("input[type='checkbox'][name='checkitems']:checked").attr("checked")){
	   var str = "你是否要删除选中的商品：\r\n";
	   $('input[type=checkbox][name=checkitems]:checked').each(function () {
		   str += $(this).val() + "\r\n";
	   })
	   alert(str);
		  }
		  else{
			   var str = "你为选中任何商品，请选择后在操作！"; 
			   alert(str);
       }
	   	    
   });
})
</script>
</head>
<!--宽度1000的购物车样式-->
<body>
<div id="top">
  <div class="carts">
    <div class="Collection"><em></em><a href="#">收藏我们</a></div>
	<div class="hd_top_manu clearfix">
	  <ul class="clearfix">
	   <li class="hd_menu_tit zhuce" data-addclass="hd_menu_hover">欢迎光临本店！<a href="#" class="red">[请登录]</a> 新用户<a href="#" class="red">[免费注册]</a></li>
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
<div id="shop_cart">
 <div id="header">
  <div class="logo">
  <a href="#"><img src="images/logo.png" /></a>
  <div class="phone">
   免费咨询热线:<span class="telephone">400-3454-343</span>
  </div>
  </div>
  <div class="Search">
    <p><input name="" type="text"  class="text"/><input name="" type="submit" value=""  class="Search_btn"/></p>
	<p class="Words"><a href="#">苹果</a><a href="#">香蕉</a><a href="#">菠萝</a><a href="#">西红柿</a><a href="#">橙子</a><a href="#">苹果</a></p>
 </div>
</div>
<!--提示购物步骤-->

 <div class="prompt_step">
  <img src="images/cart_step_01.png" />
 </div>
 <!--购物车商品-->
 <div class="Shopping_list">
  <div class="title_name">
    <ul>
	<li class="checkbox">&nbsp;</li>
	<li class="name">商品名称</li>
	<li class="scj">市场价</li>
	<li class="bdj">本店价</li>
	<li class="sl">购买数量</li>
	<li class="xj">小计</li>
	<LI class="cz">操作</LI>
  </ul>
 </div>
 
  <div class="shopping">
  <form  method="post" action="">
 <table class="table_list">
 <c:if test="${empty  sessionScope.products}">
	<tr><td colspan="7">客官，您的购物车比您的脸还干净，您是否要去购买点东西呢?<a href="index.jsp">去首页逛逛</a></td></tr>
	</c:if>
	<c:forEach var="s"  items="${sessionScope.products}">
	 <tr class="tr">
   <td class="checkbox"><input name="checkitems" type="checkbox" value="" /></td>
    <td class="name">
	  <div class="img" name="img"><a href="productServlet?method=detail&teaid=${s.key.teaid }">
	  <img src="${s.key.mainimag }" align="middle" width="100" height="60" hspace="20" style="margin: auto;margin-top: 5px;" /></a></div>
	  <div class="p_name"><a href="#">${s.key.teaname }</a></div>
	</td>
	<td class="scj sp">￥${s.key.shangchengjia }</td>
	<td class="bgj sp">￥${s.key.yuanjia }</td>
	<td class="sl">
	    <div class="Numbers">
		  <a href="shoppingCarServlet?method=jian&teaid=${s.key.teaid }" onclick="updatenum('del');" class="jian">-</a>
		  <input id="number" name="number" type="text" value="${s.value }" class="number_text">
		  <a href="shoppingCarServlet?method=jia&teaid=${s.key.teaid }" onclick="updatenum('del');" class="jia">+</a>
		 </div>
	</td>
	<td class="xj">￥${s.key.shangchengjia*s.value}</td>
	<td class="cz">
	 <p><a href="javascript:deleteCarFromGouwuche('shoppingCarServlet?method=deleteCar&teaid=${s.key.teaid }')">删除</a><P>
	 <p><a href="#">收藏该商品</a></p>
	</td>
   </tr>
	</c:forEach>
 </table>
 <div class="sp_Operation">
  <div class="select-all">
  <div class="cart-checkbox"><input type="checkbox"   id="CheckedAll" name="toggle-checkboxes" class="jdcheckbox" clstag="clickcart">全选</div>
  <div class="operation"><a href="javascript:deleteAll()" id="send">删除选中的商品</a></div> 
    </div> 
     
	 <!--结算-->
	<div class="toolbar_right">
    <div class="p_Total">
	  <span class="text">商品总价：</span><span class="price sumPrice">32.40元</span>
	</div>
	<div class="Discount"><span class="text">以节省：</span><span class="price">5.1</span></div>
	<div class="btn">
	 <a class="cartsubmit" href="flow.php?step=checkout"></a>
	 <a class="continueFind" href="./"></a>
	</div>
  </div>
  </div>
   </form>
 </div>

</div>
<!--底部样式-->
<c:import url="foot.jsp"></c:import>

<!--结束-->
</div>
</body>
</html>


<script>
	function addCarFromGouwuche(url){
		
		if(userChoice)
		{
		location.href=url;
		}
	}
	function deleteCarFromGouwuche(url){
		
		var  userChoice=window.confirm("您确认要删除这个商品吗?");
		if(userChoice)
		{
			location.href=url;
		}
	}
	function deleteAll(){
		var  userChoice=window.confirm("客官，您真的要删除所有的商品吗?");
		if(userChoice)
		{
			location.href='shoppingCarServlet?method=deleteAll';
		}
	}
	$(document).ready(function(){
		$("[name='img']:even").css("backgroundColor","#eeeeee");
		$("[name='img']").mouseover(function(){
			$(this).css("color","green");
			$(this).css("textShadow","1px 1px 1px  gray");
		});
		$("[name='img']").mouseout(function(){
			$(this).css("color","gray");
			$(this).css("textShadow","");
		});

		$("[name='img']").mouseover(function(){
			$(this).css("boxShadow","-1px -1px  15px  green");
		});
		$("[name='img']").mouseout(function(){
			$(this).css("boxShadow","");
		});
		})
</script>