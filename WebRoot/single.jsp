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
$(window).bind('beforeunload',function(){
	$.ajax({
	        type:"post",
	        url:"offLine.action",
	        data:'users.userId=<s:property value="#session.userId"/>',
	        success:function(data){
	        return true;
	        }
	    })
	});
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
						<li><a href="#">免费 <span class="live">配送</span></a></li>
					</ul>
					<div class="clearfix"> </div>
				</div>
				<div class="top-header-right">
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
						<div class="account"><a href="login.jsp"><span> </span>你的账户</a></div>
							<ul class="login">
								<li><a href="offLine.action?users.userId=<s:property value="#session.userId"/>"><span> </span>下线</a></li>|
                                 <li ><a href="register.jsp">注册</a></li>
							</ul>
						<div class="cart"><input type = "hidden" name = "#session.user"><a href="listItem.action"><span></span>购物车</a></div>
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
				<div class="grid images_3_of_2">
					
						<ul id="etalage">
							<s:iterator value = "#request.book" >
							<li>
								<img class="etalage_thumb_image" src="<s:property value="imagepath"/>" class="img-responsive" />
								<img class="etalage_source_image" src="<s:property value="imagepath"/>" class="img-responsive" title="" />
							</li>
							</s:iterator>
						</ul>
						 <div class="clearfix"> </div>		
				  </div> 
				  <div class="desc1 span_3_of_2">	
					<s:form action ="saveItem.action" method ="post">
				<div class="cart-b">
					<div class="left-n "></div>
				    <input type = "submit" class="now-get get-cart-in" value="加到购物车"> 
				    <div class="clearfix"></div>
				 </div>
				 <s:iterator value = "#request.book" >
				 <h6><s:property value="bookname"/></h6><input type="hidden" name = "book.bookId" value = "<s:property value="bookId"/>">
			   	<p><s:property value="author"/></p>
			   	<p><s:property value="price"/></p>
			   	<p><s:property value="quality"/></p><input type="hidden" name = "shopCar.num" value = "<s:property value="quality"/>">
			   	<p><s:property value="category"/></p>
			   
			   	</s:iterator>
			   	</s:form>
			   
				
				</div>
          	    <div class="clearfix"> </div>
          	    </div>
          	    	<div class="toogle">
          	    	 <s:iterator value = "#request.book" >
				     	<h3 class="m_3">书本简介</h3>
				     	<p class="m_text"><s:property value="description"/>    
				     	</p>
				     	</s:iterator> </div>	
          	    
          	    
          	    
          	    
          	   <!--    这一部分是book。jsp里面的下面滑动的那几个图片 ,并且点击图片可进入对应的书籍介绍-->
          	<s:form action="listSingleBook" method="post">
          	   <ul id="flexiselDemo1">
          	  <s:iterator value = "#session.alllist" >
			 <li><img src="<s:property value="imagepath"/>" /><div class="grid-flex"><a href="listSingleBook?book.imagepath=<s:property value="imagepath"/>"><s:property value="bookname"/></a><p><s:property value="price"/></p></div></li>		
 			</s:iterator>
		 </ul>
	</s:form>
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
					<h3 class="cate">分类查找</h3>
		  <ul class="menu">
		<li class="item1"><a href="#"><span class="actual dolor-left-grid">出版社</span><img class="arrow-img" src="images/arrow1.png" alt=""/> </a>
			<ul class="cute">
			<s:iterator value = "#session.totalList">
				<li class="subitem1"><a href="listBookPublish?book.publish=<s:property value="publish"/>"><span class="actual dolor-left-grid"><s:property value="publish"/></span></a></li>
				</s:iterator>
			</ul>
		</li>
		<li class="item2"><a href="#"><span class="actual dolor-left-grid">书籍分类</span><img class="arrow-img " src="images/arrow1.png" alt=""/></a>
			<ul class="cute">
			<s:iterator value = "#session.totalList">
				<li class="subitem1"><a href="listBookCategory?book.category=<s:property value="category"/>"><span class="actual dolor-left-grid"><s:property value="category"/></span></a></li>
				</s:iterator>
			</ul>
		</li>
			<li class="item3"><a href="#"><span class="actual dolor-left-grid">作者</span><img class="arrow-img img-arrow" src="images/arrow1.png" alt=""/> </a>
			<ul class="cute">
				<s:iterator value = "#session.totalList">
				<li class="subitem1"><a href="listBookAuthor?book.author=<s:property value="author"/>"><span class="actual dolor-left-grid"><s:property value="author"/></span></a></li>
				</s:iterator>
			</ul>
		</li>
		<li>
			<ul class="kid-menu">
				<li><a href="listItem.action"><span class="actual dolor-left-grid"> 查看所有商品</span></a></li>
			</ul>
		</li>	
		</ul>
					</div>
					
					<script type="text/javascript">
			$(function() {
			    var menu_ul = $('.menu > li > ul'),
			           menu_a  = $('.menu > li > a');
			    menu_ul.hide();
			    menu_a.click(function(e) {
			        e.preventDefault();
			        if(!$(this).hasClass('active')) {
			            menu_a.removeClass('active');
			            menu_ul.filter(':visible').slideUp('normal');
			            $(this).addClass('active').next().stop(true,true).slideDown('normal');
			        } else {
			            $(this).removeClass('active');
			            $(this).next().stop(true,true).slideUp('normal');
			        }
			    });
			
			});
		</script>
					<div class=" chain-grid menu-chain">
	   		     		<a href="listSingleBook?book.imagepath=images/wat.jpg"><img class="img-responsive chain" src="images/wat.jpg" alt=" " /></a>	   		     		
	   		     		<div class="grid-chain-bottom chain-watch">
		   		     		<span class="actual dolor-left-grid">70元</span>
		   		     		<span class="reducedfrom">102元</span>  
		   		     		<h6>资治通鉴</h6>  		     			   		     										
	   		     		</div>
	   		     	</div> 					
<div class="clearfix"> </div>			
		</div>
	<!---->
	<div class="footer">
		<div class="footer-top">
			<div class="container">
				<div class="latter">
					<h6>站内搜索</h6>
					<div class="sub-left-right">
						<form action = "listBookName" method = "post">
							<input type="text" name = "book.bookname" value="输入书名"onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '输入书名';}" />
							<input type="submit" value="搜索" />
						</form>
					</div>
					<div class="clearfix"> </div>
				</div>
				
					<div class="clearfix"> </div>
				</div>
			
			</div>
		</div>
		<div class="footer-bottom">
			<div class="container">
				<div class="footer-bottom-com">
					<h6>最新评论</h6>
					<s:iterator value = "#request.comments">
					<hr/>
					<ul>
						<li><span><s:property value = "commentDate"/></span><br>
						    <span><s:property value = "users.username"/>:</span><br/>
						    <s:property value = "content"/>
						</li>
					</ul>
					</s:iterator>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
</body>
</html>
