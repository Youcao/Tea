<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" tyle="text/css" />
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="js/common_js.js" type="text/javascript"></script>
<title>用户注册</title>
</head>

<body>
<!--顶部样式-->
<div class="common_top">
 <div class="Narrow">
  <div class=" left logo"><a href="#"><img src="images/logo.png" /></a></div>
  <!--电话图层-->
  <div class="phone"><label>全国服务热线：</label><em>400-345-5633</em></div>
 </div>
</div>
<!--用户注册样式-->
<div class="registered_style Narrow clearfix">
   <div class="left_advertising">
    <img src="images/bg_03.png" />
   </div>
   <div class="right_register">
     <div class="register_Switching" id="register_Switching">
       <div class="hd">
        <ul><li>找回密码</li></ul>
       </div>
       <div class="bd">
        <ul>
         <form id="form" name="form1" method="post" action="UserServlet"> 
          <input  id="method" type="hidden" name="method" value="update"/>
	   <div class="form clearfix">	
        <div class="item"><label class="rgister-label">新&nbsp;&nbsp;密&nbsp;&nbsp;码：</label><input id="password" name="password" type="password"  class="text" p/><b>*</b></div>
        <div class="Password_qd"><ul><li class="r">弱</li><li class="z">中</li><li class="q">强</li></ul></div> 
        <div class="item"><label class="rgister-label" >确&nbsp;认&nbsp;密&nbsp;码：</label><input id="passwordtwo" name="password" type="password"  class="text" /><b>*</b></div>
       </div>
       <div class="rgister-btn">
	  <a href="resetPassword.jsp" class="btn_rgister">登&nbsp;&nbsp;&nbsp;&nbsp;陆</a>
	  </div>
	 
       </form>
        </ul>
        
       </div>
     </div>
     <script>jQuery(".register_Switching").slide({trigger:"click"});</script>
    </div>
</div>
<!--底部样式-->
 <div class="bottom_footer">
   <p><a href="#">关于我们</a> | <a href="#">联系我们</a> | <a href="#">商家入驻</a> | <a href="#">法律申明</a> | <a href="#">友情链接</a>  </p>
	 <p>Copyright©2014四川金祥保险销售有限公司.All Rights Reserved. </p>
	 <p>川ICP备09150084号</p>
   </div>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#registerButton").click(function(){
			$("#method").val("register");
			$("#form1").submit();//用jquery提交表单的代码
		})

	});
	</script>
  
</script> 
