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
						<th>${shopDefaultVO.b_idx }</th>
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
						<td><a href="">편집</a></td>				
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

//var categoryBString;
// 대분류 항목 로딩
function categoryBList(){
	$.ajax({
		type: "POST"
		, url: "/api/selBoxCateList.do"
		, success: function(data){
			$("#categoryB").children().remove();
			$("<option value='x'>대분류</option>"+data+"<option value='all'>전체</option>").appendTo($("#categoryB"));
			//categoryBString = data;
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
		//location.href="/categoryList.do?b_idx=121212";
	} else if(categoryBVal == 'all'){
		location.href="/categoryList.do";
	} else {
		location.href="/categoryList.do?b_idx="+categoryBVal;
	}
});

// 새로등록버튼 이벤트
$("#add_category").on("click", function(){
	//window.open("/categoryWrite.do");
	modalPopup();
});

function modalPopup(){ 
    var objectName = new Object(); // object 선언 modal의 이름이 된다. 
    //objectName.message = "이건 테스트"; // modal에 넘겨줄 값을 선언할 수 있다. 
    var site = "/categoryWrite.do"; 
    var style ="dialogWidth:100px;dialogHeight:200px"; // 사이즈등 style을 선언 
    window.showModalDialog(site, objectName ,style ); // modal 실행 window.showModalDialog 포인트!! 
    // modal 에 넘겨줬던 값을 다시 부모창에 받아 들임     
    //document.getElementById("test1").value = objectName.message; 
}
</script>
</body>