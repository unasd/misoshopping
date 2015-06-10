<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Page Content -->
<div class="container">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="/goods_list.do">전체상품 <span class="sr-only">(current)</span></a></li>
            <c:forEach items="${categoryBList}" var="categoryB">
           	<li class="categoryB">
           		<!-- <a href="#" class="dropdown-toggle" data-toggle="dropdown"> -->
           		<a href="#" class="" data-toggle="collapse" data-target="#${categoryB.category_b_idx }">
           			${categoryB.category_b_desc }<!-- <i class="caret"></i> -->
           		</a>
           		<!-- <ul class="dropdown-menu">
           			<li>
           				<a href="#">1</a>
           			</li>
           		</ul> -->
           		<ul id="${categoryB.category_b_idx }" class="collapse">
           			<li>
           				
           			</li>
           		</ul>
           	</li>
            </c:forEach>
          </ul>
        </div>
        
        <!-- <div class="col-md-9"> -->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="row carousel-holder">
                <div class="col-md-12">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="item active">
                                <img class="slide-image" src="http://placehold.it/800x300" alt="">
                            </div>
                            <div class="item">
                                <img class="slide-image" src="http://placehold.it/800x300" alt="">
                            </div>
                            <div class="item">
                                <img class="slide-image" src="http://placehold.it/800x300" alt="">
                            </div>
                        </div>
                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                </div>

            </div>

            <div class="row">
				<c:forEach var="goods" items="${goodsList }">
	                <div class="col-sm-4 col-lg-4 col-md-4">
	                    <div class="thumbnail">
	                        <img src="${pageContext.request.contextPath}/upload/upimg/thumb/${goods.goods_thumb }" alt="">
	                        <div class="caption">
	                            <h4 class="pull-right">${goods.goods_price }</h4>
	                            <h4><a href="#">${goods.goods_name }</a>
	                            </h4>
	                            <p>${goods.goods_desc }</p>
	                        </div>
	                        <div class="ratings">
	                            <p class="pull-right">15 reviews</p>
	                            <p>
	                                <span class="glyphicon glyphicon-star"></span>
	                                <span class="glyphicon glyphicon-star"></span>
	                                <span class="glyphicon glyphicon-star"></span>
	                                <span class="glyphicon glyphicon-star"></span>
	                                <span class="glyphicon glyphicon-star"></span>
	                            </p>
	                        </div>
	                    </div>
	                </div>
				</c:forEach>
<!-- 
                <div class="col-sm-4 col-lg-4 col-md-4">
                    <div class="thumbnail">
                        <img src="http://placehold.it/320x150" alt="">
                        <div class="caption">
                            <h4 class="pull-right">$64.99</h4>
                            <h4><a href="#">Second Product</a>
                            </h4>
                            <p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                        <div class="ratings">
                            <p class="pull-right">12 reviews</p>
                            <p>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star-empty"></span>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4 col-lg-4 col-md-4">
                    <div class="thumbnail">
                        <img src="http://placehold.it/320x150" alt="">
                        <div class="caption">
                            <h4 class="pull-right">$74.99</h4>
                            <h4><a href="#">Third Product</a>
                            </h4>
                            <p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                        <div class="ratings">
                            <p class="pull-right">31 reviews</p>
                            <p>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star-empty"></span>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4 col-lg-4 col-md-4">
                    <div class="thumbnail">
                        <img src="http://placehold.it/320x150" alt="">
                        <div class="caption">
                            <h4 class="pull-right">$84.99</h4>
                            <h4><a href="#">Fourth Product</a>
                            </h4>
                            <p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                        <div class="ratings">
                            <p class="pull-right">6 reviews</p>
                            <p>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star-empty"></span>
                                <span class="glyphicon glyphicon-star-empty"></span>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4 col-lg-4 col-md-4">
                    <div class="thumbnail">
                        <img src="http://placehold.it/320x150" alt="">
                        <div class="caption">
                            <h4 class="pull-right">$94.99</h4>
                            <h4><a href="#">Fifth Product</a>
                            </h4>
                            <p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                        <div class="ratings">
                            <p class="pull-right">18 reviews</p>
                            <p>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star-empty"></span>
                            </p>
                        </div>
                    </div>
                </div>
                 -->
            </div>

        </div>

    </div>

</div>
<!-- /.container -->
<script>
$(".collapse").collapse();
</script>