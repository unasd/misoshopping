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
			                    </select>
			                    <div id="categoryB_add" class="category_add" style="display: none;">
			                    	<label for="category_name" class="col-sm-2 control-label"></label>
									<input type="text" id="category_name" class="category_name form-control" placeholder="대분류명" style="width:164px;"/>
									<label for="category_desc" class="col-sm-2 control-label"></label>
									<input type="text" id="category_desc" class="category_desc form-control" placeholder="대분류 설명" style="width:164px;"/>
									<label for="category_add_btn" class="col-sm-2 control-label"></label>
									<button id="category_add_btn" class="btn category_add" btid="b">추가</button>
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
			                    	<label for="upper_category" class="col-sm-2 control-label">상위분류</label>
									<select id="upper_category" name="upper_category" class="form-control" style="width:164px;">
									</select>
									<label for="categoryM_name" class="col-sm-2 control-label"></label>
									<input type="text" id="categoryM_name" class="category_name form-control" placeholder="중분류명" style="width:164px;"/>
									<label for="categoryM_desc" class="col-sm-2 control-label"></label>
									<input type="text" id="categoryM_desc" class="category_desc form-control" placeholder="중분류 설명" style="width:164px;"/>
									<label for="category_add_btn" class="col-sm-2 control-label"></label>
									<button id="category_add_btn" class="btn category_add" btid="m">추가</button>
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
						    <hr/>
						    <div class="form-group">
						    	<label for="is_color" class="col-sm-3 control-label">색상옵션 유무</label>
						    	<input type="checkbox" id="is_color" name="is_color" value="y" class="form-control option" style="width: 14px; height: 14px;"><br/>
						    	<div class="addOption" style="display: none;">
						    		<!-- <label for="is_color" class="col-sm-3 control-label">옵션1</label> -->
						    		<input type="text" name="color_option0"  class="form-control" style="width: 100px" placeholder="옵션1"/>
						    		<input type="text" name="color_option1"  class="form-control" style="width: 100px" placeholder="옵션2" />
						    		<input type="text" name="color_option2"  class="form-control" style="width: 100px" placeholder="옵션3" />
						    		<input type="hidden" name="color_option" value="3"/>
						    	</div>
						    	<input type="button" class="addOption btn btn-info addOptionBtn" value="옵션행 추가" style="display: none;"/>
						    	<input type="button" class="addOption btn btn-danger removeOptionBtn" value="옵션행 삭제" style="display: none;"/>
						    </div>
						    <div class="form-group">
						    	<label for="is_size" class="col-sm-3 control-label">사이즈옵션 유무</label>
						    	<input type="checkbox" name="is_size" value="y" class="form-control option" style="width: 14px; height: 14px;"><br/>
						    	<div class="addOption" style="display: none;">
						    		<input type="text" name="size_option0" class="form-control" style="width: 100px" placeholder="옵션1" />
						    		<input type="text" name="size_option1" class="form-control" style="width: 100px" placeholder="옵션2" />
						    		<input type="text" name="size_option2" class="form-control" style="width: 100px" placeholder="옵션3" />
						    		<input type="hidden" name="size_option" value="3"/>
						    	</div>
						    	<input type="button" class="addOption btn btn-info addOptionBtn" value="옵션행 추가" style="display: none;"/>
						    	<input type="button" class="addOption btn btn-danger removeOptionBtn" value="옵션행 삭제" style="display: none;"/>
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
	$(document).ready(function(){
		categoryBList();
	});
	
	
	var categoryBString;
	// 대분류 항목 로딩
	function categoryBList(){
		$.ajax({
			type: "POST"
			, url: "/api/categoryList.do"
			, success: function(data){
				//$("#categoryB_add").attr("style", "display:none");
				$("#categoryB").children().remove();
				$("<option value='x'>대분류</option>"+data+"<option value='categoryB_add'>+항목추가</option>").appendTo($("#categoryB"));
				categoryBString = data;
			}
			, error: function(xhr, error, status){
				alert(xhr.status);
			}
		});
	}; 
	
	// 대분류 셀렉트박스 선택 이벤트
	$("#categoryB").on("change", function(){
		var categoryB = $(this).val();
		if(categoryB=='categoryB_add'){
			$("#categoryB_add").show();
		} else if(categoryB == 'x'){
			$("#categoryB_add").attr("style", "display:none");
		} else {
			$("#categoryB_add").attr("style", "display:none");
			cateGoryMLoad(categoryB);
		}
	});
	
	// 중분류 셀렉트박스 선택 이벤트
	$("#categoryM").on("change", function(){
		var categoryM = $(this).val();
		if(categoryM=='categoryM_add'){
			$("#categoryM_add").show();
			$("#upper_category").children().remove();
			$("<option value=''>상위분류 선택</option>"+categoryBString).appendTo($("#upper_category"));
		} else {
			$("#categoryM_add").attr("style", "display:none");
		}
	});
	
	// 중분류항목 로딩
	function cateGoryMLoad(cateGoryBVal){
		$.ajax({
			type: "POST"
			, url: "/api/categoryList.do"
			, data: "upper_category_idx="+cateGoryBVal
			, success: function(data){
				$("#categoryM").children().remove();
				$("<option value='x'>중분류</option>"+data+"<option value='categoryM_add'>+항목추가</option>").appendTo($("#categoryM"));
			}
			,  error: function(xhr, error, status){
				alert("error "+xhr.status);
			}
		})
	};
	
	
	// 분류항목 추가 이벤트
	$("button.category_add").on("click", function(){
		var $button = $(this);
		var category_name = $button.siblings('.category_name').val();
		var category_desc = $button.siblings('.category_desc').val();
		var upper_category_idx = 0;
		if($('#upper_category').val() != null){
			upper_category_idx = $('#upper_category').val();
		}
		$.ajax({
			type: "POST"
			, url: "/api/category_add.do"
			, data: "category_name="+category_name+"&category_desc="+category_desc+"&upper_category_idx="+upper_category_idx
			, success: function(data){
				alert(data+"항목이 추가되었습니다.");
				categoryBList();
				$button.parent().attr("style", "display:none");
				$("#categoryM").children().eq(0).attr("selected", "selected");
			}
			, error: function(xhr, status, error){
				alert("error : "+xhr.status);
				location.href="/goodsInfo.do";
			}
		})
	});
	
	// 폼 유효성 검사
	var validator = $("#goods_form").validate({
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
	
	/* $("#goods_form").on("submit", function(){
		var length = $("[name^='color_options']").length;
		for(var i=0; i<length; i++){
			$("[name='color_options"+i+"']").rules("add", {
				required: "#is_color:checked"
		    });
		}
	}); */
	
		/* var length = $("[name$='_options']").length;
		alert(length);
		for(var i=0; i<length; i++){
			$("[name$='_options"+i+"']").rules("add", {
				required: "#is_color:checked"
		    });
		} */
	
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
	
	// 첨부이미지 확인
	/* $("#goods_file").on("change", function(){
		var imgSrc = $(this).val();
		$("#target").attr("src", imgSrc);
		$("#target").show();
	}); */
	
	var message = '${success}'; 
	if(message == 'y'){
 		alert('입력완료'); 
 		location.href = "/goodsInfo.do";
	} else if (message == 'n'){
		alert('입력오류');
 		location.href = "/goodsInfo.do";
	}
	
	// 옵션추가 체크박스
	$(".option").on("click", function(){
		
		if($(this).prop("checked")){
			$(this).parent().children(".addOption").show();
			
			/* var optionName = $(this).attr("name");
			var hidden = $(this).siblings("div").children("input:hidden").attr("name");
			alert(optionName+"/"+hidden);
			
			for(var i=0; i<3; i++){
				$("[name='"+hidden+i+"']").rules("add", {
					required: "#"+optionName+":checked"
			    });
			} */
		} else {
			$(this).parent().children(".addOption").attr("style", "display:none;");
			/* var optionName = $(this).attr("name");
			var hidden = $(this).siblings("div").children("input:hidden").attr("name");
			
			for(var i=0; i<3; i++){
				$("[name='"+hidden+i+"']").rules("remove", {
					required: "#"+optionName+":checked"
			    });
			} */
		}

		
	});
	
	// 옵션행추가 이벤트
	$(".addOptionBtn").on("click", function(){
		var $copiedRow = $(this).siblings("div").children("input:text:last").clone(true);   // 마지막 옵션 복사
		var $hidden = $(this).siblings("div").children("input:hidden");						// 옵션의 개수를 넘길 hidden input
		var lastIndex = $(this).siblings("div").children("input:text").length;				// 추가 전 옵션 개수 
		
		$copiedRow.attr("placeholder", "옵션"+(lastIndex+1));							// 
		$copiedRow.attr("name", $hidden.attr("name")+lastIndex);
		$copiedRow.val('');
		$(this).siblings("div").append($copiedRow);
		$hidden.val($(this).siblings("div").children("input:text").length);
		
		var is_option = $(this).siblings("input:checkbox").attr("name");
		var optionName = $(this).siblings("div").children("input:text:last").attr("name");
		$("[name='"+optionName+"']").rules("add", {required: "#"+is_option+":checked"});		// 새로운 옵션행에 유효성검증
	}); // 옵션행추가 끝
	
	
	// 옵션행삭제 이벤트
	$(".removeOptionBtn").on("click", function(){
		var lastIndex = $(this).siblings("div").children("input:text").length;
		if(lastIndex>2){
			$(this).siblings("div").children("input:text:last").remove();		// 마지막 옵션 삭제
			$(this).siblings("div").children("label:last").remove();			// 유효성 에러라벨 삭제
			var $hidden = $(this).siblings("div").children("input:hidden");			// 옵션의 개수를 넘길 hidden input
			
			$hidden.val($(this).siblings("div").children("input:text").length); // 삭제 후 옵션 개수를 입력
			
			var is_option = $(this).siblings("input:checkbox").attr("name");
			var optionName = $(this).siblings("div").children("input:text:last").attr("name");
			//$("[name='"+optionName+"']").rules("remove", {required: "#"+is_option+":checked"});
			$("[name='"+optionName+"']").rules("remove", {required: "#is_color:checked"});
			
		} else {
			alert("더 이상 삭제할 수 없습니다.");
		}
	}); // 옵션행삭제 끝
	</script>
</body>
</html>