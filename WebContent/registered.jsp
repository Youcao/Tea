<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%=request.getAttribute("loginResultMessage") %>
	<%  if(request.getAttribute("loginResultMessage")!=null&&request.getAttribute("loginResultMessage").toString().equals("codeError")) {%>
	<script type="text/javascript">
	alert("温馨提示:\r\n验证码填写错误!");
	</script>
	<%} else if(request.getAttribute("loginResultMessage")!=null&&request.getAttribute("loginResultMessage").toString().equals("userError")){ %>
	<script type="text/javascript">
	alert("温馨提示:\r\n用户名和密码错误!");
	</script>
	<%} else if(request.getAttribute("loginResultMessage")!=null&&request.getAttribute("loginResultMessage").toString().equals("registerSuccess")){ %>
	<script type="text/javascript">
	alert("温馨提示:\r\n注册成功!");
	</script>
	<%} else if(request.getAttribute("loginResultMessage")!=null&&request.getAttribute("loginResultMessage").toString().equals("registerFail")){ %>
	<script type="text/javascript">
	alert("温馨提示:\r\n注册失败!");
	</script>
	<%} %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
        <ul><li>快速注册</li><li>普通注册</li></ul>
       </div>
       <div class="bd">
        <ul>
         <form id="form2" name="form2" method="post" action="registered.jsp" onSubmit="return register();"> 
	   <div class="form clearfix">	
        <div class="item"><label class="rgister-label">手&nbsp;&nbsp;机&nbsp;&nbsp;号：</label><input id="mobile" name="mobile" type="text"  class="text" /></div>
        <div class="item"><label class="rgister-label" >验&nbsp;&nbsp;证&nbsp;&nbsp;码：</label><input id="phonecode" name="mobile_code" type="text"  class="text" />
        <a id="zphone"  onClick="get_mobile_code();" class="phone_verification">获取验证码</a></div> 
        <div class="item-ifo">
                    <input type="checkbox" class="checkbox left" checked="checked" id="readme" onclick="agreeonProtocol();">
                    <label for="protocol" class="left">我已阅读并同意<a href="#" class="blue" id="protocol">《福际商城用户注册协议》</a></label>
                </div>
       </div>
       <div class="rgister-btn">
	  <a id="phoneRegisterButton" href="javascript:;" class="btn_rgister">注&nbsp;&nbsp;&nbsp;&nbsp;册</a>
	  </div>
	  <div class="Note"><span class="login_link">已是会员<a href="login.jsp">请登录</a></span></div>	  
       </form>
        </ul>
        <ul>
            <form id="form1" name="form1" method="post" action="UserServlet"> 
            <input  id="method" type="hidden" name="method" value="register"/>
	   <div class="form clearfix">	
	    <div class="item"><label class="rgister-label">用&nbsp;&nbsp;户&nbsp;&nbsp;名：</label><input id="username" name="username" type="text"  class="text" /><b>*</b><span id="userExtist"></span></div>
		<div class="item"><label class="rgister-label" >密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</label><input id="password" name="password" type="password"  class="text" /><b>*</b></div> 
	    <div class="Password_qd"><ul><li class="r">弱</li><li class="z">中</li><li class="q">强</li></ul></div>
		<div class="item"><label class="rgister-label " >昵称：</label><input id="nickname" name="nickname" type="text"  class="text" /><b>*</b></div>
	    <div class="item"><label class="rgister-label" >电子邮箱：</label><input id="email" name="email" type="text"  class="text" /><b>*</b></div> 
	 
	    <div class="item "><label  class="rgister-label ">验&nbsp;证&nbsp;码：</label><input name="code" type="text"  class="Recommend_text" /><img id="code" src="CodeServlet"  style="position: relative;top: 13px;left:5px" /></div>
		<div class="item-ifo">
                    <input type="checkbox" class="checkbox left" checked="checked" id="readme" onclick="agreeonProtocol();">
                    <label for="protocol" class="left">我已阅读并同意<a href="#" class="blue" id="protocol">《福际商城用户注册协议》</a></label>
                </div>
	  </div>	
	  <div class="rgister-btn">
	  <a id="registerButton" href="javascript:;" class="btn_rgister">注&nbsp;&nbsp;&nbsp;&nbsp;册</a>
	  </div>
	  <div class="Note"><span class="login_link">已是会员<a href="login.jsp">请登录</a></span></div>	  
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
		/**
		注册用户名检测是否存在的ajax代码
		**/
		$(" [name='username'] ").blur(function(){
			$.get("UserServlet?method=checkUserExists&username="+$(this).val(),function(data,status){
				if(data=='true'){
					$("#userExtist").html("<b style='color:red'>该用户名已存在</b>");
				}else
				{
					$("#userExtist").html("<b style='color:green'>该用户名可以使用</b>");
				}
			});
		});
		
		$("#registerButton").click(function(){
			$("#method").val("register");
			$("#form1").submit();//用jquery提交表单的代码
		})
		
		$("#code").click(function(){
			$("#code").attr("src",'CodeServlet?time='+new Date());
		})

	});
	</script>
  <!--  <script type="text/javascript">  
function check(){  
    var uname = document.getElementById("username").value;  
    var upassword = document.getElementById("password").value;  
    var upasswordtwo = document.getElementById("passwordtwo").value;  
    var email = document.getElementById("email").value;  
    if(uname==""){  
        alert("用户名为空！");  
        return false;  
    }  
    if(upassword==""){  
        alert("密码为空！");  
        return false;  
    }  
    if(upasswordtwo==""){  
        alert("请再次输入密码！");  
        return false;  
    }  
    if(upassword != upasswordtwo){  
        alert("两次密码不一致！");  
        return false;  
    }  
    if(email==""){  
        alert("电子邮箱为空！");  
        return false;  
    }  
}  
if(window.top!=window){  
     window.top.location = "Login";  
}  
</script>-->
<script language="javascript">
		 function get_mobile_code(){	
        $.post('sms.jsp', {mobile:jQuery.trim($('#mobile').val())}, function(msg) {
            alert(jQuery.trim(unescape(msg)));
			if(msg=='提交成功'){
				RemainTime();
			}
        });
	};
	var iTime = 59;
	var Account;
	function RemainTime(){
		document.getElementById('zphone').disabled = true;
		var iSecond,sSecond="",sTime="";
		if (iTime >= 0){
			iSecond = parseInt(iTime%60);
			iMinute = parseInt(iTime/60)
			if (iSecond >= 0){
				if(iMinute>0){
					sSecond = iMinute + "分" + iSecond + "秒";
				}else{
					sSecond = iSecond + "秒";
				}
			}
			sTime=sSecond;
			if(iTime==0){
				clearTimeout(Account);
				sTime='获取手机验证码';
				iTime = 59;
				document.getElementById('zphone').disabled = false;
			}else{
				Account = setTimeout("RemainTime()",1000);
				iTime=iTime-1;
			}
		}else{
			sTime='没有倒计时';
		}
		document.getElementById('zphone').value = sTime;
	}
</script>
