<%@page import="com.orcale.tea.model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" tyle="text/css" />
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="js/common_js.js" type="text/javascript"></script>
<title>用户登录</title>
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
<div class="login_bg">

<div class="login Narrow">
   <div class="login_advertising"><img src="images/bg_03.png" /></div>
  <div class="login_frame">
  
   <div class="login-form"> 
   <form id="loginForm" class="form-reg" method="post" action="UserServlet"> 
   <input  id="method" type="hidden" name="method" value="login"/>
     <div class="login-name"><h1 class="name">用户登录</h1><span class="login_link"><a href="registered.jsp"><b></b>用户注册</a></span></div>
	  <!--提示信息-->
	    <div class="Prompt">账号密码不能为空！ </div>
	    <div class="form clearfix">	    
	     <div class="item item-fore1"><label for="loginname" class="login-label name-label"></label><input id="username" name="username" type="text"  class="text" placeholder="请输入用户"/><span id="userExtist"></span>
		 </div>
		 <div class="item item-fore2"><label for="nloginpwd" class="login-label pwd-label" ></label><input id="password" name="password" type="password"  class="text" placeholder="用户密码"/>
	     </div> 
	     <div class="Forgetpass">
	    
			<a href="#" onclick = "window.open('forgetPassword.jsp')">忘记密码？</a></div>    
	    </div>	
	     
	    <div class="login-btn">
	    <a id="submitButton" href="javascript:;" class="btn_login">登&nbsp;&nbsp;&nbsp;&nbsp;录</a>
	  </div>
	  </form>
    </div>
    
    <div class="Login_Method">
     
    </div>
    
  </div>
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
		/**
		注册用户名检测是否存在的ajax代码
		**/
		$(" [name='username'] ").blur(function(){
			$.get("UserServlet?method=checkUserExists&username="+$(this).val(),function(data,status){
				if(data=='true'){
					$("#userExtist").html("<b style='color:green'>√</b>");
				}else
				{
					$("#userExtist").html("<b style='color:red'>×</b>");
				}
			});
		});
			
		$("#method").val("login");
		$("#submitButton").click(function(){
			$("#loginForm").submit();
		})
		
	});
	</script>
<!--  <script type="text/javascript">  
function check(){  
    var username = document.getElementById("username").value;  
    var password = document.getElementById("password").value;  
    if(username==""){  
        alert("用户名为空！");  
        return false;  
    }  
    if(password==""){  
        alert("密码为空！");  
        return false;  
    }  
}  

</script>  -->

		