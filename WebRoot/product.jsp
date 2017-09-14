<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Big shope A Ecommerce Category Flat Bootstarp Resposive Website Template | Product :: w3layouts</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
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
<!-- 下面这个AJAX是为了监听用户关闭浏览器后，将数据库中的STATE字段修改"0"，使用户变回下线状态 -->
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
<style type="text/css">
.content_box {
	cursor: pointer;
}
</style>

<!--script-->
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
						<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Summer is Book</div>
					</div>
					
					<div class = "search">
					<s:iterator value = "#session.user">
					<span class="dolor-left"><s:property value = "name"/>,欢迎来到SIB！</span>
					</s:iterator>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="header-bottom-right">					
						<div class="account"><a href="listSingleUser.action"><span> </span>你的账户</a></div>
							<ul class="login">
								<li><a href="offLine.action?users.userId=<s:property value="#session.userId"/>"><span> </span>下线</a></li>|
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
	<!-- start content -->
	<div class="container">	
	<div class="women-product">
		<div class=" w_content">
			<div class="women">
				<ul class="w_nav">
					<li>查找: </li>
			     	<li><a href="listBookByPrice.action">按价格从低到高 </a></li>||
			     	<li><a class="active" href="listBookByPrice.action">按人气排 </a></li>  	
			     </ul>
			     <div class="clearfix"> </div>	
			</div>
		</div>
		<!-- grids_of_4 -->
		<div class="grid-product">
		<s:iterator value = "#request.list" >
		<form action = "listSingleBook" method = "post" >		
		  <div class="product-grid">
			<div class="content_box">
			   	<div class="left-grid-view grid-view-left">		  
			   	   	 <img src="<s:property value="imagepath"/>" class="img-responsive watch-right" alt=""/>
			   		 <input type="hidden" name="book.bookId"  value="<s:property value="bookId"/>">
			            </div>
			            <h4><span class="actual dolor-left-grid"><s:property value = "bookname"/></span></h4>				    
			
				     <span class="actual dolor-left-grid"><s:property value = "price"/></span>
				</div>
			<input type="submit" class = "submit" style = "display:none;">
			   	</div> 
			   	</form>
			   	</s:iterator>
              </div>			
			<div class="clearfix"> </div>
			<div id="page_area">                   
                <s:if test="page.hasPrevious()&&state=='all'">  
                    <a href="listBook.action?page.currentPage=${page.currentPage-1}">上一页</a>  
                </s:if>
                <s:elseif test = "page.hasPrevious()&&state=='name'">
                 <a href="listBookName.action?page.currentPage=${page.currentPage-1}">上一页</a>
                </s:elseif>
                <s:elseif test = "page.hasPrevious()&&state=='publish'">
                 <a href="listBookPublish.action?page.currentPage=${page.currentPage-1}">上一页</a>
                </s:elseif>
                <s:elseif test = "page.hasPrevious()&&state=='author'">
                 <a href="listBookAuthor.action?page.currentPage=${page.currentPage-1}">上一页</a>
                </s:elseif>
                 <s:elseif test = "page.hasPrevious()&&state=='category'">
                 <a href="listBookCategory.action?page.currentPage=${page.currentPage-1}">上一页</a>
                </s:elseif>
                 <s:elseif test = "page.hasPrevious()&&state=='price'">
                 <a href="listBookByPrice.action?page.currentPage=${page.currentPage-1}">上一页</a>
                </s:elseif>                    
                <span>第${page.currentPage}页</span>  
                <span>共${page.getTotalPage()}页</span>                  
                <s:if test="page.hasNext()&&state=='all'">  
                    <a href="listBook.action?page.currentPage=${page.currentPage+1}">下一页</a>  
                </s:if> 
                <s:elseif test ="page.hasNext()&&state=='name'">
                 <a href="listBookName.action?page.currentPage=${page.currentPage+1}">下一页</a>
                </s:elseif>
                <s:elseif test ="page.hasNext()&&state=='publish'">
                 <a href="listBookPublish.action?page.currentPage=${page.currentPage+1}">下一页</a>
                </s:elseif>
                <s:elseif test ="page.hasNext()&&state=='author'">
                 <a href="listBookAuthor.action?page.currentPage=${page.currentPage+1}">下一页</a>
                </s:elseif>
                <s:elseif test ="page.hasNext()&&state=='category'">
                 <a href="listBookCategory.action?page.currentPage=${page.currentPage+1}">下一页</a>
                </s:elseif>
                <s:elseif test ="page.hasNext()&&state=='price'">
                 <a href="listBookByPrice.action?page.currentPage=${page.currentPage+1}">下一页</a>
                </s:elseif>                 
            </div>  
          </div>
		
	
	<script type="text/javascript">
	$(document).ready(function(){
		$.each($(".content_box"),function(){
			$(this).click(function(){
				$(this).next().click();
			});
		});
	});
	</script>
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
				<li><a href="listBook.action"><span class="actual dolor-left-grid"> 查看所有商品</span></a></li>
			</ul>
		</li>	
		</ul>
					</div>
				<!--initiate accordion-->
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
	   		     		<img class="img-responsive chain" src="images/wat.jpg" alt=" " />	   		     		
	   		     		<div class="grid-chain-bottom chain-watch">
		   		     		<span class="actual dolor-left-grid">30元</span>
		   		     		<span class="reducedfrom">50元</span>  
		   		     		<h6>资治通鉴</h6>  		     			   		     										
	   		     		</div>
	   		     	</div> 	
			</div>
	<div class="clearfix"> </div>
</div>
	<!---->
	<script type="text/javascript">
	function checksearch(){
	 $search=document.getElementById("search").value;
	 if($search==''||$search=='输入书名'){
		 
		 alert("请输入书名");
		 return false;
	 }
	 
	
	}
	</script>
	
	 <div class="footer">
		<div class="footer-top">
			<div class="container">
				<div class="latter">
					<h6>站内搜索</h6>
					<div class="sub-left-right">
						<form action = "listBookName" method = "post" onsubmit="return checksearch()">
							<input type="text" name = "book.bookname" id="search" value="输入书名" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '输入书名';}" />
							<input type="submit" value="搜索" />
						</form>
					</div>
					<div class="clearfix"> </div>
				</div>

				<div class="clearfix"> </div>
			</div>
		</div>
		<div class="footer-bottom">
			<div class="container">
				<form action = "listSingleBook" method = "post" >
				<div class="footer-bottom-cate">
			
					<h6>最新上架</h6>
					
					<ul>
					
						 <li><img src=<s:property value="#session.totalList.get(alllist.size()-1).imagepath"/>><div class="grid-flex"><a href="listSingleBook?book.imagepath=<s:property value="#session.totalList.get(alllist.size()-1).imagepath"/>"></a></div></li>		
 			
					</ul>
				</div>
				<div class="footer-bottom-cate bottom-grid-cat">
					<h6></h6>
					<ul>
						<li><img src =<s:property value="#session.totalList.get(alllist.size()-2).imagepath"/>></li>
					</ul>
				</div>
				<div class="footer-bottom-cate">
					<h6></h6>
					<ul>
						<li><img src =<s:property value="#session.totalList.get(alllist.size()-3).imagepath"/>></li>
					</ul>
				</div>
				<div class="footer-bottom-cate cate-bottom">
					<h6></h6>
					<ul>
						<li><img src =<s:property value="#session.totalList.get(alllist.size()-4).imagepath"/>></li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</form>
			</div>
		</div>
	</div>
</body>
</html>