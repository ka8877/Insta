<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>



</head>
<body><br><br>
       
       <!-- 상단 도시 선택 -->
       <!-- explore 버튼을 누르면 해당 도시의 관광지 리스트.  -->
        <div class="container">
        </div>
        <div class="special-area">
            <div class="owl-carousel owl-slider owl-carousel-area" id="owl-carousel-slider" >
               
               
                <div class="bg-holder full text-center text-white" >
                    <div class="bg-mask "></div>
                    <div class="bg-img" style="background-image:url(/img/information/seoul.jpg);" ></div>
                    <div class="bg-front full-center">
                        <div class="owl-cap">                           
                            <h1 class="owl-cap-title">SEOUL</h1>
                            <a class="btn btn-white btn-ghost" href="/hot_spot_list.do?hotCity=서울"><i class="fa fa-angle-right"></i> Explore</a>
                        </div>
                    </div>
                </div>
                
                
                <div class="bg-holder full text-center text-white">
                    <div class="bg-mask"></div>
                    <div class="bg-img" style="background-image:url(/img/information/busan2.jpg);"></div>
                    <div class="bg-front full-center">
                        <div class="owl-cap">
                            <h1 class="owl-cap-title">BUSAN</h1>
                           <a class="btn btn-white btn-ghost" href="hot_spot_list.do?hotCity=부산"><i class="fa fa-angle-right"></i> Explore</a>
                        </div>
                    </div>
                </div>
                
                
                <div class="bg-holder full text-center text-white">
                    <div class="bg-mask"></div>
                    <div class="bg-img" style="background-image:url(/img/information/jeju.jpg);"></div>
                    <div class="bg-front full-center">
                        <div class="owl-cap">
                            <h1 class="owl-cap-title">JEJU</h1>
                            <a class="btn btn-white btn-ghost" href="hot_spot_list.do?hotCity=제주"><i class="fa fa-angle-right"></i> Explore</a>
                        </div>
                    </div>
                </div>
            </div>
        </div><br><br>
  <!-- ----------------------------------------------------도시선택 끝---------------------------------------------------------------------- -->
  
  
        
       <!-- 카테고리 선택. 버튼식. -->
      <%--  <ul class="list-inline">
        <li><form class="cate1" id = "cate1" method = "get" action = "/hot_spot_list.do">
        <input type = "hidden" name = "hotCity" value = "${LVL_SESS_CITY}">
        <input type = "hidden" name = "hotCateSeq" value ="1">
        <input class = "btn btn-ghost btn-default btn-lg" type = "submit" value ="&nbsp&nbsp관&nbsp&nbsp&nbsp&nbsp광&nbsp&nbsp" >        
        </form></li>
        <li><form class="cate2" id = "cate2" method = "get" action = "/hot_spot_list.do">
        <input type = "hidden" name = "hotCity" value = "${LVL_SESS_CITY}">
        <input type = "hidden" name = "hotCateSeq" value ="2">
        <input class = "btn btn-ghost btn-info btn-lg" type = "submit" value ="&nbsp&nbsp쇼&nbsp&nbsp&nbsp&nbsp핑&nbsp&nbsp" >        
        </form></li>
        <li><form class="cate3" id = "cate3" method = "get" action = "/hot_spot_list.do">
        <input type = "hidden" name = "hotCity" value = "${LVL_SESS_CITY}">
        <input type = "hidden" name = "hotCateSeq" value ="3">
        <input class = "btn btn-ghost btn-danger btn-lg" type = "submit" value ="&nbsp&nbsp음&nbsp&nbsp&nbsp&nbsp식&nbsp&nbsp" >        
        </form></li></ul><br> --%>
       
         
         <!-- 카테고리. 탭 방식 -->
	<div class="col-md-9">
		<div class="row row-wrap" data-gutter="60">
			<div class="col-md-6" style="width: 1170px;">
				<div class="tabbable">
					<ul class="nav nav-tabs" id="myTab">
						<li class="active"><a href="#tab-1" data-toggle="tab">&nbsp&nbsp관&nbsp&nbsp&nbsp&nbsp광&nbsp&nbsp</a>
						</li>
						<li><a href="#tab-2" data-toggle="tab">&nbsp&nbsp쇼&nbsp&nbsp&nbsp&nbsp핑&nbsp&nbsp</a>
						</li>
						<li><a href="#tab-3" data-toggle="tab">&nbsp&nbsp음&nbsp&nbsp&nbsp&nbsp식&nbsp&nbsp</a>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade in active" id="tab-1">
							<p class="mt10">

								<!--  탭 내용 작성   -->
							<div class="row row-wrap">

								<c:forEach var="vo" varStatus = "status" items="${LVL_CATE1_LIST}">

									<div class="col-md-4">
										<div class="thumb">
											<header class="thumb-header"> <a class="hover-img"
												href="/hot_spot_detail.do?hotPk=${vo.hotPk}"> <img
												style="width: auto; height: 300px;" src="${vo.hotPicUrl}"
												alt="Image Alternative text" title="hotel 1" />
												<h5 class="hover-title-center">View Now</h5>
											</a> </header>

											<div class="thumb-caption">
												<table width="97%">
													<tr>
														<td width="93%">
															<h5 class="thumb-title">${vo.hotName}</h5>

															<ul class="icon-group text-tiny text-color">
																
																<!-- 별점작성 스크립트 -->
																<script>
                            									var avg = '${vo.avgRating}';                            	
                            									var star = "'fa fa-star'";
                            									var half = "'fa fa-star-half-empty'";
                            									var empty = "'fa fa-star-o'";
                            
                            									for(var j = 0 ; j <5  ; j++ ){
                            										avg -= 1;
																	if(avg < -0.5 ){
                            											document.write('<li><i class='+empty+'></i></li>');									
																	}else if(avg < 0 && avg >= -0.5){
																		document.write('<li><i class='+half+'></i></li>');										
																	}else{
																		document.write('<li><i class='+star+'></i></li>');
																	}		
                            									}
                            									</script>

															</ul>
														</td>
														<td>
														
															<!-- 스크랩 버튼이벤트 --> 
															<c:set var = "idx1" value = "${status.index }"/>
															<c:choose>
																<c:when test="${vo.hotScrPk == 0}">
														
																	<span id = "insertScr${idx1}">
                     												<a onclick="scrInsert(${vo.hotPk},${idx1})" style="cursor: pointer;">
                     												<i class="fa fa-heart box-icon-danger box-icon-left box-icon-border animate-icon-shake round"></i></a>
                       												</span>
															
																</c:when>
																<c:when test="${vo.hotScrPk != 0}">
																		<span id = "deleteScr${idx1}">
                     													<a onclick="scrDelete(${vo.hotPk},${idx1})" style="cursor: pointer;">
                     													<i class="fa fa-heart box-icon-danger box-icon-left  animate-icon-shake round"></i></a>
                      													</span>
																</c:when>
															</c:choose>
															
															
															
															
												
															
															
															
															
	<!-- -----------------------------------스크랩버튼 끝 --------------------------------------- -->	
			
														</td>
													</tr>
												</table>
											</div>


										</div>
									</div>
								</c:forEach>

							</div>
							<h5>${LVL_PAGING1}</h5><!-- 페이징 -->
							<br>


							</p>
						</div>
						<!-- ----------------------------1탭의 끝 ------------------------------------------------------------------------->
						<div class="tab-pane fade" id="tab-2">
							<p class="mt10">
								<!--  탭 내용 작성   -->
							<div class="row row-wrap">

								<c:forEach var="vo" varStatus = "status" items="${LVL_CATE2_LIST}">

									<div class="col-md-4">
										<div class="thumb">
											<header class="thumb-header"> <a class="hover-img"
												href="/hot_spot_detail.do?hotPk=${vo.hotPk}"> <img
												style="width: auto; height: 300px;" src="${vo.hotPicUrl}"
												alt="Image Alternative text" title="hotel 1" />
												<h5 class="hover-title-center">View Now</h5>
											</a> </header>

											<div class="thumb-caption">
												<table width="97%">
													<tr>
														<td width="93%">
															<h5 class="thumb-title">${vo.hotName}</h5>

															<ul class="icon-group text-tiny text-color">
																<!-- 별점작성 스크립트 -->
																<script>
                            									var avg = '${vo.avgRating}';                            	
                            									var star = "'fa fa-star'";
                            									var half = "'fa fa-star-half-empty'";
                            									var empty = "'fa fa-star-o'";
                            
                            									for(var j = 0 ; j <5  ; j++ ){
                            										avg -= 1;
																	if(avg < -0.5 ){
                            											document.write('<li><i class='+empty+'></i></li>');									
																	}else if(avg < 0 && avg >= -0.5){
																		document.write('<li><i class='+half+'></i></li>');										
																	}else{
																		document.write('<li><i class='+star+'></i></li>');
																	}		
                            									}
                            									</script>

															</ul>
														</td>
														<td>
															<!-- 스크랩 버튼이벤트 --> 
															<c:set var = "idx2" value = "${status.index }"/>
															<c:choose>
																<c:when test="${vo.hotScrPk == 0}">
															
																	<span id = "insertScr2${idx2}">
                     												<a onclick="scrInsert2(${vo.hotPk},${idx2})" style="cursor: pointer;">
                     												<i class="fa fa-heart box-icon-danger box-icon-left box-icon-border animate-icon-shake round"></i></a>
                       												</span>
																</c:when>
																<c:when test="${vo.hotScrPk != 0}">
																	
																		<span id = "deleteScr2${idx2}">
                     													<a onclick="scrDelete2(${vo.hotPk},${idx2})" style="cursor: pointer;">
                     													<i class="fa fa-heart box-icon-danger box-icon-left  animate-icon-shake round"></i></a>
                      													</span>
																</c:when>
															</c:choose>

														</td>
													</tr>
												</table>
											</div>


										</div>
									</div>
								</c:forEach>

							</div>
							<h5>${LVL_PAGING2}</h5>
							<br>


							</p>
						</div>
						<!-- ----------------------------2탭의 끝 ------------------------------------------------------------------------->

						<div class="tab-pane fade" id="tab-3">
							<!--  탭 내용 작성   -->
							<div class="row row-wrap">

								<c:forEach var="vo" varStatus = "status" items="${LVL_CATE3_LIST}">

									<div class="col-md-4">
										<div class="thumb">
											<header class="thumb-header"> <a class="hover-img"
												href="/hot_spot_detail.do?hotPk=${vo.hotPk}"> <img
												style="width: auto; height: 300px;" src="${vo.hotPicUrl}"
												alt="Image Alternative text" title="hotel 1" />
												<h5 class="hover-title-center">View Now</h5>
											</a> </header>

											<div class="thumb-caption">
												<table width="97%">
													<tr>
														<td width="93%">
															<h5 class="thumb-title">${vo.hotName}</h5>

															<ul class="icon-group text-tiny text-color">
																<!-- 별점작성 스크립트 -->
																<script>
                            									var avg = '${vo.avgRating}';                            	
                            									var star = "'fa fa-star'";
                            									var half = "'fa fa-star-half-empty'";
                            									var empty = "'fa fa-star-o'";
                            
                            									for(var j = 0 ; j <5  ; j++ ){
                            										avg -= 1;
																	if(avg < -0.5 ){
                            											document.write('<li><i class='+empty+'></i></li>');									
																	}else if(avg < 0 && avg >= -0.5){
																		document.write('<li><i class='+half+'></i></li>');										
																	}else{
																		document.write('<li><i class='+star+'></i></li>');
																	}		
                            									}
                            									</script>

															</ul>
														</td>
														<td>
																<!-- 스크랩 버튼이벤트 --> 
															<c:set var = "idx3" value = "${status.index }"/>
															<c:choose>
																<c:when test="${vo.hotScrPk == 0}">
															
																	<span id = "insertScr3${idx3}">
                     												<a onclick="scrInsert3(${vo.hotPk},${idx3})" style="cursor: pointer;">
                     												<i class="fa fa-heart box-icon-danger box-icon-left box-icon-border animate-icon-shake round"></i></a>
                       												</span>
															
																	
																</c:when>
																<c:when test="${vo.hotScrPk != 0}">
																	
																		<span id = "deleteScr3${idx3}">
                     													<a onclick="scrDelete3(${vo.hotPk},${idx3})" style="cursor: pointer;">
                     													<i class="fa fa-heart box-icon-danger box-icon-left  animate-icon-shake round"></i></a>
                      													</span>
																</c:when>
															</c:choose>
															

														</td>
													</tr>
												</table>
											</div>


										</div>
									</div>
								</c:forEach>

							</div>
							<h5>${LVL_PAGING3}</h5>
							<br>


							</p>
						</div>
						<!-- ----------------------------3탭의 끝 ------------------------------------------------------------------------->
					</div>
				</div>
			</div>
		</div>
	</div>







