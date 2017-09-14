<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" deferredSyntaxAllowedAsLiteral="true"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>信息管理</title>
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
	        url:"offManager.action",
	        data:'managers.managerId=<s:property value="#session.managerId"/>',
	        success:function(data){
	        return true;
	        }
	    });
	});
</script>
<script type="text/javascript">
    $(function(){
    	var img = "<img src ='' name = 'img' id= 'img'/>";
    	$(img).insertBefore("#file");
    	$("#file").change(function(){
    		var s = $("#file").val().split("fakepath\\");
    		var a = "images/"+s[s.length-1];
    		$("#img").attr('src',a);
    	});
    });
    </script>
<script language="javascript" type="text/javascript"> 
				function btn1(){
					document.getElementById('div1').style.display='';
					document.getElementById('div2').style.display='none';
					document.getElementById('div3').style.display='none';
				}
				function btn2(){
					document.getElementById('div1').style.display='none';
					document.getElementById('div2').style.display='';
					document.getElementById('div3').style.display='none';
				}	
				function btn3(){
					document.getElementById('div1').style.display='none';
					document.getElementById('div2').style.display='none';
					document.getElementById('div3').style.display='';
				}
</script>
<style type="text/css">
.content_box {
	cursor: pointer;
}
</style>
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
						<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Summer is Book</div>
					</div>
					<s:iterator value = "#session.manager">
					<div class = "search">
					<span class="dolor-left"><s:property value = "username"/>,欢迎来到SIB！</span>
					</div>
		            </s:iterator>		           
					<div class="clearfix"> </div>
				</div>
				<div class="header-bottom-right">										
							<ul class="login">					
								<li><a href="offManager.action?managers.managerId=<s:property value="#session.managerId"/>"><span> </span>下线</a></li>
							</ul>
					<div class="clearfix"> </div>
				</div>
				<div class="clearfix"> </div>	
			</div>
		</div>
	</div>
	<!---->
	<!-- start content -->
	<div class="container">	
	<div class="women-product" id = "div1">
		<div class="grid-product">
		<s:iterator value = "#session.unchecked" >
		  <div class="product-grid">
			<div class="content_box">
			   	<div class="left-grid-view grid-view-left">
			   	<h4><span class="actual dolor-left-grid"><s:property value = "users.name"/>对书本《<s:property value = "book.bookname"/>》（出版社：<s:property value = "book.publish"/>）<br/>发表评论:</span></h4>				    
				     <span class="actual dolor-left-grid"><s:property value = "content"/></span><br/>
				     <span class="actual dolor-left-grid"><s:property value = "commentDate"/></span>
				     <form action="check" method = "post"><input type = "hidden" name = "comments.id" value = "<s:property value = "id"/>">
				     <input type = "submit" value = "审核通过"></form>
				     <form action = "deleteComments" method = "post"><input type = "hidden" name = "comments.id" value = "<s:property value = "id"/>">
				     <input type = "submit" value = "删除此评论"></form> 
			            </div>
			            &nbsp;&nbsp;&nbsp;&nbsp; 
				</div> 
			   	</div> 
			   	</s:iterator>
              	</div>		
			<div class="clearfix"> </div>
			<div id="page_area">                   
                <s:if test="page.hasPrevious()">  
                    <a href="listUnchecked.action?page.currentPage=${page.currentPage-1}">上一页</a>  
                </s:if>                    
                <span>第${page.currentPage}页</span>  
                <span>共${page.getTotalPage()}页</span>                  
                <s:if test="page.hasNext()">  
                    <a href="listUnchecked.action?page.currentPage=${page.currentPage+1}">下一页</a>  
                </s:if>                
            </div>  
            </div>
            <!-- 显示用户信息 -->
	<div class="main" id = "div2" style="display:none">
            <div class="reservation_top">
                <div class=" contact_right">
                    <table class="table table-hover">

                        <tr>
                            <th>用户id</th>
                            <th>用户账号</th>
                            <th>用户姓名</th>
                            <th>是否上线(0表示离线，1表示上线)</th>
                            <th>操作</th>
                        </tr>
                       <s:iterator value = "#session.allUser">
                        <tr>
                            <td class="shopping-cart-item">
                                <div class="product-thumbnail">
                                    <s:property value = "userId"/>
                                </div>
                            </td>
                            <td><s:property value = "username"/></td>
                            <td><s:property value = "name"/></td>
                            <td> <s:property value = "state"/></td>
                            <td><form action = "deleteUser"><input type = "hidden" value = "<s:property value = "userId"/>" name = user.userId><input type = "submit" value = "删除"></form></td>
                        </tr>
                        </s:iterator>
                    </table>
                </div>
            </div>
        </div>
        <!-- 添加书本 -->
         <div class="register" id = "div3" style="display:none">
		  	  <s:form action="saveBook" method ="post" enctype="multipart/form-data">
		  	  <div class="type-file-box">
		  	  <input type = "file" name = "file" id ="file"/>
		  	  </div>
				 <div class="  register-top-grid">
					<h3>书本信息</h3>
					<div class="mation">
						<span>书名<label>*</label></span>
						<input type="text" name = "book.bookname"/> 
						<span>作者<label>*</label></span>
						<input type="text" name = "book.author"/>
						 <span>出版社<label>*</label></span>
						 <input type="text" name = "book.publish"/>
						 <span>单价<label>*</label></span>
						 <input type="text" name = "book.price"  onkeyup="javascript:RepNumber(this)"/>
						 <span>库存<label>*</label></span>
						 <input type="text" name = "book.quality" onkeyup="javascript:RepNumber(this)"/>
						 <span>类别<label>*</label></span>
						 <input type="text" name = "book.category"/>
						 <span>书本简介<label>*</label></span>
						 <input type="text" name = "book.description"/>
					</div>
					 </div>	
				<div class="register-but">
				<span class="actual dolor-left-grid"><s:submit value = "提交"></s:submit></span>
                </div>
				</s:form>	  	
		   </div>
	<!---->
    <div class="sub-cate">
				<div class=" top-nav rsidebar span_1_of_left">
					<h3 class="cate">用户中心</h3>
		  <ul class="menu">
		<li>
			<ul class="kid-menu">
				<li><a href="#" id="btn1" onclick="btn1()"><span class="actual dolor-left-grid"> 评论信息</span></a></li>
			</ul>
		</li>	
			<li>
			<ul class="kid-menu">
				<li><a href="#" id="btn2" onclick="btn2()"><span class="actual dolor-left-grid">用户信息</span></a></li>
			</ul>
		</li>	
			
			<li>
			<ul class="kid-menu">
				<li><a href="#" id="btn3" onclick="btn3()"><span class="actual dolor-left-grid"> 添加书本</span></a></li>
			</ul>
		</li>	
		
		
		</ul>
	</div>
	  </div>
	  </div>
	  </div>
</body>
</html>