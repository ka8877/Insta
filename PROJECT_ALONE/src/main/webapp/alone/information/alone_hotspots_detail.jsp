<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAX9qYtgvZNmWDKq3vYec6VQHVQld-yTlE&libraries=places"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

 <script>
    var revEseq = 4;
	var mylat = 0.0;
	var mylng = 0.0;
	//지오 로케이션 내위치 확인.
	if (navigator.geolocation) {
		function YourPosition(position) {
			mylat =  position.coords.latitude;
			mylng =  position.coords.longitude;
		};
		navigator.geolocation.getCurrentPosition(YourPosition);
	}
     // 맵 스크립트     
      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">
   
       var hot_lat = parseFloat('${spotvo.hotLat}');
       var hot_lng = parseFloat('${spotvo.hotLng}');   
       var hot_placeid = '${spotvo.hotPlaceId}';
     
        function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
         center: {lat:hot_lat , lng:hot_lng } ,
         zoom: 15
        });

        var infowindow = new google.maps.InfoWindow();
        var service = new google.maps.places.PlacesService(map);

        service.getDetails({
          placeId: hot_placeid
        }, function(place, status) {
          if (status === google.maps.places.PlacesServiceStatus.OK) {
            var marker = new google.maps.Marker({
              map: map,
              position: place.geometry.location
            });
            google.maps.event.addListener(marker, 'click', function() {
              infowindow.setContent('<div><strong>' + place.name + '</strong><br>' +
                'Place ID: ' + place.place_id + '<br>' +
                place.formatted_address + '</div>');
              infowindow.open(map, this);
            });
          }
        });
      }

 
   //리뷰 작성
   function revInsert() {
       var params = jQuery("#writeReview").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
       jQuery.ajax({
           url: '/ajax_rev_insert.do',
           type: 'POST',
           data:params,
           contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
           dataType: 'html',
           success: function (result) {
              if(result){   
              $("#hotRevCon").val("");
              $("#option").val(1);
             // alert(result);
              var jsonObj = JSON.parse(result);
              //alert(jsonObj);
            //  console.log(jsonObj.hotRevCon);
              
              var revHtml = "";
              revHtml += '<div class="col-md-10">';
              revHtml += '<ul class="booking-item-reviews list">';
              revHtml += '<li><div class="row">';
              revHtml += '<div class="col-md-2">';
              revHtml += '<div class="booking-item-review-person">';
              revHtml += '<a class="booking-item-review-person-avatar round" href="#">';
              revHtml += '<img onerror="this.src=/img/noImage.jpg" src=/img/profile/'+ jsonObj.monProfile +' alt="Image Alternative text" title="Afro" /> </a>';
              revHtml += '<p class="booking-item-review-person-name">';
              revHtml += '<a href="#">&nbsp;&nbsp;&nbsp;'+jsonObj.monName+'</a>';
              revHtml += '</p></div></div>';
              revHtml += '<div class="col-md-10">';
              revHtml += '<div class="booking-item-review-content">';
              revHtml += '<ul class="icon-group booking-item-rating-stars">';
              if (jsonObj.hotCostRating ==1 ){
                 revHtml += "<li><i class='fa fa-star'></i></li>"
                 revHtml += "<li><i class='fa fa-star-o'></i></li>"
                 revHtml += "<li><i class='fa fa-star-o'></i></li>"
                 revHtml += "<li><i class='fa fa-star-o'></i></li>"
                 revHtml += "<li><i class='fa fa-star-o'></i></li>"
                 }else if (jsonObj.hotCostRating ==2 ){
                 revHtml += "<li><i class='fa fa-star'></i></li>"
                 revHtml += "<li><i class='fa fa-star'></i></li>"
                 revHtml += "<li><i class='fa fa-star-o'></i></li>"
                 revHtml += "<li><i class='fa fa-star-o'></i></li>"
                 revHtml += "<li><i class='fa fa-star-o'></i></li>"
                 }else if (jsonObj.hotCostRating ==3 ){
                 revHtml += "<li><i class='fa fa-star'></i></li>"
                 revHtml += "<li><i class='fa fa-star'></i></li>"
                 revHtml += "<li><i class='fa fa-star'></i></li>"
                 revHtml += "<li><i class='fa fa-star-o'></i></li>"
                 revHtml += "<li><i class='fa fa-star-o'></i></li>"
                 }else if (jsonObj.hotCostRating ==4 ){
                 revHtml += "<li><i class='fa fa-star'></i></li>"
                 revHtml += "<li><i class='fa fa-star'></i></li>"
                 revHtml += "<li><i class='fa fa-star'></i></li>"
                 revHtml += "<li><i class='fa fa-star'></i></li>"
                 revHtml += "<li><i class='fa fa-star-o'></i></li>"
                 }else if (jsonObj.hotCostRating ==5 ){
                 revHtml += "<li><i class='fa fa-star'></i></li>"
                 revHtml += "<li><i class='fa fa-star'></i></li>"
                 revHtml += "<li><i class='fa fa-star'></i></li>"
                 revHtml += "<li><i class='fa fa-star'></i></li>"
                 revHtml += "<li><i class='fa fa-star'></i></li>"
                 }
              revHtml += '<a style="cursor: pointer;" href="/rev_delete.do?hotRevPk='+jsonObj.hotRevPk+'&monPk='+jsonObj.monPk+'&hotPk='+jsonObj.hotPk+'">&emsp;&emsp;&emsp; <i class="fa fa-times"></i></a>';
              revHtml += '</ul>';
        
              revHtml += '<p>'+jsonObj.hotRevCon;
              revHtml += ' </div></div></div></li></ul></div>';
            
              $("#showNowInsertRev").append(revHtml);
                                  
              }                                    
               }           
       });
   }
   
   // 포인터 이동
   function fnMove(seq){
        var offset = $("#my_rev_div"+ seq ).offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
    }
   