<script>
function scrDelete(prm1,prm2) {
	var hotPk = prm1;
    var idx = prm2;
	var mon = ${monPk};
	    $.ajax({
	           url: '/ajax_scrap_delete.do',
	           type: 'GET',
	           data:{
	              hotPk : hotPk,
	              monPk : mon
	           },
	           contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
	           dataType: 'html',
	           success: function (result) {
	          $("#insertScr"+idx).empty();
	           $("#deleteScr"+idx).empty();
	            
	            var scrapHtml = "";
	            scrapHtml += '<a onclick="scrInsert('+hotPk+","+idx+')" style="cursor: pointer;"><i class="fa fa-heart box-icon-danger box-icon-left box-icon-border animate-icon-shake round"></i></a>';
	            $("#insertScr"+idx).append(scrapHtml);
	            $("#deleteScr"+idx).append(scrapHtml);
	           }
	    });   
	   }

	    
	   function scrInsert(prm1,prm2) {
		  
	        var hotPk = prm1;
	        var idx = prm2;
	        var mon = ${monPk};
	        $.ajax({
	            url: '/ajax_scrap_insert.do',
	            type: 'GET',
	            data:{
	               hotPk : hotPk,
	               monPk : mon
	            },
	            contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
	            dataType: 'html',
	            success: function (result) {
	              $("#deleteScr"+idx).empty();
	              $("#insertScr"+idx).empty();
	          
	             var scrapHtml = "";
	             scrapHtml += '<a onclick="scrDelete('+hotPk+","+idx+')" style="cursor: pointer;"><i class="fa fa-heart box-icon-danger box-icon-left  animate-icon-shake round"></i></a>';
	             $("#deleteScr"+idx).append(scrapHtml);
	             $("#insertScr"+idx).append(scrapHtml);
	            }
	        });   
	       }
	

	   function scrDelete2(prm1,prm2) {
			var hotPk = prm1;
		    var idx = prm2;
			var mon = ${monPk};
			  
			    $.ajax({
			           url: '/ajax_scrap_delete.do',
			           type: 'GET',
			           data:{
			              hotPk : hotPk,
			              monPk : mon
			           },
			           contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
			           dataType: 'html',
			           success: function (result) {
			        	  
			          $("#insertScr2"+idx).empty();
			           $("#deleteScr2"+idx).empty();
			            
			            var scrapHtml = "";
			            scrapHtml += '<a onclick="scrInsert2('+hotPk+","+idx+')" style="cursor: pointer;"><i class="fa fa-heart box-icon-danger box-icon-left box-icon-border animate-icon-shake round"></i></a>';
			            $("#insertScr2"+idx).append(scrapHtml);
			            $("#deleteScr2"+idx).append(scrapHtml);
			           }
			    });   
			   }

	    
	   function scrInsert2(prm1,prm2) {
		  
	   
	        var hotPk = prm1;
	        var idx = prm2;
	        var mon = ${monPk};
	        $.ajax({
	            url: '/ajax_scrap_insert.do',
	            type: 'GET',
	            data:{
	               hotPk : hotPk,
	               monPk : mon
	            },
	            contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
	            dataType: 'html',
	            success: function (result) {
	             
	              $("#deleteScr2"+idx).empty();
	              $("#insertScr2"+idx).empty();
	          
	             var scrapHtml = "";
	             scrapHtml += '<a onclick="scrDelete2('+hotPk+","+idx+')" style="cursor: pointer;"><i class="fa fa-heart box-icon-danger box-icon-left  animate-icon-shake round"></i></a>';
	             $("#deleteScr2"+idx).append(scrapHtml);
	             $("#insertScr2"+idx).append(scrapHtml);
	            }
	        });   
	       }
	

