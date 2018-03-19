<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		
		<div class="nav_left">
		${dataList }
			<c:forEach items="${topDataList}" var="topCategory">
				<span> ${topCategory.name} </span>
				<p>
					<c:forEach items="${secondCategoryList}" var="secondCategory">
						<c:if test="${topCategory.id==secondCategory.parentId}">
							<span href="#">${secondCategory.name}</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						</c:if>
					</c:forEach>
					<hr style="height:5px;border:none;border-top:5px ridge green;" />
				</p>
			</c:forEach>
		</div>
	
	<script type="text/javascript">
		
	</script>
</body>
</html>