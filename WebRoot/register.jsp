<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="UTF-8">
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
                        <!--<select class="in-drop">-->
                        <!--<option value="English" class="in-of">Chinese</option>-->
                        <!--<option value="Japanese" class="in-of">Japanese</option>-->
                        <!--<option value="French" class="in-of">French</option>-->
                        <!--<option value="German" class="in-of">German</option>-->
                        <!--</select>-->
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
                        <a href="index.jsp"><img src="images/logo.png" alt=" " /></a>
                    </div>
                    <div class="clearfix"> Summer is Book</div>
                </div>
                <div class="header-bottom-right">
                    <ul class="login">
                        <li><a href="login.jsp"><span></span>登陆</a></li>
                    </ul>
                    <div class="clearfix"> </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
    <!--运用了正则表达式检测各项条件，就验证了每个选项不为空，然后手机和邮箱要按照正常的格式，然后两次输入密码要相同，长度限制等
    -->
	<script type="text/javascript">
		function checkform(){
			 $user_username=document.getElementById("User_UserName").value;
			 $user_pwd=document.getElementById("User_Pwd").value;
			 $user_againpwd=document.getElementById("User_AgainPwd").value;
			 $user_name=document.getElementById("User_Name").value;
			 $user_sex=document.getElementById("User_Sex").value;
			 $user_email=document.getElementById("User_Email").value;
			 $user_phone=document.getElementById("User_Phone").value;
			 $user_birthday=document.getElementById("User_Birthday").value;
			 $user_address=document.getElementById("User_Address").value;
			
			 
			 if($user_username=='')
			 {
			  alert("用户名不能为空");
			  return false;
			 }

			 if($user_pwd=='')
			 {
			  alert("密码不能为空");
			  return false;
			 }
			 if($user_pwd!='')
			 {
				 
				 
				 if($user_pwd.length<8||$user_pwd.length>20){
					 
					 alert("密码长度控制为8位至20位");
					  return false;
					 
				 }
			
			 }

			 if($user_againpwd=='')
			 {
			  alert("密码不能为空");
			  return false;
			 }
			 
			 if($user_pwd!=$user_againpwd){
				 
				 alert("两次输入的密码不同，请重新输入");
				 return false;
			 }
			 
			if($user_name==''){
				 
				alert("姓名不能为空");
				 return false;
			 }
			
			if($user_sex==''){
				 
				alert("性别不能为空");
				 return false;
			 }
			 
			if($user_email==''){
				 
				alert("邮箱不能为空");
				 return false;
			 }
			 
			if($user_email!=''){
				var szReg=/^[A-Za-zd]+([-_.][A-Za-zd]+)*@([A-Za-zd]+[-.])+[A-Za-zd]{2,5}$/;
				 if (szReg.test($user_phone)) {
				      
				    } 
				 else {
				        alert("你的邮箱格式输入错误，请重新输入");
				       
				        return false;
				    }
				
				
				
				
			 }
			
			
			
			if($user_phone==''){
				
				alert("手机不能为空");
				
				 return false;
			 }
			
			if($user_phone!=''){
				var re = /^1\d{10}$/;
				
				 if (re.test($user_phone)) {
				      
				    } 
				 else {
				        alert("你的手机号码格式输入错误");
				        return false;
				    }
				
				
				
			}
			
			
			if($user_birthday==''){
				 
				alert("生日不能为空");
				 return false;
			 }
			
			if($user_address==''){
				 
				alert("地址不能为空");
				 return false;
			 }
			 return true;
			}

    </script>
			         
		<div class="register">
		  	  <s:form action="saveUser" name="form1" method ="post" onsubmit="return checkform()"> 
				 <div class="  register-top-grid">
					<h3>个人信息</h3>
					<div class="mation">
						<span>真实姓名<label>*</label></span>
						<input type="text" id="User_Name" name = "users.name"/> 
					
						<span>性别<label>*(请输入男或女)</label></span>
						<input type="text" id="User_Sex" name = "users.sex"/>
					 
						 <span>邮箱地址<label>*</label></span>
						 <input type="text" id="User_Email" name = "users.email"/>
						 
						 <span>电话<label>*(请输入11位手机号码)</label></span>
						 <input type="text" id="User_Phone" name = "users.phone"/>
						 
						 <span>生日<label>*(请按照 1990-01-01格式输入生日日期)</label></span>
						 <input type="text" id="User_Birthday" name = "users.birthday"/>
						 
						 <span>地址<label>*</label></span>
						 <input type="text" id="User_Address" name = "users.address"/>
						 <input type="hidden" name="users.state" value="0">
					</div>
					 <div class="clearfix"> </div>
					   <a class="news-letter" href="#">
						 <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>Sign Up</label>
					   </a>
					 </div>
				     <div class="  register-bottom-grid">
						    <h3>登录信息</h3>
							<div class="mation">
							<span>账号<label>*</label></span>
						     <input type="text" id="User_UserName" name = "users.username"/>
								<span>密码<label>*(密码长度为8位至20位)</label></span>
								<input type="text" id="User_Pwd" name = "users.password"/>
								<span>确认密码<label>*</label></span>
								<input type="text" id="User_AgainPwd">
								
							</div>
					 </div>
					 
				<div class="register-but">
				<input type = "submit" value = "注册">
				<div class="clearfix"> </div></div>
				</s:form>
			 </div>
		   <div class="sub-cate">
					<div class=" chain-grid menu-chain">
	   		     		<a href="single.jsp"><img class="img-responsive chain" src="images/wat.jpg" alt=" " /></a>	   		     		
	   		     		<div class="grid-chain-bottom chain-watch">
		   		     		<span class="actual dolor-left-grid">30元</span>
		   		     		<span class="reducedfrom">50元</span>  
		   		     		<h6>资治通鉴</h6>  		     			   		     										
	   		     		</div>
	   		     		</div>
	   		     		<div class=" chain-grid menu-chain">
	   		     		<a href="single.jsp"><img class="img-responsive chain" src="images/wat.jpg" alt=" " /></a>	   		     		
	   		     		<div class="grid-chain-bottom chain-watch">
		   		     		<span class="actual dolor-left-grid">30元</span>
		   		     		<span class="reducedfrom">50元</span>  
		   		     		<h6>资治通鉴</h6>  		     			   		     										
	   		     		</div>
	   		     	</div>
                    <br/><br/><br/><br/>
	   		     	</div>
	<!---->
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