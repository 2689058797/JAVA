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




<style type="text/css">
        .product-thumbnail {
            width: 50px;
            display: inline-block;
            margin-right: 10px;
        }
        .product-thumbnail img {
            width: 50px;
            border-radius: 3px;
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
        }
        .shopping-cart-item h6 {
            font-size: 14px;
            font-weight: 400;
            margin: 0;
            display: inline-block;
        }
        table td, table th {
            border: 1px solid #ecedf1;
            padding: 12px 20px;
            text-align: left;
            transition: background 0.3s;
            -webkit-transition: background 0.3s;
            -moz-transition: background 0.3s;
        }
        .contact_right {
            margin-top: 28px;
        }
        .numeric-input-holder {
            width: 115px;
            display: block;
            position: relative;
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -khtml-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            -webkit-transform: translateZ(0px);
        }
    </style>



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
								<li><a href="offLine.action?users.userId=<s:property value="#session.userId"/>"><span> </span>下线</a></li>
                                <li ><a href="register.jsp">注册</a></li>
							</ul>
						<div class="cart"><a href="listItem.action"><span> </span>购物车</a></div>
					<div class="clearfix"> </div>
				</div>
				<div class="clearfix"> </div>	
			</div>
		</div>
	</div>
	<!---->
	<s:fielderror>
	</s:fielderror>
	 <div class="container"> 
	 	
	 	<div class=" single_top">
	      <div class="single_grid" id="">
			
				<script language="javascript" type="text/javascript"> 
			
				function btn1(){
					document.getElementById('div1').style.display='';
					document.getElementById('div2').style.display='none';
				}
				function btn2(){
					document.getElementById('div1').style.display='none';
					document.getElementById('div2').style.display='';
				}
				function btn3(){
					  
					document.getElementById('div3').style.display='';
					  
				 }
				function btn4(){
					  
					document.getElementById('div3').style.display='none';
					  
				 }
				  
				  
				  
				  </script>
				  
			<div class="register" id="div1">
			
		  <!--  展示用户个人信息的 -->
				 <div class="  register-top-grid">
					<h3>个人信息</h3>
					
					<div class="mation">
					<s:iterator value="#session.user">				  
					  <span></span>
						 <label>用户名:</label>
						<s:property value="username"/>
					<span></span>
						 <label>密码:</label>
						<s:property value="password"/>
						<span></span>
					 	 <label>姓名:</label>
						<s:property value="name"/>
						<span></span>
						 <label>性别:</label>
						<s:property value="sex"/>
						<span></span>
						 <label>邮箱地址:</label>
						<s:property value="email"/>
						 <span></span>
						  <label>生日日期:</label>
						<s:property value="birthday"/>
						 <span></span>
						 <label>地址:</label>
						<s:property value="address"/>
						 <span></span>
						  <label>手机号码:</label>
						<s:property value="phone"/>
						 </s:iterator>
					</div>				
					</div>			
					<s:iterator value="#session.user">
					<a href="getUpdateUser?users.userId=<s:property value="userId"/>">修改个人信息</a>
 					</s:iterator>
					</div>		
	
					
					
					
					
<s:iterator value="#session.user">
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
	        type:"post",
	        url:"listPurchase.action",
	        data:'users.userId=<s:property value="userId"/>',
	        async:true,
	        success:function(data){
	        return true;
	        }
	    });
	});
</script>
		</s:iterator>			
		<div class="register" id="div2" style="display:none">
			
		  <!--  展示用户个人信息的 -->
				
					<s:iterator value="#session.purchaselist">
					<div class=" contact_right">
					<table class="table table-hover">
				
					<tr>
					
					<td>书本</td>
					<td>购买日期</td>
					<td>购买数量</td>
					<td>评论</td>
					</tr>
				
					<tr>
					
					<td>
					<s:property value="book.bookname"/>
					</td>
					<td>
					<s:property value="buyDate"/>
					</td>
					<td>
					 <s:property value="num"/> 
					</td>
					<td>
					
					<input type="button" value="添加评论" onclick="btn3()">
				
					</td>
					</tr>
					</table>	
						  
						  
						  
					</div>				
				
			<!-- 用户评论弹出框的DIV层 -->
			<div id="div3" style="display:none">
			写下您的评论
			<s:form action="saveComments" method="post">
			<input type="hidden" name="book.bookId" value=<s:property value="book.bookId"/>>
			<input type="hidden" name="users.userId" value=<s:property value="users.userId"/>>
			<textarea rows="5" cols="80" name="comments.content"></textarea>
			<!-- <input type="text" style="height:100px;width:600px" name="comments.content"> -->
			<s:submit value = "提交"><input type="button" onclick="btn4()" value="取消"></s:submit>
			</s:form>
			</div>
					</s:iterator>
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
					<h3 class="cate">用户中心</h3>
		  <ul class="menu">
		<li>
			<ul class="kid-menu">
				<li><a href="#" id="btn1" onclick="btn1()"><span class="actual dolor-left-grid"> 用户个人信息</span></a></li>
			</ul>
		</li>	
			<li>
			<ul class="kid-menu">
				<li><a href="#" id="btn2" onclick="btn2()"><span class="actual dolor-left-grid">购物记录</span></a></li>
			</ul>
		</li>
			<li>
			<ul class="kid-menu">
				<li><a href="listBook.action"><span class="actual dolor-left-grid"> 查看所有商品</span></a></li>
			</ul>
		</li>
		</ul>
	</div>
	  </div>		 	
	</div>		
</body>
</html>
