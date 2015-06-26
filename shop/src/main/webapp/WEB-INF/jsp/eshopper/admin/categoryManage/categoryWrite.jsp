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
			<form id="add_category_form" action="#">
				<div class="btn-group" align="center">
		            <label class="btn btn-default">
		                <input type="radio" id="cateB" name="category" value="1" checked="checked" /> 대분류
		            </label> 
		            <label class="btn btn-default">
		                <input type="radio" id="cateM" name="category" value="2" /> 중분류
		            </label> 
		        </div>
		        <div>
		        	<!-- <select id="upper_category_idx" name="upper_category_idx" class="form-control" style="width:164px;display: none;">
					</select> -->
		        	<label id="category_name_label" for="category_name" class="col-sm-2 control-label"></label>
		        	<input type="text" id="category_name" name="category_name" class="category_name form-control" placeholder="분류명" style="width:164px;"/>
		        	<label for="category_desc" class="col-sm-2 control-label"></label>
		        	<button type="" class="btn-primary btn" id="cate_name_check">중복검사</button>
		        	<input type="text" id="category_desc" name="category_desc" class="category_desc form-control" placeholder="분류설명" style="width:164px;"/>
					<label for="add_category" class="col-sm-2 control-label"></label>
					<button type="submit" class="btn-primary btn" id="add_category">추가</button>
		        </div>
	        </form>
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
		//$("#upper_category_idx").rules("remove", "valueNotEquals: 'x'");
		//$("#upper_category_idx").attr("style", "width:164px;display: none;");
		$("#upper_category_idx").remove();
	} else {
		$("#upper_category_idx").remove();
		$('<select id="upper_category_idx" name="upper_category_idx" class="form-control" style="width:164px;"></select>')
		.prependTo($("#category_name_label"));
		categoryBList();
	}
});

/* $("#add_category").on("click", function(){
	//validator.validate();
	var category_name = $(this).siblings('.category_name').val();
	var category_desc = $(this).siblings('.category_desc').val();
	var upper_category_idx = 0;
	if($('#upper_category_idx').val() != null){
		upper_category_idx = $('#upper_category_idx').val();
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
}); */

function categoryBList(){
	$.ajax({
		type: "POST"
		, url: "/api/selBoxCateList.do"
		, success: function(data){
			$("#upper_category_idx").children().remove();
			$("<option value='x'>상위분류</option>"+data).appendTo($("#upper_category_idx"));
		}
		, error: function(xhr, error, status){
			alert(xhr.status);
		}
	});
}; 

var validator = $("#add_category_form").validate({
	rules: {
		category_name: {
			required: true,
			rangelength: [1, 20]
		},
		category_desc: {
			required: true,
			maxlength: 20
		},
		upper_category_idx: {
			required: function(element){
				return $("#cateM:checked")
			},
			valueNotEquals: 'x'
		}
	},
	submitHandler:function(form){
		$.ajax({
			type: "POST"
			, url: "/api/category_add.do"
			, data: $(form).serialize()
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
	}
});

//상위분류 필수선택 메서드
$.validator.addMethod("valueNotEquals", function(value, element, arg){
	  return arg != value;
}, "상위분류를 선택하세요.");

$("#cate_name_check").on("click", function(){
	
});
</script>
</body>