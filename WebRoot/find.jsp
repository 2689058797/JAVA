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
    
    <script language="javascript">
function myPorc()
{
	var pw1=document.getElementById("email").value;
	if(pw1=="")
	
	{
		alert("请输入你的邮箱");
		 return false;
	}
	else 
	{
		alert("密码已发送到邮箱请查收");
	 
	
	}

//调用myPorc()函数的时候就会弹出一个对话框写着alert里面的文字
}
</script>
    
    
    
    
    
    
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
		
      	   <div class="account_grid">
			   <div class=" login-right">
				<p>请输入您的用户名</p>
				<s:form action = "findPassword" method="post">
				  <div>
					
					<input type = "text" id="email" name = "users.username" style="width:400px; height:40px"/>
				  </div>
						  
				<s:submit onclick="return myPorc();" value = "提交"></s:submit>
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
