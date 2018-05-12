<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE HTML>
<html class="full">

<head>
    <title>Traveler - Login register</title>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="keywords" content="Template, html, premium, themeforest" />
    <meta name="description" content="Traveler - Premium template for travel companies">
    <meta name="author" content="Tsoy">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- GOOGLE FONTS -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,600' rel='stylesheet' type='text/css'>
    <!-- /GOOGLE FONTS -->
    
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/font-awesome.css">
    <link rel="stylesheet" href="/css/icomoon.css">
    <link rel="stylesheet" href="/css/styles.css">
    <link rel="stylesheet" href="/css/mystyles.css">
    <script src="/js/modernizr.js"></script>
	<style type="text/css">
	div.owl-wrapper {
		height:100%;
	
	}
	
	</style>
	
</head>

<body style="background-color: black;padding-top: 0%;padding-bottom	: 0%;">

    <!-- /FACEBOOK WIDGET -->
    <div class="global-wrap" style="    background-color: black;height:100%">

			<!-- 중앙공간 -->
			<div class="top-area show-onload" style="height: 100%;position: unset;">
				<div class="bg-holder full" style="/* position: unset; */    padding-top: 7%;">
					<div class="bg-front full-height bg-front-mob-rel">
						<div class="container full-height" style="width: 100%;padding-left: 0px; padding-right: 0px;">
                               <br><br><br><br><br><br><br>
							<div class="rel full-height">
								<div class="tagline visible-lg" id="tagline" style="margin-top: 0px;">
									<span >&emsp;&emsp;&emsp;It's time to</span>
									<ul>
										<li>live</li>
										<li>have fun</li>
										<li>relax</li>
										<li>meet</li>
										<li>being lost</li>
										<li>run away</li>
	                                    <li>go</li>
	                                    <li>explore</li>
	                                    <li>find new friends</li>
	                                    <li class="active">discover</li>
	                                    <li>play</li>
	                                </ul>
								</div>
								<br><br><br><br>
								<br><br><br><br>
								<div class="container" style="display:flex;-webkit-align-item:center; -webkit-justify-content:center;">
                                    <!-- <div class="col-md-8" style="margin:auto;"> -->
                                    <div class="search-tabs search-tabs-bg search-tabs-nobox search-tabs-center-top" style="width:40%;">
		                                <div class="tabbable">
		                                    <ul class="nav nav-tabs" id="myTab">
		                                    	<c:choose>
		                                    		<c:when test="${empty desList}">
		                                        		<li class="active"><a href="#tab-1" data-toggle="tab"><i class="fa fa-plus-square"></i> <span >새 일정</span></a></li>
		                                        	</c:when>
		                                        	<c:otherwise>
		                                        		<c:forEach items="${desList}" var="desvo" varStatus="desStatus">
		                                        			<c:choose>
		                                        				<c:when test="${desStatus.count eq 1}">
		                                        					<li class="active"><a href="#tab-1" data-toggle="tab"><i class="fa fa-building-o"></i> <span >최근 여행 일정${desStatus.end}</span></a></li>
		                                        				</c:when>
		                                        				<c:otherwise>
		                                        					<li><a href="#tab-${desStatus.count}" data-toggle="tab"><i class="fa fa-building-o"></i> <span >이전 여행 ${desStatus.count}</span></a></li>
		                                        				</c:otherwise>
		                                        			</c:choose>
		                                        			<c:set value="${desStatus.end}" var="listEnd"/>
		                                        		</c:forEach>
		                                        		<li><a href="#tab-${listEnd}" data-toggle="tab"><i class="fa fa-plus-square"></i> <span >일정추가</span></a></li>
		                                        		
		                                        	</c:otherwise>
		                                        </c:choose>
		                                        
		                                    </ul>
		                                    <div class="tab-content">
		                                    	
	                                    		<c:choose>
		                                    		<c:when test="${empty desList}">
				                                        <div class="tab-pane fade in active" id="tab-1" style="padding:10%;text-align:center;">
				                                            <h2 style="color: #565656;">여행 일정 등록</h2>
				                                            <form class="desInsertForm" action="/desInsert.do" method="post">
				                                                <div class="row">
				                                                
				                                                    <div class="col-md-6" style="width:100%;">
													                   <div class="form-group form-group-icon-left">
													                      <i class="fa fa-search input-icon input-icon-hightlight"></i>
													                      <label style="font-size: 16px;">어디 가실거에요?</label>
													                         <select class="typeahead form-control" name="desName">
													                         <option>서울</option>
													                         <option>부산</option>
													                         
													                         </select>
													                   </div>
													                </div>

				                                                    
				                                                    <!-- 날짜 form -->
				                                                    <div class="col-md-8" style="width:100%;">
				                                                        <div class="input-daterange" data-date-format="yyyy/mm/dd">
				                                                            <div class="row">
				                                                                <div class="col-md-5" style="width:50%;">
				                                                                    <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-calendar input-icon input-icon-highlight"></i>
				                                                                        <label style="color: #565656;">Start-Date</label>
				                                                                        <input class="form-control" name="start" type="text" />
				                                                                    </div>
				                                                                </div>
				                                                                <div class="col-md-5" style="width:50%;">
				                                                                    <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-calendar input-icon input-icon-highlight"></i>
				                                                                        <label style="color: #565656;">End-Date</label>
				                                                                        <input class="form-control" name="end" type="text" />
				                                                                    </div>
				                                                                </div>
				                                                            </div>
				                                                        </div>
				                                                    </div>
				                                                    
				                                                </div>
				                                                <br>
				                                                <button class="btn btn-primary btn-lg" type="submit" id="desInsert">여행 일정 등록</button>
				                                            </form>
				                                        </div>
		                                        	</c:when>
		                                        	<c:otherwise>
		                                        		<c:forEach items="${desList}" var="desvo" varStatus="desStatus">
		                                        			<c:choose>
		                                        				<c:when test="${desStatus.count eq 1}">
					                                        		<div class="tab-pane fade in active" id="tab-${desStatus.count}" style="padding:10%;text-align:center;">
					                                        	</c:when>
					                                        	<c:otherwise>
					                                        		<div class="tab-pane fade" id="tab-${desStatus.count}" style="padding:10%;text-align:center;">
					                                        	</c:otherwise>
					                                        </c:choose>
							                                            <h3 style="color: #565656;">등록된 여행 일정  ${listEnd}</h3>
							                                                <div class="row">
							                                                
							                                                    <div class="col-md-6" style="width:100%;">
							                                                        <div class="form-group form-group-lg form-group-icon-left">
							                                                        	<h5 style="color: #565656;">
								                                                        	<br>
								                                                        	<i class="fa fa-map-marker"></i>
								                                                        	&ensp;여행지: 
								                                                            ${desvo.desName}
								                                                            <br>
							                                                            </h5>
							                                                        </div>
							                                                    </div>
							                                                    
							                                                    <!-- 날짜 form -->
							                                                    <div class="col-md-8" style="width:100%;">
							                                                        <div class="input-daterange" data-date-format="M d, D">
							                                                                <div class="col-md-5" style="width:50%;">
							                                                                    <div class="form-group form-group-lg form-group-icon-left">
							                                                                    	<h5 style="color: #565656;">
								                                                                    	<i class="fa fa-calendar"></i>
								                                                                    	&ensp;출발일<br>
								                                                                        ${desvo.desDateIn}
							                                                                        </h5>
							                                                                    </div>
							                                                                </div>
							                                                                <div class="col-md-5" style="width:50%;">
							                                                                    <div class="form-group form-group-lg form-group-icon-left">
							                                                                    	<h5 style="color: #565656;">
								                                                                    	<i class="fa fa-calendar"></i>
								                                                                    	&ensp;복귀일<br>
								                                                                        ${desvo.desDateOut}
							                                                                        </h5>
							                                                                    </div>
							                                                                </div>
							                                                        </div>
							                                                    </div>
							                                                </div>
							                                                <br>
							                                            <form class="desStartForm" action="/indexPage.do" method="post">
							                                            	<input type="hidden" name="desPk" value="${desvo.desPk}">
							                                                <button class="btn btn-primary btn-lg" type="submit" id="desStart">해당 일정으로 시작</button>
							                                            </form>
							                                        </div>
					                                	</c:forEach>
					                                	<div class="tab-pane fade" id="tab-${listEnd}" style="padding:10%;text-align:center;">
				                                            <h2 style="color: #565656;">여행 일정 등록</h2>
				                                            <form class="desInsertForm" action="/desInsert.do" method="post">
				                                                <div class="row">
				                                                
				                                                    <div class="col-md-6" style="width:100%;">
													                   <div class="form-group form-group-icon-left">
													                      <i class="fa fa-search input-icon input-icon-hightlight"></i>
													                      <label style="font-size: 16px;">어디 가실거에요?</label>
													                         <select class="typeahead form-control" name="desName">
													                         <option>서울</option>
													                         <option>부산</option>
													                         
													                         </select>
													                   </div>
													                </div>
				                                                    
				                                                    <!-- 날짜 form -->
				                                                    <div class="col-md-8" style="width:100%;">
				                                                        <div class="input-daterange" data-date-format="yyyy/mm/dd">
				                                                            <div class="row">
				                                                                <div class="col-md-5" style="width:50%;">
				                                                                    <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-calendar input-icon input-icon-highlight"></i>
				                                                                        <label style="color: #565656;">Start-Date</label>
				                                                                        <input class="form-control" name="start" type="text" />
				                                                                    </div>
				                                                                </div>
				                                                                <div class="col-md-5" style="width:50%;">
				                                                                    <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-calendar input-icon input-icon-highlight"></i>
				                                                                        <label style="color: #565656;">End-Date</label>
				                                                                        <input class="form-control" name="end" type="text" />
				                                                                    </div>
				                                                                </div>
				                                                            </div>
				                                                        </div>
				                                                    </div>
				                                                    
				                                                </div>
				                                                <br>
				                                                <button class="btn btn-primary btn-lg" type="submit" id="desInsert">여행 일정 등록</button>
				                                            </form>
				                                        </div>
		                                        	</c:otherwise>
		                                        </c:choose>
		                                    </div>
                                    	</div>
                                    </div>
                                	</div>	
                                </div>
                                <!-- 중앙공간 -->
                                </div>
							</div>
                            <div class="owl-carousel owl-slider owl-carousel-area visible-lg" id="owl-carousel-slider" data-nav="false" style="height:100%">
                    			<div class="bg-holder full">
                        			<div class="bg-mask"></div>
                        			<div class="bg-img" style="background-image:url(/img/login-des1.png);"></div>
                    			</div>
                    			<div class="bg-holder full">
									<div class="bg-mask"></div>
									<div class="bg-img" style="background-image:url(/img/login-des2.png);"></div>
                    			</div>
                    			<div class="bg-holder full">
                        			<div class="bg-mask"></div>
                        			<div class="bg-img" style="background-image:url(/img/login-des3.png);"></div>
                    			</div>
                			</div>
			                <div class="bg-img hidden-lg" style="background-image:url(/img/login-des1.png);height:100%;"></div>
			                <div class="bg-mask hidden-lg" style="height:100%"></div>
						</div>
					</div>
							


        <script src="/js/jquery.js"></script>
        <script src="/js/bootstrap.js"></script>
        <script src="/js/slimmenu.js"></script>
        <script src="/js/bootstrap-datepicker.js"></script>
        <script src="/js/bootstrap-timepicker.js"></script>
        <script src="/js/nicescroll.js"></script>
        <script src="/js/dropit.js"></script>
        <script src="/js/ionrangeslider.js"></script>
        <script src="/js/icheck.js"></script>
        <script src="/js/fotorama.js"></script>
        <script src="/js/typeahead.js"></script>
        <script src="/js/card-payment.js"></script>
        <script src="/js/magnific.js"></script>
        <script src="/js/owl-carousel.js"></script>
        <script src="/js/fitvids.js"></script>
        <script src="/js/tweet.js"></script>
        <script src="/js/countdown.js"></script>
        <script src="/js/gridrotator.js"></script>
        <script src="/js/custom.js"></script>
        
		<script type="text/javascript">
			window.onload = init;
			function init() {
			   if (navigator.geolocation) { // GPS를 지원하면
			     navigator.geolocation.getCurrentPosition(function(position) {
			        var latitude = position.coords.latitude;
			        var longitude = position.coords.longitude;
			        console.log("latitude: " + latitude);
			        console.log("longitude: " + longitude);
			        var data = new Object();
			        data.monPk = "${monPk}";
			        data.latitude = latitude;
			        data.longitude = longitude;
			        console.log(data);
			        $.ajax({
			          type:'post',
			          url: "/currentLoc.do",
			          headers : {
			             'Content-Type' : 'application/json',
			             },
			          data:JSON.stringify(data),
			          success: function(r){
			             console.log(r);
			          }
			       });
			        
			     }, function(error) {
			       console.error(error);
			     }, {
			       enableHighAccuracy: false,
			       maximumAge: 0,
			       timeout: Infinity
			     });
			   } else {
			     alert('GPS를 지원하지 않습니다');
			   }
			   
			 }
		  </script>
    
</body>

</html>


