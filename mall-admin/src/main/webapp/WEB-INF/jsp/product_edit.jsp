<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<title>商品列表</title>
<meta name="keywords" content="">
<meta name="description" content="">

</head>

<body>
	<div style="margin: 15px">
		<form id="form_add" class="layui-form layui-form-pane" action="">
			<input type="hidden" name="id" value="${product.id}" />
			<div class="layui-form-item">
				<label class="layui-form-label">商品名称</label>
				<div class="layui-input-block">
					<input type="text" name="name" autocomplete="off"
						value="${product.name}" placeholder="请输入商品名称" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品副标题</label>
				<div class="layui-input-block">
					<input type="text" name="subtitle" lay-verify="required"
						value="${product.subtitle}" placeholder="请输入商品副标题"
						autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">商品分类</label>
				<div class="layui-input-inline">
				<!-- lay-filter属性必须加上，js语句中用到  -->
					<select name="quiz1" id="topCategory" lay-filter="topCategoryFilter">
						<option value="">请选一级分类</option>
					</select>
				</div>
				<div class="layui-input-inline">
					<select name="categoryId" id="secondCategory">
						<option value="">请选二级分类</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品价格</label>
				<div class="layui-input-block">
					<input type="text" name="price" autocomplete="off"
						value="${product.price}" placeholder="请输入商品价格" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品库存</label>
				<div class="layui-input-block">
					<input type="text" name="stock" lay-verify="required"
						value="${product.stock}" placeholder="请输入商品库存" autocomplete="off"
						class="layui-input">
				</div>
			</div>

			<div class="layui-form-item" pane="">
				<label class="layui-form-label">商品状态</label>
				<div class="layui-input-block">
					<c:if test="${product.status==1}">
						<input type="radio" name="status" value="1" title="上架" checked="">
						<input type="radio" name="status" value="2" title="下架">
					</c:if>
					<c:if test="${product.status==2}">
						<input type="radio" name="status" value="1" title="上架">
						<input type="radio" name="status" value="2" title="下架" checked="">
					</c:if>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品主图</label>
				<div class="layui-input-block">
					<input type="hidden" id="mainImage" name="mainImage" value="${product.mainImage}"/> <img
						alt="" src="/pic/${product.mainImage}" id="imgId" width="100"
						height="100" /><br /> <input type="file" name="pictureFile"
						onchange="uploadPic()" />
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品图片</label>
				<div class="layui-input-block">
					<a href="javascript:void(0)" id="multiPicUpload"
						class="multiPicUpload">上传图片</a> <input type="hidden"
						id="subImages" name="subImages" value="${product.subImages}"/>
					<div id="subImagesDiv">
						<c:set var="subImages" value="${fn:split(product.subImages,',') }"></c:set>
						<c:forEach items="${subImages}" var="subImage">
							<img src="/pic/${subImage}" width="80" height="50">
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">文本域</label>
				<div class="layui-input-block">
					<textarea placeholder="请输入内容" class="layui-textarea" name="detail">
						${product.detail}
					</textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<button type="button" class="layui-btn" onclick="submitForm()">修改</button>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="${ctx}/static/lib/jquery/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx}/static/lib/kindeditor/kindeditor-all.js"></script>
	<script type="text/javascript">
		layui.use('form', function() {
			var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
			//但是，如果你的HTML是动态生成的，自动渲染就会失效
			//因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
			form.render();
			form.on('select(topCategoryFilter)', function(data){
				  console.log(data.elem); //得到select原始DOM对象
				  console.log(data.value); //得到被选中的值
				  console.log(data.othis); //得到美化后的DOM对象
				  $(function() {
						//加载二级分类
						$.ajax({
							url : '${ctx}/category/selectSecondCategory.action',
							data: 'topCategoryId='+data.value,
							type : 'POST',
							dataType : 'JSON',
							success : function(jsonData) {
								console.log("二级分类");
								console.log(jsonData);
								if (jsonData.code == util.SUCCESS) {
									var html = '<option value="">请选择二级分类</option>';
									var data = jsonData.data;
									form.render('select');
									for (var i = 0; i < data.length; i++) {
										html += '<option value="'+ data[i].id +'">'
												+ data[i].name + '</option>';
									}
									$('#secondCategory').html(html);
									form.render('select');
								} else {
									mylayer.errorMsg(jsonData.msg);
								}
							},
						});
					});
				});   
			});
			var myKindEditor ;
	        KindEditor.ready(function(K) {
	            var kindEditorParams = {
	                    //指定上传文件参数名称
	                    filePostName  : "pictureFile",
	                    //指定上传文件请求的url。
	                    uploadJson : '${ctx}/upload/multiPicUpload.action',
	                    //上传类型，分别为image、flash、media、file
	                    dir : "image",
	                    afterBlur: function () { this.sync(); }
	            }
	            var editor = K.editor(kindEditorParams);
	          //多图片上传 
	            K('#multiPicUpload').click(function() {
	                 editor.loadPlugin('multiimage', function() {
	                     editor.plugin.multiImageDialog({
	                          clickFn : function(urlList) {
	                              console.log(urlList);
	                              var div = K('#subImagesDiv');
	                              var imgArray = [];
	                              div.html('');
	                              K.each(urlList, function(i, data) {
	                                  imgArray.push(data.fileName);
	                                  div.append('<img src="' + data.url + '" width="80" height="50">');
	                              });
	                              $("#subImages").val(imgArray.join(","));
	                              editor.hideDialog();
	                          }
	                     });
	                 });
	             }); 
	            
	            //富文本编辑器
	             myKindEditor = KindEditor.create('#form_add[name=detail]', kindEditorParams);
	         });

		
			$(function() {
				//加载一级分类
				$.ajax({
					url : '${ctx}/category/selectTopCategory.action',
					type : 'POST',
					dataType : 'JSON',
					success : function(jsonData) {
						console.log(jsonData);
						if (jsonData.code == util.SUCCESS) {
							var html = '<option value="">请选择一级分类</option>';
							var data = jsonData.data;
							for (var i = 0; i < data.length; i++) {//注意不要id越界
								if("${parentCategoryId}"==data[i].id){
									html += '<option selected value="'+data[i].id+'">'
											+ data[i].name + '</option>';
								}else{
									html += '<option value="'+data[i].id+'">'
									+ data[i].name + '</option>';
								}
							}
							$('#topCategory').html(html);
						} else {
						}
					},
				});
				
				//加载二级分类
				$.ajax({
					url : '${ctx}/category/selectSecondCategory.action',
					data: 'topCategoryId=${parentCategoryId}',
					type : 'POST',
					dataType : 'JSON',
					success : function(jsonData) {
						console.log("二级分类");
						console.log(jsonData);
						if (jsonData.code == util.SUCCESS) {
							var html = '<option value="">请选择二级分类</option>';
							var data = jsonData.data;
							for (var i = 0; i < data.length; i++) {
								if("${product.categoryId}"==data[i].id){
									html += '<option selected value="'+ data[i].id +'">'
										+ data[i].name + '</option>';
								}else{
									html += '<option value="'+data[i].id+'">'
										+ data[i].name + '</option>';
								}
							}
							$('#secondCategory').html(html);
						} else {
							mylayer.errorMsg(jsonData.msg);
						}
					},
				});
			});
		
		
			//图片上传
			function uploadPic(){
				$("#form_add").ajaxSubmit({
					url : '${ctx}/upload/uploadPic.action',
					type:'post',
					dataType:'json',
					success:function(jsonData){
						console.log(jsonData);
						$('#imgId').attr('src', jsonData.url);
						$('#mainImage').val(jsonData.fileName);
					}
				});
			}
			
			function submitForm(){
				$.ajax({
					url : '${ctx}/product/updateProductById.action',
					data : $('#form_add').serialize(),
					type:'post',
					dataType:'json',
					success:function(jsonData){
						if(jsonData.code==util.SUCCESS){
							//mylayer.success(jsonData.msg);
							//当你在iframe页面关闭自身时
							var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
							setTimeout(function(){
							     parent.layer.close(index); //再执行关闭
							     window.parent.location.reload();//刷新父页面
							},2000);
						}else{
							mylayer.errorMsg(jsonData.msg);
						}
					}
				});
			}
			
	</script>
</body>

</html>
