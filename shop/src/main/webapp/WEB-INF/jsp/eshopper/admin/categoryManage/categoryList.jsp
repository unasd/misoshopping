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
			<div align="right">
				<select id="categoryB" name="categoryB" class="category" style="width:149px;">
					<%-- <option value="goods_regdate" <c:if test="${shopDefaultVO.orderValue eq 'goods_regdate' }">selected="selected"</c:if> >등록일순</option> --%>
					<%-- <c:forEach items="${categoryVOs }" var="category">
						<c:if test="${category.upper_category_name != null }">
							<option value="${category.category_idx }">${category.category_name }</option>
						</c:if>
					</c:forEach> --%>
				</select>
			</div>
			<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<th style="width: 10px">No</th>
						<th style="width: 150px">대분류</th>
						<th style="width: 150px">중분류</th>
						<th style="width: 150px">등록일</th>
						<th style="width: 100px">등록자</th>
						<th>삭제일</th>
						<th>편집</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${categoryVOs}" var="category" varStatus="i">
					<tr>
						<td>${i.index+1}</td>					
						<td>${category.category_name }</td>					
						<td>${category.upper_category_name }</td>					
						<td>${category.category_regdate }</td>					
						<td>${category.category_register }</td>					
						<td>${category.category_deldate }</td>				
						<td><a href="#" class="cateUpdate" idx="${category.category_idx }">수정</a> 
						/ <a href="#" class="cateDelete" idx="${category.category_idx }">삭제</a></td>				
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<div align="right">
				<button class="btn-primary btn" id="add_category">새로등록</button>
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

// 대분류 항목 로딩
function categoryBList(){
	$.ajax({
		type: "POST"
		, url: "/api/selBoxCateList.do"
		, success: function(data){
			$("#categoryB").children().remove();
			$("<option value=''>분류선택</option>"+"<option value=''>===========</option>"+data
					+"<option value=''>===========</option>"+"<option value='x'>대분류만</option>"
					+"<option value='all'>전체</option>").appendTo($("#categoryB"));
		}
		, error: function(xhr, error, status){
			alert(xhr.status);
		}
	});
};

var categoryBVal;
// 대분류 셀렉트박스 선택 이벤트
$("#categoryB").on("change", function(){
	categoryBVal = $(this).val();
	if(categoryBVal == 'x'){
		location.href="/categoryList.do?b_idx=-1";
	} else if(categoryBVal == 'all'){
		location.href="/categoryList.do";
	} else {
		location.href="/categoryList.do?b_idx="+categoryBVal;
	}
});

// 새로등록버튼 이벤트
$("#add_category").on("click", function(){
	popup();
});

// 새로등록 팝업
function popup(){ 
    var objectName = new Object(); // object 선언
    //objectName.message = "이건 테스트"; // popup에 넘겨줄 값
    var site = "/categoryWrite.do"; 
    //var style ="dialogWidth:100px;dialogHeight:200px"; // model 스타일
    //window.showModalDialog(site, objectName, style);// modal 실행 window.showModalDialog 포인트
    window.open(site, "", "width=200, height=250");  // popUp실행
}

$(".cateUpdate").on("click", function(){
	var cateIdx = $(this).attr("idx");
	location.href="/categoryUpdate.do?category_idx="+cateIdx;
});

$(".cateDelete").on("click", function(){
	var result;
	var cateIdx = $(this).attr("idx");
	
	if($(this).parent().siblings("td").eq(2).text() == '-'){
		result = confirm($(this).parent().siblings("td").eq(1).text()+" 분류를 삭제하시겠습니까? \n하위분류도 함께 삭제됩니다.");
	} else {
		result = confirm($(this).parent().siblings("td").eq(2).text()+" 분류를 삭제하시겠습니까?");
	}
	
	if(result){
		location.href="/categoryDelete.do?category_idx="+cateIdx+"&b_idx=0";
	} else {
		return false;
	}
});

/* var cateDelResult  = ${cateDelResult};
if(cateUpdateResult != 0){
	alert('삭제완료');
	location.reload();
} */

</script>
</body>