function scrDelete3(prm1,prm2) {
	var hotPk = prm1;
    var idx = prm2;
	var mon = ${monPk};
	  
	    $.ajax({
	           url: '/ajax_scrap_delete.do',
	           type: 'GET',
	           data:{
	              hotPk : hotPk,
	              monPk : mon
	           },
	           contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
	           dataType: 'html',
	           success: function (result) {
	        	  
	          $("#insertScr3"+idx).empty();
	           $("#deleteScr3"+idx).empty();
	            
	            var scrapHtml = "";
	            scrapHtml += '<a onclick="scrInsert3('+hotPk+","+idx+')" style="cursor: pointer;"><i class="fa fa-heart box-icon-danger box-icon-left box-icon-border animate-icon-shake round"></i></a>';
	            $("#insertScr3"+idx).append(scrapHtml);
	            $("#deleteScr3"+idx).append(scrapHtml);
	           }
	    });   
	   }

	    
	   function scrInsert3(prm1,prm2) {
		  
	   	
	        var hotPk = prm1;
	        var idx = prm2;
	        var mon = ${monPk};
	        $.ajax({
	            url: '/ajax_scrap_insert.do',
	            type: 'GET',
	            data:{
	               hotPk : hotPk,
	               monPk : mon
	            },
	            contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
	            dataType: 'html',
	            success: function (result) {
	            
	              $("#deleteScr3"+idx).empty();
	              $("#insertScr3"+idx).empty();
	          
	             var scrapHtml = "";
	             scrapHtml += '<a onclick="scrDelete3('+hotPk+","+idx+')" style="cursor: pointer;"><i class="fa fa-heart box-icon-danger box-icon-left  animate-icon-shake round"></i></a>';
	             $("#deleteScr3"+idx).append(scrapHtml);
	             $("#insertScr3"+idx).append(scrapHtml);
	            }
	        });   
	       }
	
</script>



</body>
</html>