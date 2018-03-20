<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>靓淘网_购物车</title>
		<link rel="stylesheet" type="text/css" href="${ctx}/static/front/CSS/cart_style.css" />
		<link rel="stylesheet" type="text/css" href="${ctx}/static/front/CSS/login_style.css" />
		<script type="text/javascript" src="${ctx}/static/js/jquery.js"></script>
	</head>

	<body>
		<div class="bg_color">
			<div class="top_center">
				<div class="left">
					<span class="wel">欢迎${CURRENT_USER.username}来到靓淘网！</span>
				</div>
				<div class="right">
					<ul>
						<li>
							<a class="login" href="login.html" target="_blank">请登录</a>
						</li>
						<li>
							<a href="register.html" target="_blank">快速注册</a>
						</li>
						<li>
							<a class="collect" href="">我的收藏</a>
						</li>
						<li>
							<a class="indent" href="">我的订单</a>
						</li>
						<li>
							<a class=phone href="">手机靓购</a>
						</li>
						<li>
							<a href="">我的积分</a>
						</li>
						<li>
							<a href="">我的评价</a>
						</li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="logo_center">
			<div class="left">
				<a href="${ctx}/index.shtml"><img class="logo_img" src="${ctx}/static/front/img/LOGO.png" /></a>
				<span class="car_text">购物车</span>
			</div>
			<div class="right">
				<input class="car_input" type="text" />
				<input class="car_search" type="button" value="搜索" />
			</div>
		</div>
			<!-- model.addAttribute("cartVo", cartVo); -->
		<div class="title">
			<div class="title_top">
				<ul>
					<li>
						<a href="">全部商品</a>
					</li>
					<li>
						<a href="">降价商品</a>
					</li>
					<li>
						<a href="">库存紧张</a>
					</li>
				</ul>
				<p style="margin:0;padding-right: 10px; float: right;line-height: 40px;">配送至：<span style="border: 1px solid rgb(51,51,51);">山东省 青岛市 市南区 <img src="${ctx}/static/front/img/narrow.png"/></span></p>
			</div>
			<div class="title_center">
				<ul style="color: #666666;margin-top: 10px;margin-bottom: 10px;">
					<li style="margin-left: 16px;margin-right: 8px;">
						<input type="checkbox" />
					</li>
					<li style="margin-left: 8px;margin-right: 38px;">全选</li>
					<li style="margin-left: 38px;margin-right: 168px;">商品</li>
					<li style="margin-left: 138px;margin-right: 58px;">单价</li>
					<li style="margin-left: 58px;margin-right: 58px;">数量</li>
					<li style="margin-left: 58px;margin-right: 58px;">小计</li>
					<li style="margin-left: 58px;margin-right: 36px;">操作</li>
				</ul>
			</div>
			<div class="title_bottom">
			<input type="checkbox" style="color: #666666;margin: 23px 11px 10px 22px;" />
			<img src="${ctx}/static/front/img/156.png" style="margin: 0px 142px 0px 11px; " />
			<img src="${ctx}/static/front/img/157.png" style="margin-left: 142px; " />
		</div>
		</div>
		<c:forEach items="${cartVo.cartItemList}" var="cartItemVo">
			<div class="car_1">
				<div class="car_1_top">
				${cartItemVo.product.id}
					<img src="${ctx}/static/front/img/158.png" />
					<p class="car_1_top_p">
						<span class="span1">
							活动商品购满¥105.00 , 即可加价换购商品1件&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</span>
						<span class="span2">
							&nbsp;查看换购品
						</span>
						<span class="span3">
							&nbsp;&nbsp;去凑单&gt;
						</span> 
					</p>
				</div>
				<div class="car_2_bottom">
					<div class="car_con_1">
						<c:if test="${cartItemVo.checkStatus==1 }">
							<input checked type="checkbox" name="selectCheckbox" onclick="checkSelected()"  id="checkbox${cartItemVo.product.id}"/>
						</c:if>
						<c:if test="${cartItemVo.checkStatus==0}" >
							<input  type="checkbox" name="selectCheckbox" onclick="checkSelected()"  id="checkbox${cartItemVo.product.id}"/>
						</c:if>
					</div>
					<div class="car_con_2">
						<img src="${ctx}/static/front/img/159.png" />
					</div>
				
					<div class="car_con_3">
						<p class="p_title">${cartItemVo.product.name}</p>
						<img src="${ctx}/static/front/img/160.png" />
						<p class="p_seven">&nbsp;支持7天无理由退货</p>
						<img src="${ctx}/static/front/img/161.png" />
						<p class="p_select">&nbsp;选包装</p>
					</div>
					<ul class="car_ul">
						<li class="price">
							<span style="color: #CCCCCC; margin-bottom: 15px;line-height: 20px;">
								<del>
									¥ 1699.00<br />
								</del>
							</span>
							<span style="color: #666666;" id="price${cartItemVo.product.id}" price="${cartItemVo.product.price}" >
								¥ ${cartItemVo.product.price}
							</span>
						</li>
						<li class="num_select">
							<input class="car_ul_btn1" type="button" value="-" onclick="addOrSub(${cartItemVo.product.id}, '-')"/>
							<input class="car_ul_text" type="text" onblur="lostFoucs(${cartItemVo.product.id})" id="amount${cartItemVo.product.id}" placeholder="1" value="${cartItemVo.amount}"/>
							<input class="car_ul_btn2" type="button" value="+" onclick="addOrSub(${cartItemVo.product.id}, '+')"/>
						</li>
						<li class="money">
							<span style="color: #F41443;" id="cartItemTotalPrice${cartItemVo.product.id}">
								${cartItemVo.product.price*cartItemVo.amount}
							</span>
						</li>
						<li class="delete" >
							<img src="${ctx}/static/front/img/166.png" onclick="deleteCartItemById(${cartItemVo.product.id})"/>
						</li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</c:forEach>
		
		<div class="blank">
			
		</div>
		<!--立即结算开始 -->
			<div class="total">
				<ul style="color: #666666;margin-top: 10px;margin-bottom: 10px;">
					<li style="margin-left: 16px;margin-right: 8px;">
						<input type="checkbox" id="selectAllOrNone" />
					</li>
					<li style="margin-left: 8px;margin-right: 265px;">全选</li>
					<li style="margin-left: 265px;margin-right: 18px;">总金额（已免运费）：
						<span id="totalPrice" style="color: #F41443;">¥7175</span>
					</li>
					<li class="total_right">
						<a onclick="toAddOrder()">立即结算</a>
					</li>
				</ul>
			</div>
		<!-- 立即结算结束 -->	
		<div class="sp">
			<div class="sp1">
				<p style="color: rgb(51,51,51);">品质保障</p>
				<p style="font-size: 12px; color: #808080;margin-top: 5px;">品质护航 购物无忧</p>
			</div>
			<div class="sp2">
				<p style="color: rgb(51,51,51);">品质保障</p>
				<p style="font-size: 12px; color: #808080;margin-top: 5px;">品质护航 购物无忧</p>
			</div>
			<div class="sp3">
				<p style="color: rgb(51,51,51);">品质保障</p>
				<p style="font-size: 12px; color: #808080;margin-top: 5px;">品质护航 购物无忧</p>
			</div>
			<div class="sp4">
				<p style="color: rgb(51,51,51);">品质保障</p>
				<p style="font-size: 12px; color: #808080;margin-top: 5px;">品质护航 购物无忧</p>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="more">
			<div class="mb1">
				<ul>
					<li>
						购物指南
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;免费注册
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;开通支付宝
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;支付宝充值
						</a>
					</li>
				</ul>
			</div>
			<div class="mb2">
				<ul>
					<li>
						品质保障
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;发票保障
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;售后规则
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;缺货赔付
						</a>
					</li>
				</ul>
			</div>
			<div class="mb3">
				<ul>
					<li>
						支付方式
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;快捷支付
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;信用卡
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;货到付款
						</a>
					</li>
				</ul>
			</div>
			<div class="mb4">
				<ul>
					<li>
						商家服务
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;商家入驻
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;商家中心
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;运营服务
						</a>
					</li>
				</ul>
			</div>
			<div class="mb5">
				<ul>
					<li>
						手机靓淘
					</li>
					<li>
						<img src="${ctx}/static/front/img/98.png"/>
					</li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="link">
			<ul>
				<li>
					<a href="">
						关于靓淘
					</a>
				</li>
				<li>
					<a href="">
						帮助中心
					</a>
				</li>
				<li>
					<a href="">
						开放平台
					</a>
				</li>
				<li>
					<a href="">
						诚聘精英
					</a>
				</li>
				<li>
					<a href="">
						联系我们
					</a>
				</li>
				<li>
					<a href="">
						网站合作
					</a>
				</li>
				<li>
					<a href="">
						法律声明及隐私政策
					</a>
				</li>
				<li>
					<a href="">
						知识产权
					</a>
				</li>
				<li>
					<a href="">
						廉政举报
					</a>
				</li>
				<li>
					<a href="">
						规则意见征集
					</a>
				</li>
			</ul>
		</div>
		<div class="copyright">
			COPYRIGHT 2010-2017 北京创锐文化传媒有限公司 JUMEI.COM 保留一切权利. 客服热线：400-123-888888<br /> 
			京公网安备 110101020011226|京ICP证111033号|食品流通许可证 SP1101051110165515（1-1）|营业执照
		</div>
		<!-- 添加登录的弹窗  开始 -->
		
		
		<!-- login弹出层开始 -->
		<div class="login" style="display:none" id="loginForm">
			<form id="login-form">
				<ul>
					<li class="login_title_1">
						<a href="">密码登录</a>
	
					</li>
					<li class="login_title_2">
						<a href="">扫码登录</a>
					</li>
					<li>
						<input id="username" name="username" class="login_user" type="text" placeholder="会员名/邮箱/手机号" />
						<input id="password" name="password" class="login_password" type="password" placeholder="密码" />
						<input class="login_btn" type="button" onclick="login()" value="登录" />
					</li>
					<li class="login_select">
						<a class="weibo" href="">微博登录</a>
						<a class="zhifubao" href="">支付宝登录</a><br />
					</li>
					<li class="renmenber_user">
						<input type="checkbox" value="remer_user" id="remer_user" />
						<label for="remer_user">记住用户名</label>
					</li>
					<li class="login_bottom">
						<a onclick="forgetPassword()">忘记密码</a>
						<a onclick="toRegisterPage()">免费注册</a>
					</li>
				</ul>
			</form>
		</div>
		
		<!-- 添加登录的弹窗  结束 -->
		
		<script>
			layui.use(['layer'], function(){
			  var layer = layui.layer;
			});
			
			
			
			//跳转到注册页面
			function toRegisterPage(){
				window.location.href = '${ctx}/user/toRegisterPage.shtml';
			/* 	$.ajax({
					url:'${ctx}/user/toRegisterPage.shtml',
					dataType:'json',
					data:'',
					Type:'POST',
					success:function(jsonData){
					}
				}); */
			}
			
			
			//跳转到结算页面
			function toAddOrder(){
				//获得总共的checkbox的数量
				var name='${CURRENT_USER.username}';
				if(name!=''){
					window.location.href = '${ctx}/order/getOrderPage.shtml';
					
				}
				var checkboxes=$('input[name=selectCheckbox]');
				var uncheckboxes=$('input[name=selectCheckbox]').not("input:checked");
				
				var user='${CURRENT_USER}';
				if(checkboxes.length==uncheckboxes.length){
					layer.open({
						title: '在线调试',
						content: '您尚未选择任何商品'
					});
					//alert("您尚未选择任何商品");
				}else{
					if(user==''){
						layer.open({
							type : 1,
							title : '登录',
							offset : '50px',
							area : ['400px','500px'],
							content : $('#loginForm')
						});
					}else{
						window.location.href = '${ctx}/order/getOrderPage.shtml';
					}
				}
			}
			//登录验证
			function login(){
				
				var username=$("#username").val();
				var password=$("#password").val();
				//1.1、验证用户名是否为空
	    		if(util.isNull(username)) {
	    			mylayer.errorMsg("用户名不能为空");
	    			return;
	    		}
	    		
	    		//1.2、是否合法：4-8数字或字母
	    		if(!isUsernameValid(username)) {
	    			mylayer.errorMsg("用户名不合法，4-8数字或字母");
	    			return;
	    		}
	    		
	    		//2、密码不能为空
	    		if(util.isNull(password)) {
	    			mylayer.errorMsg("密码不能为空");
	    			return;
	    		}
	    		$.ajax({
	    			url:"${ctx}/user/login.shtml",
	    			type:'POST',
	    			dataType:'json',
	    			data:$("#login-form").serialize(),
	    			success:function(data){
	    				if(data.code == util.SUCCESS) {
	    					mylayer.success(data.msg);
	    					window.location.href = '${ctx}/order/getOrderPage.shtml';
	    				} else {
	    					mylayer.errorMsg(data.msg);
	    				}
	    			}
	    		});
			}
			
			//检查用户名是否匹配
			function isUsernameValid(value) {
	    		var pattern = /^[0-9a-zA-Z]{4,8}$/;
	    		return pattern.test(value);
	    	} 
			
			
			//为购物项中的checkbox添加点击事件,用来监听购物项中的所有checkbox的checked=true时，设置Id=“selectAllOrNone”的checked=true
			function checkSelected(){
				//获得总共的checkbox的数量
				var allCheckboxes=$('input[name=selectCheckbox]');
				var allSelectedCheckboxes=$('input[name=selectCheckbox]:checked');
				if(allSelectedCheckboxes.length==allCheckboxes.length){
					$("#selectAllOrNone").prop("checked",true);
					refreshTotalPrice();
				}else{
					$("#selectAllOrNone").prop("checked",false);
					refreshTotalPrice();
				}
			}
			
			//页面加载完时执行
			$(function(){
				refreshTotalPrice();
				checkSelected();
			});
			
			//为id=selectAllOrNone的标签添加全选或全不选的事件
			$("#selectAllOrNone").click(function(){
				//获得总共的checkbox的数量
				var checkboxes=$('input[name=selectCheckbox]');
				if($(this).attr('checked')){
					for(var i=0;i<checkboxes.length;i++){
						checkboxes[i].checked=true;
					}
				}else{
					for(var i=0;i<checkboxes.length;i++){
						checkboxes[i].checked=false;
					}
				}
			});
			
			//检查库存量
			function checkStock(productId){
				$.ajax({
					//async:false;当为false时，同步执行，true时异步执行，默认为true
					url:'${ctx}/product/getProductStock.shtml',// 请求此地址获取该商品的库存量
					data:{'productId':productId}, //stock
					type:'post',
					dataType:'json',
					success : function(jsonData){ //{'a':'11'} 
					//jsonData.data;
						var tempstock=jsonData.stock;
						//alert("tempstock:"+tempstock);
						var stock=parseInt(tempstock);
						var totalamount=parseInt($('#amount'+productId).val());
						if(totalamount>stock){
							$('#amount'+productId).val(stock);
						}else{
							$('#amount'+productId).val(totalamount);
						} 
					}
				});
			}
			
			//函数2开始，实现加减功能
			function addOrSub(productId, operator){
				var delta;
				if(operator=='+') {
					delta = 1;
				} else {
					delta = -1;
				}
				var num = $('#amount'+productId).val();
				$.ajax({
					url : '${ctx}/cart/addOrUpdateCart.shtml',
					data : {'productId' : productId, 'amount' : delta},
					type : 'POST',
					dataType : 'json',
					success : function(jsonObj) {
						if(jsonObj.code == util.SUCCESS) {
							num = parseInt(num) + delta;
							if(num<1){
								//当num<1时，直接将num设为0
								num=0;
								$('#amount'+productId).val(0);
							}else{//当输入框中的值>0的时候
								//发送ajax请求，重新获取stock，并进行最大最大数的判断，如果amount大于stock，设置为stock，反之设为amount
							   
								
								$('#amount'+productId).val(num);
							}
							var price = $('#price'+productId).attr('price');
							var totalPrice = num * price;
							$('#cartItemTotalPrice'+productId).html(totalPrice);
						} else {
							mylayer.errorMsg(jsonObj.msg);
						}
					}
				});
			}
			
			//重新计算总价值
			function refreshTotalPrice(){
				var checkboxes=$('input[name=selectCheckbox]:checked');
				var totalPrice=0.0;
				for(var i=0;i<checkboxes.length;i++){
					var checkboxId=checkboxes[i].getAttribute("id");
					var id=checkboxId.substr('checkbox'.length);
					var cartItemTotalPrice = $('#cartItemTotalPrice'+id).html();
					totalPrice += parseFloat(cartItemTotalPrice);
				}
				$('#totalPrice').html(totalPrice);
			}
			
			
			//blur事件，有bug存在,amount是输入框的ID
 			function lostFoucs(productId){
				var ret = /^-?[0-9]+$/;//"^-?[0-9]+$"　
				//Math.abs(-1);
				var str = $("#amount"+productId).val(); 
				if(!ret.test(str)){
					$("#amount"+productId).val(0);
					var amount=parseInt($("#amount"+productId).val());
					var price = $('#price'+productId).attr('price');
					var totalPrice = amount * price;
					$('#cartItemTotalPrice'+productId).html(totalPrice);
					refreshTotalPrice();
				}
				
				if(ret.test(str)){//checkStock(productId)方法是异步请求，有bug存在，
					var amount=parseInt($("#amount"+productId).val());
					amount=Math.abs(amount);
					//发送ajax请求，获取amount的值进行运算
					$.ajax({
						url:'${ctx}/product/getProductStock.shtml',// 请求此地址获取该商品的库存量
						data:{'productId':productId}, //stock
						type:'post',
						dataType:'json',
						success : function(jsonData){ //{'a':'11'} 
						//jsonData.data;
							var tempstock=jsonData.stock;
							//alert("tempstock:"+tempstock);
							var stock=parseInt(tempstock);
							//var totalamount=parseInt($('#amount'+productId).val());
							if(amount>stock){
								$('#amount'+productId).val(stock);
								var price = $('#price'+productId).attr('price');
								var totalPrice = stock * price;
								$('#cartItemTotalPrice'+productId).html(totalPrice);
								refreshTotalPrice();
							}else{
								$('#amount'+productId).val(amount);
								var price = $('#price'+productId).attr('price');
								var totalPrice = amount * price;
								$('#cartItemTotalPrice'+productId).html(totalPrice);
								refreshTotalPrice();
							} 
						}
					});
				}
			}
			
			//删除购物项
			function deleteCartItemById(productId){
				layer.confirm("确定要删除所选商品吗？",function(){
					$.ajax({
						url:'${ctx}/cart/deleteCartItemById.shtml',
						data:{"productId":productId},
						dataType:"json",
						Type:'POST',
						success:function(jsonData){
							if(jsonData.code==util.SUCCESS){
								mylayer.success(jsonData.msg);
								$("#checkbox"+productId).parent().parent().parent().remove();
								refreshTotalPrice();
							}else{
								mylayer.errorMsg(jsonObj.msg);
							}
						}
					});
				});
			}
			
		</script>
	</body>

</html>