function scrDelete() {
   var hot = ${spotvo.hotPk};
    var mon = ${monPk};
    $.ajax({
           url: '/ajax_scrap_delete.do',
           type: 'GET',
           data:{
              hotPk : hot,
              monPk : mon
           },
           contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
           dataType: 'html',
           success: function (result) {
          $("#insertScr").empty();
           $("#deleteScr").empty();
            
            var scrapHtml = "";
            scrapHtml += '<a onclick="scrInsert()" style="cursor: pointer;"><i class="fa fa-heart"></i>스크랩하기</a>';
            $("#insertScr").append(scrapHtml);
            $("#deleteScr").append(scrapHtml);
           }
    });   
   }

    
   function scrInsert() {
        var hot = ${spotvo.hotPk};
        var mon = ${monPk};
        $.ajax({
            url: '/ajax_scrap_insert.do',
            type: 'GET',
            data:{
               hotPk : hot,
               monPk : mon
            },
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
            dataType: 'html',
            success: function (result) {
              $("#deleteScr").empty();
              $("#insertScr").empty();
          
             var scrapHtml = "";
             scrapHtml += '   <a onclick="scrDelete()" style="cursor: pointer;"><i class="fa fa-heart-o"></i>스크랩취소</a>';
             $("#deleteScr").append(scrapHtml);
             $("#insertScr").append(scrapHtml);
            }
        });   
       }
   
   //네이버 길찾기 링크
   function howToGo(){
	   window.open("http://map.naver.com/index.nhn?elng=${spotvo.hotLng}&elat=${spotvo.hotLat}&etext=${spotvo.hotName}&menu=route&pathType=1", "팝업", "left=100, top=10, width=1500, height=800");
   }
   function howToGo2(){
	   window.open("http://map.naver.com/index.nhn?slng="+mylng+"&slat="+mylat+"&elng=${spotvo.hotLng}&elat=${spotvo.hotLat}&etext=${spotvo.hotName}&menu=route&pathType=1", "팝업", "left=100, top=10, width=1300, height=600");
   }

   </script>


<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAX9qYtgvZNmWDKq3vYec6VQHVQld-yTlE&libraries=places&callback=initMap">
</script>

</head> 
<body>
<br><br>




