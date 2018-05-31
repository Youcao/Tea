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
         <form id="form" name="form1" method="post" action="reg.jsp"onSubmit="return register();"> 
	   <div class="form clearfix">	
        <div class="item"><label class="rgister-label">手&nbsp;&nbsp;机&nbsp;&nbsp;号：</label><input id="mobile" name="mobile" type="text"  class="text" /></div>
        <div class="item"><label class="rgister-label" >验&nbsp;&nbsp;证&nbsp;&nbsp;码：</label><input name="code" type="text"  class="text" /><a id="zphone"  onClick="get_mobile_code();" class="phone_verification">获取验证码</a></div> 
       </div>
       <div class="rgister-btn">
	  <a href="resetPassword.jsp" class="btn_rgister">下&nbsp;&nbsp;一&nbsp;&nbsp;步</a>
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
		
		$("#code").click(function(){
			$("#code").attr("src",'CodeServlet?time='+new Date());
		})

	});
	</script>
  
</script> 
<!-- <script type="text/javascript" src="js/jquery.js"></script>
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
</script>-->