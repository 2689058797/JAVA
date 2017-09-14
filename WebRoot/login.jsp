<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>二手市场</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!--theme-style-->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!--//fonts-->
    <script src="js/jquery.min.js"></script>
    <meta charset="UTF-8">
</head>
<body>
    <!--header-->
    <div class="header">
        <div class="top-header">
            <div class="container">
                <div class="top-header-left">
                    <ul class="support">
                        <li><a href="#"><label> </label></a></li>
                       <li><a href="#">7天24小时<span class="live">提供服务</span></a></li>
					</ul>
					<ul class="support">
						<li class="van"><a href="#"><label> </label></a></li>
						<li><a href="#">免费 <span class="live">送货</span></a></li>
                    </ul>
                    <div class="clearfix"> </div>
                </div>
                <div class="top-header-right">
                    <div class="down-top">
                    </div>
                    <div class="down-top top-down">
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <div class="bottom-header">
            <div class="container">
                <div class="header-bottom-left">
                    <div class="logo">
                        <img src="images/logo.png" alt=" " />
                        <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Summer is Book</div>
                    </div>
                   
                </div>
                <div class="header-bottom-right">
                    <div class="clearfix"> <h5>亲爱的游客，您好</h5></div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
    <!---->
		<script type="text/javascript">
		function checkform(){
			 $user_name=document.getElementById("User_Name").value;
			 $user_pwd=document.getElementById("User_Pwd").value;
			 if($user_name=='')
			 {
			  alert("用户名不能为空");
			  return false;
			 }

			 if($user_pwd=='')
			 {
			  alert("密码不能为空");
			  return false;
			 }

			 return true;
			}

    </script>
    
<script type="text/javascript">
	$(document).ready(function(){
		 var error = $("#error").find("span").text();
		 if(error!=''){
			 
			 alert(error);
			 $("#error").value='';
			 
		 };
	});
	</script> 
      	   <div class="account_grid">
			   <div class=" login-right">
				<p>如果您已经拥有账号，请登录</p>
				<s:form action = "listUser" onsubmit="return checkform()">
				  <div>
				  <s:actionerror id="error"/>
					<span>账户<label>*</label><br/>
					<input type = "text" id="User_Name" name = "users.username" style="width:400px; height:40px"/></span> 
				  </div>
				  <div>
					<span>密码<label>*</label><br/>
					<input type = "password" id="User_Pwd" name = "users.password" style="width:400px; height:40px"></span><br><br> 
				  </div>
				   <a class="forgot" href="find.jsp">忘记密码?</a>				  
				  <input type ="submit" value="登陆">&nbsp;&nbsp;&nbsp;<input type = "button" onclick = "window.location.href='register.jsp'" value = "立即注册">
			    </s:form>
			    
			   </div>	
			 </div>
			 
			<div class="clearfix"> </div>
			<div class="footer">
					<div class="footer-bottom">
			<div class="container">
				<div class="footer-bottom-cate">
					<h6>最新上架</h6>
					<ul>
						<li><img src = "images/pic1.jpg"></li>
					</ul>
				</div>
				<div class="footer-bottom-cate bottom-grid-cat">
					<h6></h6>
					<ul>
						<li><img src = "images/pic2.jpg"></li>
					</ul>
				</div>
				<div class="footer-bottom-cate">
					<h6></h6>
					<ul>
						<li><img src = "images/pic3.jpg"></li>
					</ul>
				</div>
				<div class="footer-bottom-cate cate-bottom">
					<h6></h6>
					<ul>
						<li><img src = "images/pic4.jpg"></li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
      	
</body>
</html>