<!-- ------------------------------상단 구성 (사진)  ------------------------------------------------------- -->
	<div class="booking-item-details" >
		
		
				<h2 class="lh1em">${spotvo.hotName}</h2><br>
		
		
		<div class="row" ><!-- 상단 div -->
		
		
		
			<div class="col-md-6" >
				<div class="tabbable booking-details-tabbable" >
					<ul class="nav nav-tabs" id="myTab" >
						<li class="active" ><a href="#tab-1" data-toggle="tab"><i
								class="fa fa-camera"></i>Photos</a></li>						
					</ul>
					<div class="tab-content" >
						<div class="tab-pane fade in active" id="tab-1" >
							<div class="fotorama" data-allowfullscreen="true" data-nav="thumbs" >									
									<!-- 상단 이미지 -->
									<c:forEach var = "pic" items = "${piclist}"  >									
									<img src="${pic.hotPicUrl }" alt="Image Alternative text"  /> 									
									</c:forEach>																										
							</div>
						</div>				
					</div>
				</div>
			</div><!-- 상단 좌측 div끝 -->
			
			<div class="col-md-6">
				<div class="booking-item-meta">
				
				
				
					<h2 class="lh1em mt40">AVERAGE</h2>

					<div class="booking-item-rating">
						<ul class="icon-list icon-group booking-item-rating-stars">
							<script>
                            	var avg = '${spotvo.avgRating}';                            	
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
						<span class="booking-item-rating-number"><b>${spotvo.avgRating}</b></span>
						<p>
							<a class="text-default" href="#" onclick="fnMove(1)">based on ${spotvo.totalReviewer} reviews</a>
						</p>
					</div>
				</div>
				
		
			
				<div class="row" >
					<div class="col-md-8" >
						<h4 class="lh1em">Traveler raiting</h4>
						<ul class="list booking-item-raiting-list" style="width: 480px;" >
							<li>
								<div class="booking-item-raiting-list-title" >Exellent</div>
								<div class="booking-item-raiting-list-bar"  >
									<div id="ssss" style="width:${costcntvo.costCnt5/spotvo.totalReviewer*100}%;"></div>
								</div>
								<div class="booking-item-raiting-list-number">${costcntvo.costCnt5 }</div>
							</li>
							<li>
								<div class="booking-item-raiting-list-title">Very Good</div>
								<div class="booking-item-raiting-list-bar">
									<div style="width:${costcntvo.costCnt4/spotvo.totalReviewer*100}%;"></div>
								</div>
								<div class="booking-item-raiting-list-number">${costcntvo.costCnt4 }</div>
							</li>
							<li>
								<div class="booking-item-raiting-list-title">Average</div>
								<div class="booking-item-raiting-list-bar">
									<div style="width: ${costcntvo.costCnt3/spotvo.totalReviewer*100}%;"></div>
								</div>
								<div class="booking-item-raiting-list-number">${costcntvo.costCnt3}</div>
							</li>
							<li>
								<div class="booking-item-raiting-list-title">Poor</div>
								<div class="booking-item-raiting-list-bar">
									<div style="width: ${costcntvo.costCnt2/spotvo.totalReviewer*100}%;"></div>
								</div>
								<div class="booking-item-raiting-list-number">${costcntvo.costCnt2}</div>
							</li>
							<li>
								<div class="booking-item-raiting-list-title">Terrible</div>
								<div class="booking-item-raiting-list-bar">
									<div style="width: ${costcntvo.costCnt1/spotvo.totalReviewer*100}%;"></div>
								</div>
								<div class="booking-item-raiting-list-number">${costcntvo.costCnt1}</div>
							</li>
						</ul>
					</div>
				</div><br><br>				       
				<button class="btn btn-primary" onclick="fnMove(2)">리&nbsp;뷰&nbsp;쓰&nbsp;러&nbsp;가&nbsp;기</button>
			</div><!-- 상단 우측 div끝 -->
		</div><br><!-- 상단 div끝 -->
		
		<div class="box bg-gray">
					${spotvo.hotAddr }<br>
					<i class="fa fa-phone"></i>${spotvo.hotTel }<br><br>
					영업시간 : ${spotvo.hotOpen } 까지 <br>
		</div><br><br>			
		

		
 	<!-- 메인 확대 이미지  -->  
        <div class="bg-holder">
            <div class="bg-mask"></div>
            <div class="bg-parallax" style="background-image:url(${piclist[0].hotPicUrl });"></div>
            
            <div class="bg-content">
                <div class="container">
                    <div class="gap gap-big text-right text-white">
                     <br><br><br><br><br>     <br><br><br><br><br>     <br><br><br><br><br>          
                       <c:if test="${scrapvo.hotScrPk <=0 || scrapvo.hotScrPk == null }">
                       <span id = "insertScr">
                     	<a onclick="scrInsert()" style="cursor: pointer;"><i class="fa fa-heart"></i>스크랩하기</a>
                       </span>
                       </c:if>
                       <c:if test="${scrapvo.hotScrPk > 0}">
                       <span id = "deleteScr">
                      	<a onclick="scrDelete()" style="cursor: pointer;"><i class="fa fa-heart-o"></i>스크랩취소</a>     
                       </span>
                       </c:if>
                      
                      	&nbsp; 	&nbsp; 	&nbsp; 	&nbsp; 	&nbsp; 	&nbsp; 	&nbsp; 	&nbsp; 	&nbsp; 	&nbsp; 	&nbsp; 
                       
                    </div>
                </div>
            </div>
        </div>	<br><br>
		
		
	<!-- 장소 설명 -->
		
	<div class="box bg-gray">
	<h5>${spotvo.hotDetail }</h5>
	</div><br><br>
			
		<!-- 맵 -->
		<h3>Map</h3>
		<!-- <a href = "#" onClick ="howToGo();">길찾기&nbsp;&nbsp;<i class = "fa fa-arrow-right "></i></a><br> -->
		<a href = "#" onClick ="howToGo2();">길찾기&nbsp;&nbsp;<i class = "fa fa-arrow-right "></i></a><br>
		<div id="map" style="width: 100%; height: 500px;"></div>
		<br><br>
	<!-- --------------------------------------map의끝 ------------------------------------------------------------- -->


		<!-- 리뷰  -->
		<h3 class="mb20">Reviews</h3>
		<c:set var = "eseq" value = "4"/>
		<div class="row row-wrap" id ="my_rev_div">
		
			<div class="col-md-10">
				<ul class="booking-item-reviews list">
						
		<c:forEach  var = "rev" items = "${revlist}" end ="${eseq}" >
					<li>
						<div class="row">
							<div class="col-md-2">
								<div class="booking-item-review-person">
									<a class="booking-item-review-person-avatar round" href="#">
										<img src="/img/profile/${rev.monProfile }" title="Afro" onerror="this.src='/img/noImage.jpg'" />
									</a>
									<p class="booking-item-review-person-name">
										<a href="#">&nbsp;&nbsp;&nbsp;${rev.monName }</a>
									</p>

								</div>
							</div>
							<div class="col-md-10">
								<div class="booking-item-review-content">

									<ul class="icon-group booking-item-rating-stars">
									<c:choose>
									<c:when test = "${rev.hotCostRating == 1}">
									<li><i class="fa fa-star"></i><li><i class="fa fa-star-o"></i></li><li><i class="fa fa-star-o"></i></li><li><i class="fa fa-star-o"></i></li><li><i class="fa fa-star-o"></i></li>									
									</c:when>
									<c:when test = "${rev.hotCostRating == 2}">
									<li><i class="fa fa-star"></i><li><i class="fa fa-star"></i></li><li><i class="fa fa-star-o"></i></li><li><i class="fa fa-star-o"></i></li><li><i class="fa fa-star-o"></i></li>									
									</c:when>
									<c:when test = "${rev.hotCostRating == 3}">
									<li><i class="fa fa-star"></i><li><i class="fa fa-star"></i></li><li><i class="fa fa-star"></i></li><li><i class="fa fa-star-o"></i></li><li><i class="fa fa-star-o"></i></li>									
									</c:when>
									<c:when test = "${rev.hotCostRating == 4}">
									<li><i class="fa fa-star"></i><li><i class="fa fa-star"></i></li><li><i class="fa fa-star"></i></li><li><i class="fa fa-star"></i></li><li><i class="fa fa-star-o"></i></li>									
									</c:when>
									<c:when test = "${rev.hotCostRating == 5}">
									<li><i class="fa fa-star"></i><li><i class="fa fa-star"></i></li><li><i class="fa fa-star"></i></li><li><i class="fa fa-star"></i></li><li><i class="fa fa-star"></i></li>									
									</c:when>
									</c:choose>
										
                            			<!--  만약 내가 쓴 리뷰 라면 삭제버튼. -->
					                <c:if test = "${rev.monPk == monPk}">                          			
                            		<li><a style="cursor: pointer;" href = "/rev_delete.do?hotRevPk=${rev.hotRevPk}&monPk=${rev.monPk}&hotPk=${rev.hotPk}">&emsp;&emsp;&emsp; <i class="fa fa-times"></i></a></c:if></li>
									</ul>
										<p>${rev.hotRevCon} 
								</div>
		</c:forEach></ul>
							</div>	
						</div>
					</li>				
			</div>	

