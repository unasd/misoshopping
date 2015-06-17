<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@include file="/WEB-INF/jsp/eshopper/head.jsp" %>
	<style type="text/css">
	.ml10 {
	    margin-left: 10px;
	}
	
	</style>
</head><!--/head-->
<body>
	<%@include file="/WEB-INF/jsp/eshopper/header.jsp" %>
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-10">
					<table data-toggle="table"
					       data-url="/stockListJson.do"
					       data-query-params="queryParams"
					       data-pagination="true"
					       data-search="true"
					       data-height="500"
					       data-click-to-select="true"
		    			   data-single-select="true">
					    <thead>
					    <tr>
					   		<!-- <th data-field="state" data-checkbox="true"></th> -->
					        <th data-field="category_b_name" data-sortable="true">대분류</th>
					        <th data-field="goods_idx" data-sortable="true">상품번호</th>
					        <th data-field="goods_name" data-sortable="true">상품명</th>
					        <th data-field="stock_color">색상</th>
					        <th data-field="stock_size">사이즈</th>
					        <th data-field="stock_amount">수량</th>
					        <th data-field="action" data-formatter="actionFormatter" data-events="actionEvents">재고관리</th>
					    </tr>
					    </thead>
					</table>
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
    <!-- Latest compiled and minified JavaScript -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.8.1/bootstrap-table.min.js"></script>
	<!-- Latest compiled and minified Locales -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.8.1/locale/bootstrap-table-zh-KO.min.js"></script>
	
	<script>
	function queryParams() {
	    return {
	        type: 'owner',
	        sort: 'updated',
	        direction: 'desc',
	        per_page: 100,
	        page: 1
	    };
	};
	
	function actionFormatter(value, row, index) {
	    return [
	        /* '<a class="like" href="javascript:void(0)" title="Like">',
	        '<i class="glyphicon glyphicon-heart"></i>',
	        '</a>', */
	        '<a class="edit ml10" href="javascript:void(0)" title="Edit">',
	        '<i class="glyphicon glyphicon-edit"></i>',
	        '</a>',
	        '<a class="remove ml10" href="javascript:void(0)" title="Remove">',
	        '<i class="glyphicon glyphicon-remove"></i>',
	        '</a>'
	    ].join('');
	}

	window.actionEvents = {
	    /* 'click .like': function (e, value, row, index) {
	        alert('You click like icon, row: ' + JSON.stringify(row));
	        console.log(value, row, index);
	    }, */
	    'click .edit': function (e, value, row, index) {
	        alert('You click edit icon, row: ' + JSON.stringify(row));
	        console.log(value, row, index);
	    },
	    'click .remove': function (e, value, row, index) {
	        alert('You click remove icon, row: ' + JSON.stringify(row));
	        console.log(value, row, index);
	    }
	};
	
	//alert($("tbody").children().length);
	
	//$(".table-hover").children("tr").index();
	
	</script>
</body>
</html>