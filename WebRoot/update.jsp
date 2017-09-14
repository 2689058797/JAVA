<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>单个物件</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<link rel="stylesheet" href="css/etalage.css" type="text/css" media="all" />
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--fonts-->
<!-- <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'> -->
<!--//fonts-->
<script src="js/jquery.min.js"></script>

<script src="js/jquery.etalage.min.js"></script>
<script>
			jQuery(document).ready(function($){

				$('#etalage').etalage({
					thumb_image_width: 300,
					thumb_image_height: 400,
					source_image_width: 900,
					source_image_height: 1200,
					show_hint: true,
					click_callback: function(image_anchor, instance_id){
						alert('Callback example:\nYou clicked on an image with the anchor: "'+image_anchor+'"\n(in Etalage instance: "'+instance_id+'")');
					}
				});

			});
		</script>
		<script type="text/javascript">
		function check(){
			var c  = true;
			var username = document.getElementById("username").value;
			var password = document.getElementById("password").value;
			var name = document.getElementById("name").value;
			var sex = document.getElementById("sex").value;
			var email = document.getElementById("email").value;
			var address = document.getElementById("address").value;
			var phone = document.getElementById("phone").value;
			var birthday = document.getElementById("birthday").value;
			var reg3 = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;//验证邮箱
			var reg1 = /^0?1[3|4|5|8][0-9]\d{8}$/;//检验电话号码
			var reg2= /^(\d{4})(-)(\d{2})(-)(\d{2})$/;//检验生日日期满足YYYY-MM-DD 
			if(!reg2.test(birthday)){
				c=false;
				alert("生日日期输入有误");
			}
			 if (!reg1.test(phone)) {
				 c=false;
			     alert("输入电话号码有误");
			 }
			 if(!reg3.test(email)){
				 c= false;
				 alert("输入邮箱地址有误");
			 }
			 if(sex.trim().equals("男") || sex.trim().equals("女")){
				 c= false;
				 alert("输入性别有误，请输入男或者女");
			 }
			 if(username.trim().equals("")){
				 c = false;
				 alert("请输入用户名");
			 }
			 if(password.trim().equals("")){
				 c = false;
				 alert("请输入密码");
			 }
			 if(name.trim().equals("")){
				 c = false;
				 alert("请输入姓名");
			 }
			 if(address.trim().equals("")){
				 c = false;
				 alert("请输入地址");
			 }
			return c;
		}</script>
		

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
						  <!-- <select class="in-drop">
							  <option value="English" class="in-of">English</option>
							  <option value="Japanese" class="in-of">Japanese</option>
							  <option value="French" class="in-of">French</option>
							  <option value="German" class="in-of">German</option>
							</select> -->
					 </div>
					<div class="down-top top-down">
						  <select class="in-drop">
						  <option value="Dollar" class="in-of">人民币</option>
							</select>
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
						<div>&nbsp;&nbsp;&nbsp;Summer is Book</div>
					</div>
					
					<div class = "search">
					<s:iterator value = "#session.user">
					<span class="dolor-left"><s:property value = "username"/>,欢迎来到SIB！</span>
					</s:iterator>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="header-bottom-right">					
						<div class="account"><a href="listSingleUser.action"><span> </span>你的账户</a></div>
							<ul class="login">
								<li><a href="offLine.action?users.userId=<s:property value="#session.userId"/>"><span> </span>下线</a></li>|
                                <li ><a href="offLine.action?users.userId=<s:property value="#session.userId"/>">注册</a></li>
							</ul>
						<div class="cart"><a href="listItem.action"><span> </span>购物车</a></div>
					<div class="clearfix"> </div>
				</div>
				<div class="clearfix"> </div>	
			</div>
		</div>
	</div>
	<!---->
	
	 <div class="container"> 
	 	
	 	<div class=" single_top">
	      <div class="single_grid">
			
				  
			<div class="register">
			
		 
				 <div class="  register-top-grid">
					<h3>个人信息</h3>
					 <form action="updateUser" method="post" onsubmit="return check();">
					 <s:iterator value="#request.users">
					<div class="mation">
					  
					   <s:hidden name="users.userId" value="%{users.userId}"></s:hidden>  
						
						 <label>用户名:</label>
						<input type="text" name="users.username" value=<s:property value="username"/> id = "username">
						
						 <label>密码:</label>
						  <input type="text" name="users.password" value=<s:property value="password"/> id = "password">
						
						 <label>姓名:</label>
						<input type="text" name="users.name" value=<s:property value="name"/> id = "name">
						
						 <label>性别:</label>
						<input type="text" name="users.sex" value=<s:property value="sex"/> id = "sex">
				
						 <label>邮箱:</label>
						<input type="text" name="users.email" value=<s:property value="email"/> id = "email">
						 
						
						 <label>生日日期:</label>
						<input type="text" name="users.birthday" value=<s:property value="transfer(birthday)"/> id = "birthday">
						
					
						 <label>地址:</label>
						<input type="text" name="users.address" value=<s:property value="address"/> id = "address">
						
						
						 <label>手机号码:</label>
						<input type="text" name="users.phone" value=<s:property value="phone"/> id = "phone">
					<!-- 	因为要重新登陆，因此把STATE隐式修改为"0" -->
						<input type="text" name="users.state" value="0" style="display:none;">
					</div>
					</s:iterator>
					<div class="login-right">
					<input type = "submit" value = "确认修改">
					</div>
				</form>
				用户修改信息后将重新登陆。
					</div>
				
					</div>
 					</div>
          	    <div class="clearfix"> </div>
          	   </div>
	    <script type="text/javascript">
		 $(window).load(function() {
			$("#flexiselDemo1").flexisel({
				visibleItems: 5,
				animationSpeed: 1000,
				autoPlay: true,
				autoPlaySpeed: 3000,    		
				pauseOnHover: true,
				enableResponsiveBreakpoints: true,
		    	responsiveBreakpoints: { 
		    		portrait: { 
		    			changePoint:480,
		    			visibleItems: 1
		    		}, 
		    		landscape: { 
		    			changePoint:640,
		    			visibleItems: 2
		    		},
		    		tablet: { 
		    			changePoint:768,
		    			visibleItems: 3
		    		}
		    	}
		    });
		    
		});
	</script>
	<script type="text/javascript" src="js/jquery.flexisel.js"></script>
          	   </div>
          	   
          	   <!---->
<div class="sub-cate">
<div class=" top-nav rsidebar span_1_of_left">
<ul class = "menu">
<li>
			<ul class="kid-menu">
				<li><a href="listBook.action"><span class="actual dolor-left-grid"> 查看所有商品</span></a></li>
			</ul>
		</li>
</ul>
					<div class=" chain-grid menu-chain">
	   		     		<a href="single.jsp"><img class="img-responsive chain" src="images/wat.jpg" alt=" " /></a>	   		     		
	   		     		<div class="grid-chain-bottom chain-watch">
		   		     		<span class="actual dolor-left-grid">30元</span>
		   		     		<span class="reducedfrom">50元</span>  
		   		     		<h6>资治通鉴</h6>	  		     			   		     										
	   		     		</div>
	   		     		</div>
	   		     		<br/><br/><br/>
	   		     	</div>				
			</div>		
</body>
</html>