<!--  방금 작성한 리뷰보기 -->
	<div class="row row-wrap" id = "showNowInsertRev"></div><br><br>

<!--  리뷰 쓰기  -->
	
     <h3>Write a Review</h3>
	 <div class="box bg-gray" id = "my_rev_div2">
                        <form id = "writeReview" action= "json" method = "post">
                        <input type = "hidden" name = "hotPk" value = "${spotvo.hotPk }" > 
                        <input type = "hidden" name = "monPk" value = "${monPk }" > 
                            <div class="form-group">
                                <label>ReviewCost</label>
                             <!--    <input class="form-control" type="text" /> -->
                             <select name = "hotCostRating" style = "width:100%">
                             <option value = "5"> ★★★★★ </option>
                             <option value = "4"> ★★★★☆ </option>
                             <option value = "3"> ★★★☆☆ </option>
                             <option value = "2"> ★★☆☆☆ </option>
							 <option value = "1">★☆☆☆☆ </option>			
							
							</select>       
                            </div>
                            <div class="form-group">
                                <label>Review Text</label>
                                <textarea class="form-control" rows="6" name = "hotRevCon" id = "hotRevCon"></textarea>
                            </div>
                            <input class="btn btn-primary" id = "revWriteBtn" type="button" onclick="revInsert()" value="Write Review" />
                        </form>
                       
       </div><br><br>

	
	
	<%-- <a href = "https://search.google.com/local/writereview?placeid=${spotvo.hotPlaceId}">리뷰 테스트</a> --%>

                  
 </body>
</html>
