<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/head.jsp" %>
<!-- Custom styles for this template -->
<link href="css/dashboard.css" rel="stylesheet">
<!-- <script src="js/jquery.validate.js"></script>
<script src="js/messages_ko.js"></script> -->
</head>
<body>
<%@include file="/navbar.jsp" %>
<!-- Page Content -->

     <div class="container-fluid">
      <div class="row">
      
		<!-- Side bar -->
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="/categoryBList.do">상품추가 <span class="sr-only">(current)</span></a></li>
            <li><a href="#">Reports</a></li>
            <li><a href="#">Analytics</a></li>
            <li><a href="#">Export</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item</a></li>
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
            <li><a href="">More navigation</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
          </ul>
        </div>
        <!-- /Side bar -->
        
	        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	          <h1 class="page-header">상품추가</h1>
	       	 <!-- Input form -->
	       	 
	          <form action="/goods_insert.do" method="post" id="goods_form" enctype="multipart/form-data">
				<div class="form-horizontal">
				    <div class="form-group">
				        <label for="category" class="col-sm-2 control-label">분류선택: </label>
				        <div class="col-sm-9">
				            <div class="row">
				                <div class="col-sm-2">
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
				                </div>
				                <div class="col-sm-2">
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
				                </div>
				            </div>
				        </div>
				    </div>
				    <div class="form-group">
				        <label for="goods_name" class="col-sm-2 control-label">상품명: </label>
				        <div class="col-sm-3">
				            <input type="text" class="form-control" id="goods_name" name="goods_name" placeholder="상품명">
				        </div>
				    </div>
				    <div class="form-group">
				    	<label for="goods_desc" class="col-sm-2 control-label">상품설명: </label>
				    	<div class="col-sm-3">
				    		<textarea id="goods_desc" name="goods_desc" rows="20" cols="100" class="form-control" placeholder="상품설명"></textarea>
				    	</div>
				    </div>
				    <div class="form-group">
				        <label for="goods_price" class="col-sm-2 control-label">판매가: </label>
				        <div class="col-sm-3">
				            <input type="text" id="goods_price" name="goods_price" class="form-control" placeholder="판매가">
				        </div>
				    </div>
				    <div class="form-group">
				        <label for="goods_img" class="col-sm-2 control-label">상품이미지: </label>
				        <div class="col-sm-3">
				            <input type="file" id="goods_file" name="goods_file" class="form-control" style="height: 40px"/>
				        </div>
				    </div>
				    <div class="form-group">
				        <label for="goods_img" class="col-sm-4 control-label"></label>
				        <div class="col-sm-3">
				            <button type="submit" class="btn-primary btn" id="add_submit">추가</button>
				        </div>
				    </div>
				    </form>
				    <img src="" id="target" style="display: none; width: 400px;"/>
				</div>
             </div>
          </div>
        </div>
      </div>
    </div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
<!-- <script src="../../dist/js/bootstrap.min.js"></script> -->
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<!-- <script src="../../assets/js/vendor/holder.js"></script> -->
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<!-- <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script> -->
<!-- /.container -->

<div class="container">
<hr>
<%@include file="/footer.jsp" %>
</div>
<!-- /.container -->
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
			,success: categoryAdded
		})
	});
	
	function categoryAdded(){
		alert("분류항목이 추가되었습니다.");
		location.reload(true);
	}
	
	// 상품추가 submit
	/* $("#add_submit").on("click", function(){
		//alert('submit');
		$("#goods_form").submit();
		//return false;
	}); */
	
$(document).ready(function($){
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
			goods_img:{
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
	$("#goods_file").on("change", function(){
		var imgSrc = $(this).val();
		$("#target").attr("src", imgSrc);
		$("#target").show();
	});
	
	var message = '${success}'; 
	if(message == 'y'){
 		alert('입력완료'); 
	} else if (message == 'n'){
		alert('입력오류');
	}
	/* if(returnUrl != ''){
		document.location.href = returnUrl; 
	} */
});
</script>
<!-- jQuery -->
<!-- <script src="js/jquery.js"></script> -->
<!-- Bootstrap Core JavaScript -->
<!-- <script src="js/bootstrap.min.js"></script> -->
</body>
</html>