<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@include file="head.jsp" %>
</head><!--/head-->
<body>
	<%@include file="header.jsp" %>
	
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
						<div class="price-range">price-range
							<h2>Price Range</h2>
							<div class="well">
								 <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
								 <b>$ 0</b> <b class="pull-right">$ 600</b>
							</div>
						</div>/price-range
						 -->
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="product-details"><!--product-details-->
						<div class="col-sm-5">
							<div class="view-product">
								<img src="${pageContext.request.contextPath }/upload/upimg/${detailsGVO.goods_img}" alt="" />
								<!-- <h3>ZOOM</h3> -->
							</div>
							

						</div>
						<div class="col-sm-7">
							<div class="product-information"><!--/product-information-->
								<!-- <img src="images/product-details/new.jpg" class="newarrival" alt="" /> -->
								<h2>${detailsGVO.goods_name }</h2>
								<p>Web ID: ${detailsGVO.goods_idx }</p>
								<!-- <img src="images/product-details/rating.png" alt="" /> -->
								<span>
									<span>${detailsGVO.goods_price } 원</span>
									<label>Quantity:</label>
									<input type="text" value="3" />
									<button type="button" class="btn btn-fefault cart">
										<i class="fa fa-shopping-cart"></i>
										Add to cart
									</button>
								</span>
								<p><b>Availability:</b> In Stock</p>
								<!-- <p><b>Condition:</b> New</p>
								<p><b>Brand:</b> E-SHOPPER</p> -->
								<!-- <a href=""><img src="images/product-details/share.png" class="share img-responsive"  alt="" /></a> -->
							</div><!--/product-information-->
						</div>
					</div><!--/product-details-->
					
					<div class="category-tab shop-details-tab"><!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#details" data-toggle="tab">Details</a></li>
								<li class=""><a href="#reviews" data-toggle="tab">Reviews (${fn:length(revQnaList) })</a></li>
								<!-- <li><a href="#qna" data-toggle="tab">Q&A (0)</a></li> -->
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade active in" id="details" >
								<div class="col-sm-12">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="${pageContext.request.contextPath }/upload/upimg/${detailsGVO.goods_img}" alt="" />
												<h2>상세설명</h2>
												<p>${detailsGVO.goods_desc }</p>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="tab-pane fade" id="reviews" >
								<div class="col-sm-12">
									<div id="reviewsDiv">
										<c:forEach items="${revQnaList }" var="revQna">
											<c:if test="${revQna.review_or_qna eq 'r' }">
											<ul>
												<li><a href="#"><i class="fa fa-calendar-o"></i>${revQna.review_qna_subject }</a></li>
												<li><a href="#"><i class="fa fa-user"></i>${revQna.review_qna_writer }</a></li>
												<li><a href="#"><i class="fa fa-clock-o"></i>${revQna.review_qna_regdate }</a></li>
											</ul>
											<p>${revQna.review_qna_content }</p>
											<hr/>
											</c:if>
										</c:forEach>
									</div>
									<p><b>Write Your Review</b></p>
									<label for="review_or_qna"></label>
									<form class="revQnaForm" action="#">
										<input type="hidden" id="review_or_qna" name="review_or_qna" value="r"/>
										<input type="hidden" name="goods_idx" value="${detailsGVO.goods_idx }"/>
										<%-- <input type="hidden" name="member_idx" value="${detailsGVO.member_idx }"/> --%>
										<span>
											<input type="text" name="review_qna_subject" class="input" placeholder="제목" title="제목을 입력하세요."/>
											<input type="text" name="review_qna_writer" class="input" placeholder="작성자" title="작성자명을 입력하세요."/>
										</span>
										<textarea name="review_qna_content" class="input" title="본문을 입력하세요."></textarea><br/>
										<!-- <b>Rating: </b> <img src="images/product-details/rating.png" alt="" /> -->
										<button type="button" class="btn btn-default pull-right revQna">
											Submit
										</button>
									</form>
									<div class="fcontainer">
										<!-- <ul></ul> -->
									</div>
								</div>
							</div>
							
							<%-- <div class="tab-pane fade" id="qna" >
								<div class="col-sm-12">
								 <!-- 
									<ul>
										<li><a href=""><i class="fa fa-user"></i>EUSUM</a></li>
										<li><a href=""><i class="fa fa-clock-o"></i>12:41 PM</a></li>
										<li><a href=""><i class="fa fa-calendar-o"></i>31 DEC 2014</a></li>
									</ul>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
									 -->
									<c:forEach items="${revQnaList }" var="revQna">
										<c:if test="${revQna.review_or_qna eq 'q' }">
										<ul>
											<li><a href=""><i class="fa fa-user"></i>${revQna.review_qna_writer }</a></li>
											<li><a href=""><i class="fa fa-clock-o"></i>${revQna.review_qna_regdate }</a></li>
											<li><a href=""><i class="fa fa-calendar-o"></i>${revQna.review_qna_subject }</a></li>
										</ul>
										<p>${revQna.review_qna_content }</p>
										<hr/>
										</c:if>
									</c:forEach>
									<p><b>Write Your Review</b></p>
									<label for="review_or_qna"></label>
									<form class="revQnaForm" action="#">
										<input type="hidden" name="review_or_qna" value="q"/>
										<input type="hidden" name="goods_idx" value="${detailsGVO.goods_idx }"/>
										<input type="hidden" name="member_idx" value="${detailsGVO.member_idx }"/>
										<span>
											<input type="text" name="review_qna_subject" placeholder="제목" title="제목을 입력하세요."/>
											<input type="text" name="review_qna_writer" placeholder="작성자" title="작성자명을 입력하세요."/>
										</span>
										<textarea name="review_qna_content" title="본문을 입력하세요."></textarea><br/>
										<!-- <b>Rating: </b> <img src="images/product-details/rating.png" alt="" /> -->
										<button type="button" class="btn btn-default pull-right revQna">
											Submit
										</button>
									</form>
									<div class="fcontainer">
										<!-- <ul></ul> -->
									</div>
								</div>
							</div> --%>
							
							</div>
							
							
						</div>
					</div><!--/category-tab-->
				</div>
			</div>
		<!-- </div> -->
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
    <script type="text/javascript"  charset="utf-8">
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
 	
 	// 후기, 질문 입력폼 유효성 검증
 	var fcontainer = $('.fcontainer');
 	var validator = $(".revQnaForm").validate({
				 		rules:{
				 			review_qna_subject:{
				 				required: true
				 			}
				 			, review_qna_writer:{
				 				required: true
				 			}
				 			, review_qna_content:{
				 				required: true
				 			}
				 		},
				 		// 에러메세지를 container에서 모두 출력
				 		errorContainer: fcontainer,
					    errorLabelContainer: fcontainer,
					    wrapper: 'p'
				 	});
 	
 	// 후기, 질문 게시글 입력
 	$(".revQna").on("click", function(){
 		var formData = $(".revQnaForm").serialize();
 		
		$.ajax({
			// ajax 폼전송 전에 validate 호출
			beforeSend: function(){
				//return $(".revQnaForm").valid();
				if(!$(".revQnaForm").valid()){
					validator.focusInvalid();  // 유효성 체크된 필드에 포커스인
					return false;
				}
			},
			type: "POST"
			, dataType: "json"
			, url: "/revQna/revAdd.do"
			, contentType: "application/x-www-form-urlencoded; charset=UTF-8"
			, data: formData
			, success: function(msg) {
							$("#reviewsDiv").children().remove();
					 		var reviewOne;
					 		for(var i=0; i<msg.length; i++){
					 			reviewOne = "<ul>"
					 			+"<li><a href='#'><i class='fa fa-calendar-o'></i>"+msg[i].review_qna_subject+"</a></li>"
					 			+"<li><a href='#'><i class='fa fa-user'></i>"+msg[i].review_qna_writer+"</a></li>"
					 			+"<li><a href='#'><i class='fa fa-clock-o'></i>"+msg[i].review_qna_regdate+"</a></li>"
								+"</ul>"
								+"<p>"+msg[i].review_qna_content+"</p>"
								+"<hr/>";
								$("#reviewsDiv").append(reviewOne);
					 		}
					 		$(".input").val('');
						}/*revQnaAdded*/
			, error: function(xhr,status,error){
						alert('error');
				 		alert(xhr.status);
				 		location.href = "/details.do?goods_idx="+${detailsGVO.goods_idx };
					}
		});
 	});
 	
 	// 게시글 입력 후 작업 // 목록 새로고침
 	/* function revQnaAdded(msg){
 		$("#reviewsDiv").children().remove();
 		var reviewOne;
 		for(var i=0; i<msg.length; i++){
 			reviewOne = "<ul>"
 			+"<li><a href='#'><i class='fa fa-calendar-o'></i>"+msg[i].review_qna_subject+"</a></li>"
 			+"<li><a href='#'><i class='fa fa-user'></i>"+msg[i].review_qna_writer+"</a></li>"
 			+"<li><a href='#'><i class='fa fa-clock-o'></i>"+msg[i].review_qna_regdate+"</a></li>"
			+"</ul>"
			+"<p>"+msg[i].review_qna_content+"</p>"
			+"<hr/>";
			$("#reviewsDiv").append(reviewOne);
 		}
 		$(".input").val('');
 	};
 	
 	function revQnaAddErr(xhr,status,error){
 		alert('error');
 		alert(xhr.status);
 		location.href = "/details.do?goods_idx="+${detailsGVO.goods_idx };
 	}; */
    </script>
</body>