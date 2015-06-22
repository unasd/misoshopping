<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/WEB-INF/jsp/eshopper/head.jsp" %>
</head><!--/head-->
<body>
<section>
	<div class="container">
		<div class="row">
			<div class="btn-group" align="center">
	            <label class="btn btn-default">
	                <input type="radio" id="cateB" name="category" value="1" checked="checked" /> 대분류
	            </label> 
	            <label class="btn btn-default">
	                <input type="radio" id="cateM" name="category" value="2" /> 중분류
	            </label> 
	        </div>
	        <div>
	        	<select id="upper_category" name="upper_category" class="form-control" style="width:164px;display: none;">
				</select>
	        	<label for="category_name" class="col-sm-2 control-label"></label>
	        	<input type="text" id="category_name" class="category_name form-control" placeholder="분류명" style="width:164px;"/>
	        	<label for="category_desc" class="col-sm-2 control-label"></label>
	        	<input type="text" id="category_name" class="category_desc form-control" placeholder="분류설명" style="width:164px;"/>
				<label for="add_category" class="col-sm-2 control-label"></label>
				<button class="btn-primary btn" id="add_category">추가</button>
	        </div>
		</div>
	</div>
</section>
	
	
<script src="js/jquery.js"></script>
<script src="js/price-range.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/messages_ko.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>
<script>
$("input[name=category]").on("change", function(){
	if($(this).val()==1){
		$("#upper_category").attr("style", "width:164px;display: none;");
	} else {
		$("#upper_category").show();
		categoryBList();
	}
});

$("#add_category").on("click", function(){
	var category_name = $(this).siblings('.category_name').val();
	var category_desc = $(this).siblings('.category_desc').val();
	var upper_category_idx = 0;
	if($('#upper_category').val() != null){
		upper_category_idx = $('#upper_category').val();
	}
	console.log("category_name : "+category_name+" / category_desc : "+category_desc+" / upper_category_idx : "+upper_category_idx)
	$.ajax({
		type: "POST"
		, url: "/api/category_add.do"
		, data: "category_name="+category_name+"&category_desc="+category_desc+"&upper_category_idx="+upper_category_idx
		, success: function(data){
			console.log("카테고리추가성공, category_idx : "+data);
			alert("항목이 추가되었습니다.");
			opener.window.location.reload();
			window.close();
		}
		, error: function(xhr, status, error){
			alert("error : "+xhr.status);
			window.close();
		}
	});
	
	//opener.location.href="/categoryList.do";
});

function categoryBList(){
	$.ajax({
		type: "POST"
		, url: "/api/selBoxCateList.do"
		, success: function(data){
			$("#upper_category").children().remove();
			$("<option value='x'>상위분류</option>"+data).appendTo($("#upper_category"));
		}
		, error: function(xhr, error, status){
			alert(xhr.status);
		}
	});
}; 
</script>
</body>