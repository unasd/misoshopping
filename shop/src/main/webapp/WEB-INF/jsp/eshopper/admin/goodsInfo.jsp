<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@include file="/WEB-INF/jsp/eshopper/head.jsp" %>
</head><!--/head-->
<body>
	<%@include file="/WEB-INF/jsp/eshopper/header.jsp" %>
		<section>
		<div class="container">
			<div class="row">
				<%-- <div class="col-sm-6">
					<div class="left-sidebar">
						<h2>Category</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">${categoryB.category_b_desc }</a></h4>
								</div>
							</div>
						</div><!--/category-productsr-->
					</div>
				</div> --%>
				<form action="/goods_insert.do" method="post" id="goods_form" enctype="multipart/form-data">
				<div class="col-sm-6 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">상품정보 입력</h2>
						<div class="col-sm-12 form-group">
							<!-- <div class="col-sm-2"> -->
								<label for="categoryB" class="col-sm-2 control-label">분류선택 </label>
								<select id="categoryB" name="category_b_idx" class="form-control" style="width:164px;">
			                        <option value="x">대분류</option>
									<c:forEach items="${categoryBList }" var="cbl">
										<option value="${cbl.category_b_idx }">${cbl.category_b_name }</option>
									</c:forEach>
									<option value="categoryB_add">+항목추가</option>
			                    </select>
			                    <div id="categoryB_add" class="category_add" style="display: none;">
									<input type="text" id="categoryB_name" class="category_name form-control" placeholder="대분류명"/>
									<input type="text" id="categoryB_desc" class="category_desc form-control" placeholder="대분류 설명"/>
									<button class="btn category_add" btid="b">추가</button>
								</div>
								<br/>
							<!-- </div> -->
							
							<!-- <div class="col-sm-2"> -->
								<label for="categoryM" class="col-sm-2 control-label">분류선택 </label>
								<select id="categoryM" name="category_m_idx" class="form-control" style="width:164px;">
			                        <option value="x">중분류</option>
			                        <option value="categoryM_add">+항목추가</option>
			                    </select>
			                    <div id="categoryM_add" class="category_add" style="display: none;">
									<select id="categoryB2" name="categoryB2" class="form-control">
										<option value="">상위분류 선택</option>
										<c:forEach items="${categoryBList }" var="cbl">
											<option value="${cbl.category_b_idx }">${cbl.category_b_name }</option>
										</c:forEach>
									</select>
									<input type="text" id="categoryM_name" class="category_name form-control" placeholder="중분류명"/>
									<input type="text" id="categoryM_desc" class="category_desc form-control" placeholder="중분류 설명"/>
									<button class="btn category_add" btid="m">추가</button>
								</div>
							<!-- </div> -->
							
							<div class="form-group">
						        <label for="goods_name" class="col-sm-2 control-label">상품명 </label>
						        <!-- <div class="col-sm-3"> -->
						            <input type="text" class="form-control" id="goods_name" name="goods_name" placeholder="상품명">
						        <!-- </div> -->
						    </div>
						    <div class="form-group">
						    	<label for="goods_desc" class="col-sm-2 control-label">상품설명 </label>
						    	<!-- <div class="col-sm-3"> -->
						    		<textarea id="goods_desc" name="goods_desc" rows="20" cols="100" class="form-control" placeholder="상품설명"></textarea>
						    	<!-- </div> -->
						    </div>
						    <div class="form-group">
						        <label for="goods_price" class="col-sm-2 control-label">판매가 </label>
						        <!-- <div class="col-sm-3"> -->
						            <input type="text" id="goods_price" name="goods_price" class="form-control" placeholder="판매가">
						        <!-- </div>  -->
						    </div>
						    <div class="form-group">
						        <label for="goods_file" class="col-sm-3 control-label">상품이미지 </label>
						       <!--  <div class="col-sm-3"> -->
						            <input type="file" id="goods_file" name="goods_file" class="form-control" style="height: 40px"/>
						        <!-- </div>  -->
						    </div>
						    <div class="form-group">
						        <label for="goods_img" class="col-sm-4 control-label"></label>
						        <!-- <div class="col-sm-3"> -->
						            <button type="submit" class="btn-primary btn" id="add_submit">추가</button>
						        <!-- </div> -->
						    </div>
							
							<!-- <div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
										
											<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>입력</a>
										</div>
								</div>
							</div> -->
						</div>
					</div><!--features_items-->
				</div>
				</form>
				
				
				<div class="col-sm-6 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Features Items</h2>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
											<a href="#" class="btn btn-default add-to-cart"><!-- <i class="fa fa-shopping-cart"></i> -->Add to cart</a>
										</div>
								</div>
							</div>
						</div>
					</div><!--features_items-->
				</div>
			</div>
		</div>
	</section>
	<%@include file="/WEB-INF/jsp/eshopper/footer.jsp" %>
	

    <script src="js/jquery.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.validate.js"></script>
	<script src="js/messages_ko.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
	<script>
		$("#categoryB").on("change", function(){
			var categoryB = $(this).val();
			// 대분류 선택시 중분류 로딩
			if(categoryB != '' && categoryB!='categoryB_add'){
				$("#categoryB_add").attr("style", "display:none");
				cateGoryMLoad(categoryB);
				
			// 대분류 항목 추가
			} else if(categoryB=='categoryB_add'){
				$("#categoryB_add").show();
			}
		});
		
		function cateGoryMLoad(cateGoryBVal){
			$.ajax({
				type: "POST",
				url: "/api/categoryMList.do",
				data: "category_b_idx="+cateGoryBVal,
				success: categoryBSelet
			})
		};
		
		// 대분류 선택하여 넘어온 중분류 항목
		function categoryBSelet(msg){
			$("#categoryM").children().remove();
			$(msg).appendTo($("#categoryM"));
		};
		
		// 중분류 항목추가
		$("#categoryM").on("change", function(){
			var categoryM = $(this).val();
			if(categoryM != '' && categoryM=='categoryM_add'){
				$("#categoryM_add").show();
			} else {
				$("#categoryM_add").attr("style", "display:none");
			}
		});
		
		// 카테고리 추가 이벤트
		$("button.category_add").on("click", function(){
			var category_id = $(this).attr("btid");
			var category_name = $(this).siblings('.category_name').val();
			var category_desc = $(this).siblings('.category_desc').val();
			var category_b_idx='';
			if($("#categoryB2").val()!=''){
				var categoryB2 = $("#categoryB2").val();
				category_b_idx='&category_b_idx='+categoryB2;
			}
			$.ajax({
				type: "POST",
				url: "/api/category"+category_id+"_add.do",
				data: "category_"+category_id+"_name="+category_name+"&category_"+category_id+"_desc="+category_desc+category_b_idx
				, success: categoryAdded
				, error: categoryAddErr
			})
		});
		
		function categoryAdded(){
			alert("분류항목이 추가되었습니다.");
			location.href="/goodsInfo.do";
		};
		
		function categoryAddErr(){
			alert("error");
		};
		
	//$(document).ready(function($){
		// 폼 유효성 검사
		$("#goods_form").validate({
			rules:{
				goods_name:{
					required: true
				},
				goods_desc:{
					required: true
				},
				category_b_idx:{
					required: true
					, valueNotEquals: "x"
				},
				category_m_idx:{
					required: true
					, valueNotEquals: "x"
				},
				goods_price:{
					required: true
					, number: true
					//, money: true
				},
				goods_file:{
					required: true
				}
			}
		});
		
		// 분류선택검증 메소드
		$.validator.addMethod("valueNotEquals", function(value, element, arg){
			  return arg != value;
		}, "필수항목 입니다.");
		
		// 가격필드검증 메소드
		/* $.validator.addMethod(
			"money",
			function(value, element) {
			var isValidMoney = /^\d{0,4}(\.\d{0,2})?$/.test(value);
			return this.optional(element) || isValidMoney;
			},"Insert "
		); */
		
		// 
		/* $("#goods_file").on("change", function(){
			var imgSrc = $(this).val();
			$("#target").attr("src", imgSrc);
			$("#target").show();
		}); */
		
		var message = '${success}'; 
		if(message == 'y'){
	 		alert('입력완료'); 
		} else if (message == 'n'){
			alert('입력오류');
		}
	//});
	</script>
</body>