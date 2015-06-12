<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@include file="head.jsp" %>
</head><!--/head-->

<body>
	<%@include file="header.jsp" %>
	<!-- 
	<section id="advertisement">
		<div class="container">
			<img src="images/shop/advertisement.jpg" alt="" />
		</div>
	</section>
	 -->
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Category</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title"><a href="/shop.do" class="" idx="">전체</a></h4>
							</div>
						</div>
						<c:forEach items="${categoryBList }" var="categoryB">
							<c:choose>
								<c:when test="${categoryB.categoryML eq null }">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title"><a href="#" class="getCategoryBIdx" idx="${categoryB.category_b_idx }">${categoryB.category_b_desc }</a></h4>
									</div>
								</div>
								</c:when>
								<c:otherwise>
									<div class="panel panel-default">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#accordian" href="#${categoryB.category_b_name }">
													<span class="badge pull-right"><i class="fa fa-plus"></i></span>
													${categoryB.category_b_desc }
												</a>
											</h4>
										</div>
										<div id="${categoryB.category_b_name }" class="panel-collapse collapse">
											<div class="panel-body">
												<ul>
													<li><a href="#" class="getCategoryBIdx" idx="${categoryB.category_b_idx }"><strong>${categoryB.category_b_desc }&nbsp;&nbsp; 전체</strong></a></li>
												<c:forEach items="${categoryB.categoryML }" var="categoryM">
													<li><a href="#" class="getCategoryMIdx" idx="${categoryM.category_m_idx }">${categoryM.category_m_desc } </a></li>
												</c:forEach>
												</ul>
											</div>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						</div><!--/category-productsr-->
					
						<!-- 
						<div class="brands_products">brands_products
							<h2>Brands</h2>
							<div class="brands-name">
								<ul class="nav nav-pills nav-stacked">
									<li><a href=""> <span class="pull-right">(50)</span>Acne</a></li>
									<li><a href=""> <span class="pull-right">(56)</span>Grüne Erde</a></li>
									<li><a href=""> <span class="pull-right">(27)</span>Albiro</a></li>
									<li><a href=""> <span class="pull-right">(32)</span>Ronhill</a></li>
									<li><a href=""> <span class="pull-right">(5)</span>Oddmolly</a></li>
									<li><a href=""> <span class="pull-right">(9)</span>Boudestijn</a></li>
									<li><a href=""> <span class="pull-right">(4)</span>Rösch creative culture</a></li>
								</ul>
							</div>
						</div>/brands_products
						 -->
						
						<div class="price-range"><!--price-range-->
							<h2>Price Range</h2>
							<div class="well">
								 <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
								 <b>$ 0</b> <b class="pull-right">$ 600</b>
							</div>
						</div><!--/price-range-->
						
						<!-- 
						<div class="shipping text-center">shipping
							<img src="images/home/shipping.jpg" alt="" />
						</div>/shipping
						 -->
						
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Features Items</h2>
						<div class="row-fluid">
							<select id="orderByValue" name="orderByValue" class="order" style="width:164px;">
				                <option value="goods_regdate" <c:if test="${shopDefaultVO.orderValue eq 'goods_regdate' }">selected="selected"</c:if> >등록일순</option>
								<option value="goods_price" <c:if test="${shopDefaultVO.orderValue eq 'goods_price' }">selected="selected"</c:if> >가격순</option>
			                </select>
							<select id="ascDesc" name="ascDesc" class="order" style="width:164px;">
				                <option value="desc" <c:if test="${shopDefaultVO.ascDesc eq 'desc' }">selected="selected"</c:if> >내림차순</option>
								<option value="asc" <c:if test="${shopDefaultVO.ascDesc eq 'asc' }">selected="selected"</c:if>>오름차순</option>
			                </select>
		                </div>
		                
						<c:forEach var="goods" items="${goodsList }">
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
											<img src="${pageContext.request.contextPath}/upload/upimg/thumb/${goods.goods_thumb }" alt="" />
											<h2>${goods.goods_price } 원</h2>
											<h3>${goods.goods_name }</h3>
											<p>${goods.goods_desc }</p>
											<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<div class="product-overlay">
											<div class="overlay-content">
												<!-- <h1>상세보기</h1> -->
												<h2>${goods.goods_price } 원</h2>
												<p>${goods.goods_name }</p>
												<a href="/details.do?goods_idx=${goods.goods_idx }" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>상세보기</a>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
										</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
									</ul>
								</div>
							</div>
						</div>
						</c:forEach>
						
						<!-- <ul class="pagination">
							<li class="active"><a href="">1</a></li>
							<li><a href="">2</a></li>
							<li><a href="">3</a></li>
							<li><a href="">&raquo;</a></li>
						</ul> -->
						
			        	
					</div><!--features_items-->
						<!-- /List -->
			        	<div id="paging">
			        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage" />
			        		<%-- <form:hidden path="pageIndex" /> --%>
			        	</div>
				</div>
			</div>
		</div>
	</section>
	
	<%@include file="footer.jsp" %>
	

  
    <script src="js/jquery.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.validate.js"></script>
	<script src="js/messages_ko.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
    <script>
    // 페이지이동시 정렬기준, 카테고리 값 전달을 위한 전역변수
    var globalOrderVal = $("#orderByValue").val();
    var globalAscDesc = $("#ascDesc").val();
    
    // 페이지이동 함수
    function linkPage(pageIndex){
		location.href = "/shop.do?pageIndex="+pageIndex+"&orderValue="+globalOrderVal+"&ascDesc="+globalAscDesc
				+"&category_b_idx="+${shopDefaultVO.b_idx}+"&category_m_idx="+${shopDefaultVO.m_idx};
	}
    
    // 정렬기준 이벤트처리기
   $(".order").on("change", function(){
    	var orderValue = $("#orderByValue").val();
    	var ascDesc = $("#ascDesc").val();
    	location.href = "/shop.do?orderValue="+orderValue+"&ascDesc="+ascDesc
    	+"&category_b_idx="+${shopDefaultVO.b_idx}+"&category_m_idx="+${shopDefaultVO.m_idx};
    });
    
    // 대분류 카테고리 이벤트처리기
    $(".getCategoryBIdx").on("click", function(){
    	var categoryBIdx = $(this).attr("idx");
    	//alert(categoryBIdx);
    	location.href = "/shop.do?category_b_idx="+categoryBIdx;
    });
    
 	// 중분류 카테고리 이벤트처리기
    $(".getCategoryMIdx").on("click", function(){
    	var categoryMIdx = $(this).attr("idx");
    	location.href = "/shop.do?category_m_idx="+categoryMIdx;
    });
    
    </script>
</body>
</html>