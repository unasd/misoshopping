<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="head.jsp" %>
</head><!--/head-->
<body>
	<%@include file="header.jsp" %>
	
	<section id="slider"><!--slider-->
		<div class="container">
			<div class="row">
				
			</div>
		</div>
	</section><!--/slider-->
	
	<%@include file="content.jsp" %>
	<%@include file="footer.jsp" %>
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
    <script>
    
    // 대분류 카테고리 이벤트처리기
    $(".getCategoryBIdx").on("click", function(){
    	var categoryBIdx = $(this).attr("idx");
    	//alert(categoryBIdx);
    	location.href = "/main.do?category_b_idx="+categoryBIdx;
    });
    
 	// 중분류 카테고리 이벤트처리기
    $(".getCategoryMIdx").on("click", function(){
    	var categoryMIdx = $(this).attr("idx");
    	location.href = "/main.do?category_m_idx="+categoryMIdx;
    });
    
    </script>
</body>
</html>