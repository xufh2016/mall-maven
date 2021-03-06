<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>靓淘网</title>
<link rel="stylesheet" href="${ctx}/static/front/CSS/index_style.css" />
<link href="${ctx}/static/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />
<link href="${ctx}/static/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css" />

<link href="${ctx}/static/basic/css/demo.css" rel="stylesheet"
	type="text/css" />

<link href="${ctx}/static/css/seastyle.css" rel="stylesheet"
	type="text/css" />

<script type="text/javascript"
	src="${ctx}/static/basic/js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/script.js"></script>
</head>

<body>
	<!-----------------------1.top-------------------->
	<div class="bg_color">
		<div class="top_center">
			<div class="left">
				<span class="wel"> 欢迎${CURRENT_USER.username}来到靓淘！ </span>
			</div>
			<div class="right">
				<ul>
					<li><a class="login" href="${ctx}/jsp/login.shtml"
						target="_blank">请登录</a></li>
					<li><a href="register.html" target="_blank">快速注册</a></li>
					<li><a class="collect" href="">我的收藏</a></li>
					<li><a class="indent" href="">我的订单</a></li>
					<li><a class="phone" href="">手机靓淘</a></li>
					<li><a href="">我的积分</a></li>
					<li><a href="">我的评价</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-----------------------2.logo-------------------->
	<div class="logo_center">
		<div class="left">
			<a href="${ctx}/index.shtml">
				<img class="logo_img" src="${ctx}/static/front/img/LOGO.png" />
			</a>
		</div>
		<div class="center">
			<input class="btn1" type="text" value="洗面奶" name="searchName" id="searchName"/> 
			<input class="btn2" type="button" value="搜索" onclick="searchProduct()"/>
			<ul class="nav">
				<li><a href="" style="color: pink;">保湿 | </a></li>
				<li><a href="">面膜 | </a></li>
				<li><a href="">洗面奶 | </a></li>
				<li><a href="">补水 | </a></li>
				<li><a href="">香水 | </a></li>
				<li><a href="">眼霜 | </a></li>
				<li><a href="">口红 | </a></li>
				<li><a href="">护肤套装 | </a></li>
				<li><a href="">BB霜 | </a></li>
			</ul>
		</div>
		<div class="right">
			<div class="car">
				<a class="car_pic" href="cart.html" target="_blank">去购物车结算</a>
			</div>
			<div class="narrow"></div>
		</div>
	</div>
	<!-----------------------3.导航栏-------------------->
	<div class="big_menu">
		<div class="menu">
			<ul class="menu_ul">
				<li><a class="current" href=""> 商城首页 </a></li>
				<li><a href=""> 美妆商城 </a></li>
				<li><a href=""> 服装运动 </a></li>
				<li><a href=""> 家电数码 </a></li>
				<li><a href=""> 家装家纺 </a></li>
				<li><a href=""> 淘遍美食 </a></li>
				<li><a href=""> 国际轻奢 </a></li>
				<div class="clearfix"></div>
			</ul>
		</div>
	</div>
	<!-----------------------5.品牌选择区-------------------->
	<div class="select_Brand">
		<div class="am-g am-g-fixed">
			<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
				<c:forEach items="${productList}" var="product">
					<li>
						<div class="i-pic limit">
							<a href="${ctx}/product/detail.shtml?productId=${product.id}"> 
							<img src="/pic/${product.mainImage}" style="width: 200px;height: 250px"/>
								<p class="title fl">${product.subtitle}</p>
							</a>
							<p class="price fl">
								<b>¥</b> <strong>${product.price}</strong>
							</p>
							<p class="number fl">
								销量<span>1110</span>
							</p>
						</div>
					</li>
				</c:forEach>

			</ul>
		</div>
	</div>

	<!-----------------------9.靓淘服装区-------------------->
	<div class="sp">
		<div class="sp1">
			<p style="color: rgb(51, 51, 51);">品质保障</p>
			<p style="font-size: 12px; color: #808080; margin-top: 5px;">品质护航
				购物无忧</p>
		</div>
		<div class="sp2">
			<p style="color: rgb(51, 51, 51);">品质保障</p>
			<p style="font-size: 12px; color: #808080; margin-top: 5px;">品质护航
				购物无忧</p>
		</div>
		<div class="sp3">
			<p style="color: rgb(51, 51, 51);">品质保障</p>
			<p style="font-size: 12px; color: #808080; margin-top: 5px;">品质护航
				购物无忧</p>
		</div>
		<div class="sp4">
			<p style="color: rgb(51, 51, 51);">品质保障</p>
			<p style="font-size: 12px; color: #808080; margin-top: 5px;">品质护航
				购物无忧</p>
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="more">
		<div class="mb1">
			<ul>
				<li>购物指南</li>
				<li><a href=""> &nbsp;&nbsp;免费注册 </a></li>
				<li><a href=""> &nbsp;&nbsp;开通支付宝 </a></li>
				<li><a href=""> &nbsp;&nbsp;支付宝充值 </a></li>
			</ul>
		</div>
		<div class="mb2">
			<ul>
				<li>品质保障</li>
				<li><a href=""> &nbsp;&nbsp;发票保障 </a></li>
				<li><a href=""> &nbsp;&nbsp;售后规则 </a></li>
				<li><a href=""> &nbsp;&nbsp;缺货赔付 </a></li>
			</ul>
		</div>
		<div class="mb3">
			<ul>
				<li>支付方式</li>
				<li><a href=""> &nbsp;&nbsp;快捷支付 </a></li>
				<li><a href=""> &nbsp;&nbsp;信用卡 </a></li>
				<li><a href=""> &nbsp;&nbsp;货到付款 </a></li>
			</ul>
		</div>
		<div class="mb4">
			<ul>
				<li>商家服务</li>
				<li><a href=""> &nbsp;&nbsp;商家入驻 </a></li>
				<li><a href=""> &nbsp;&nbsp;商家中心 </a></li>
				<li><a href=""> &nbsp;&nbsp;运营服务 </a></li>
			</ul>
		</div>
		<div class="mb5">
			<ul>
				<li>手机靓淘</li>
				<li><img src="${ctx}/static/front/img/98.png" /></li>
			</ul>
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="link">
		<ul>
			<li><a href=""> 关于靓淘 </a></li>
			<li><a href=""> 帮助中心 </a></li>
			<li><a href=""> 开放平台 </a></li>
			<li><a href=""> 诚聘精英 </a></li>
			<li><a href=""> 联系我们 </a></li>
			<li><a href=""> 网站合作 </a></li>
			<li><a href=""> 法律声明及隐私政策 </a></li>
			<li><a href=""> 知识产权 </a></li>
			<li><a href=""> 廉政举报 </a></li>
			<li><a href=""> 规则意见征集 </a></li>
		</ul>
	</div>
	<div class="copyright">
		COPYRIGHT 2010-2017 北京创锐文化传媒有限公司 JUMEI.COM 保留一切权利. 客服热线：400-123-888888<br />
		京公网安备 110101020011226|京ICP证111033号|食品流通许可证
		SP1101051110165515（1-1）|营业执照
	</div>
	<script type="text/javascript">
		var m = 0;
		$(".banner_box .banner").hide().eq(0).show();
		function changeImg() {
			if (m < 3) {
				m = m + 1
			} else {
				m = 0
			}
			$(".circle li").removeClass("current").eq(m).addClass("current");
			$(".banner_box .banner").hide().eq(m).show();
		}
		t = setInterval(changeImg, 1000);
		$(".banner_box").mouseenter(function() {
			clearInterval(t);
		}).mouseleave(function() {
			t = setInterval(changeImg, 1000);
		})
		$(".circle li").click(function() {
			m = $(this).index();
			$(".circle li").removeClass("current").eq(m).addClass("current");
			$(".banner_box .banner").hide().eq(m).show();
		})
		function searchProduct(){
			var searchName=$("#searchName").val();
		//	alert(searchName);
			window.location.href="${ctx}/product/searchProduct.shtml?sc_name="+searchName;
			/*  $.ajax({
				url:'${ctx}/product/searchProduct.shtml',
				dataType:'json',
				data:{'sc_name':searchName},
				 success:function(jsonData){
					var productList=jsonData.data;
					//alert(data);
					window.location.href="${ctx}/product/productList.shtml"
				} 
			});  */
		}

		/* 	$("#topCategory",function(){
				//html=html();
				var html='<span id="topCateryId" > </span>';
				for(var i=0;i<${fn:length(dataList)};i++){
					console.log(i);
					html+='<span id="topCateryId" >'+${dataList[i].name}+' </span>';
				}
				this.html(html);
			}); */

		/*			
				$(".banner_box .banner").hide().eq(0).show();
				$(".circle li").click(
					function(){
						var i = 0;
						i = $(this).index();
						$(".banner_box .banner").hide().eq(i).show();
						
					}
				)
				$(".circle li").click(
					function(){
						var n = 0;
						n = $(this).index();
						$(".circle li").removeClass("current").eq(n).addClass("current");
					}
				)*/
	</script>
</body>

</html>