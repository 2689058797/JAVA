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
    <meta charset="UTF-8">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--fonts-->
    <!--<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>-->
    <!--//fonts-->
    <script src="js/jquery.min.js"></script>
     <!--script-->
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
                    <div class="search">
                  
                    </div>
                    <div class="clearfix"> </div>
                </div>
				<div class="header-bottom-right">					
						<div class="account"><a href="login.jsp"><span> </span>你的账户</a></div>
							<ul class="login">
								<li><a href="offLine.action?users.userId=<s:property value="#session.userId"/>"><span> </span>下线</a></li>|
								<li ><a href="register.jsp">注册</a></li>
							</ul>
					<div class="clearfix"> </div>
				</div>
				<div class="clearfix"> </div>	
			</div>
		</div>
	</div>
	<!---->
	<div class="container">

			<!---->
		<div class="main">
            <div class="reservation_top">
                <div class=" contact_right">
                    <table class="table table-hover">

                        <tr>
                            <th>产品</th>
                            <th>价格</th>
                            <th>数量</th>
                            <th>库存</th>
                            <th>花费</th>
                            <th>添加时间</th>
                            <th></th>
                        </tr>
                       <s:iterator value = "#session.itemList">
                        <tr>
                            <td class="shopping-cart-item">
                                <div class="product-thumbnail">
                                    <img src="<s:property value = "book.imagepath"/>" alt="">
                                    <h6><s:property value = "book.bookname"/></h6>
                                </div>
                            </td>
                            <td class="price" id = "price"><s:property value = "book.price"/></td>
                            <td><input class="numeric-input" type="text" value="1" style="width:100px;"></td>
                            <td class="price"><input type = "text" value = "<s:property value = "book.quality"/>" style="width:100px;" readonly></td>
                            <td class="total"></td>
                            <td><s:property value ="addDate" /></td>
                            <td><s:form action = "deleteItem" method = "post"><input type ="hidden"  name = "shopCar.id" value = "<s:property value = "id"/>"><s:submit value = "删除"></s:submit></s:form>
                        </tr>
                        </s:iterator>
                        <tr>
                            <td class="shopping-cart-item">

                            </td>
                            <td></td>
                            <td><b>total</b></td>
                            <td class="t-total"><strong>9</strong></td>
                            <td></td>
                        </tr>
                           <script type="text/javascript">
                               function sum(){
                                   var sum = 0;
                                   $.each($(".total"),function(){
                                       var i = parseInt($(this).find("strong").text());
                                       if(!isNaN(i)) sum+=i;
                                   })
                                   $(".t-total").find("strong").text(sum);
                               }
                               $(document).ready(function(){
                                   sum();
                                   $.each($(".numeric-input"),function(){
                                       $(this).on("input", function(){
                                           var q = parseInt($(this).val());
                                           if(!isNaN(q)){
                                               var price = parseInt($(this).parent().prev().text());
                                               console.log(q);
                                               console.log(price);
                                               var c = q*price;
                                               $(this).parent().next().find("strong").text(c);
                                               sum();
                                           }
                                       });
                                   })
                               })
                           </script>
                        <tr>
                            <td class="apply-coupon">
                            </td>
                            <td colspan="4" class="align-right">
                                <form action = "purchase" method = "post"><input type = "hidden" name = "book.quality" value =""><input type = "submit" class="btn btn-info" value = "确认购买"></form>
                            </td>
                        </tr>

                    </table>
                </div>
            </div>
        </div>
		<div class="sub-cate">
		<div class=" top-nav rsidebar span_1_of_left">
	    	
	   		     			<a href="listSingleBook?book.imagepath=images/wat.jpg"><img class="img-responsive chain" src="images/wat.jpg" alt=" " /></a>	   		     		
	   		     		<div class="grid-chain-bottom chain-watch">
		   		     		<span class="actual dolor-left-grid">70元</span>
		   		     		<span class="reducedfrom">102元</span>  
		   		     		<h6>资治通鉴</h6>  		     			   		     										
	   		     		</div>
	   			
			</div>
	     </div>
	     </div>
	<!---->
	<div class="footer">
		<div class="footer-top">
			<div class="container">
				<div class="latter">
				
					<div class="sub-left-right">
						<form>
							
						</form>
					</div>
					<div class="clearfix"> </div>
				</div>

				<div class="clearfix"> </div>
			</div>
		</div>
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