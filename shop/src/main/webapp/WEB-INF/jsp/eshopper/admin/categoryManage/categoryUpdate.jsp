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
		<div class="row-fluid">
			<form id="cateUpdate_form" action='/categoryUpdate.do' method="post" style="border: thin;">
				<div class="col-sm-6 padding-right">
					<div class="col-sm-12 form-group">
							<input type="hidden" name="category_idx" class="form-control" value="${categoryUpdate1.category_idx }"/>
						<div class="form-group">
					        <label for="category_name" class="col-sm-6 control-label">카테고리명 </label>
					        <input type="text" class="form-control" id="category_name" name="category_name" value="${categoryUpdate1.category_name }" style="width:164px;">
					    </div>
						<div class="form-group">
					        <label for="category_desc" class="col-sm-6 control-label"> 카테고리 설명 </label>
					        <input type="text" class="form-control" id="category_desc" name="category_desc" value="${categoryUpdate1.category_desc }" style="width:164px;">
					    </div>
						<div class="form-group">
					        <label for="category_regdate" class="col-sm-6 control-label"> 카테고리 등록일 / 등록자 </label>
					        <p>${categoryUpdate1.category_regdate } / ${categoryUpdate1.category_register }</p>
					    </div>
						<div class="form-group">
					        <label for="category_update" class="col-sm-6 control-label"> 카테고리 수정일 / 수정자 </label>
					        <p>${categoryUpdate1.category_update } / ${categoryUpdate1.category_updater }</p>
					    </div>
						<div class="form-group">
					        <label for="category_deldate" class="col-sm-6 control-label"> 카테고리 삭제일 / 삭제자 </label>
					        <p>${categoryUpdate1.category_deldate } / ${categoryUpdate1.category_deleter }</p>
					    </div>
					    <div class="form-group">
						    <label for="upper_category" class="col-sm-6 control-label">상위분류</label>
						    <select id="upper_category" name="upper_category_idx" class="form-control" style="width:164px;">
							</select>
						</div>
						<div class="form-group">
							<label for="add_category" class="col-sm-6 control-label"></label>
							<button type="submit" class="btn-info btn" id="update_category">수정완료</button>
							<button type="button" class="btn-danger btn" id="cancel">&nbsp;&nbsp;&nbsp;&nbsp;취소&nbsp;&nbsp;&nbsp;&nbsp;</button>
						</div>
					</div>
				</div>
			</form>
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
categoryBList();
// 상위분류 셀렉트박스 로딩
function categoryBList(){
	$.ajax({
		type: "POST"
		, url: "/api/selBoxCateList.do"
		, success: function(data){
			$("#upper_category").children().remove();
			$("<option value='x'>상위분류</option>"+data+"<option value='0'>없음 or 상위분류로</option>").appendTo($("#upper_category"));
		}
		, error: function(xhr, error, status){
			alert(xhr.status);
		}
	});
}; 

// text필드 클릭시 이전값 지우기
$(".form-group").children("input:text").on("click", function(){
	$(this).val("");
});

// 유효성 검사
var validator = $("#cateUpdate_form").validate({
	rules: {
		category_name: {
			required: true
		},
		category_desc: {
			required: true
		},
		upper_category_idx: {
			required: true,
			valueNotEquals: 'x'
		}
	}	
});

// 상위분류 필수선택 메서드
$.validator.addMethod("valueNotEquals", function(value, element, arg){
	  return arg != value;
}, "필수항목 입니다.");

// 취소버튼
$("#cancel").on("click", function(){
	location.href="/categoryList.do";
});

// 업데이트 완료시 alert 후 리스트로
var cateUpdateResult = ${cateUpdateResult};
if(cateUpdateResult != 0){
		alert('수정완료');
		location.href="/categoryList.do?b_idx="+${shopDefaultVO.b_idx};
}
</script>
