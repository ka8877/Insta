<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Did you come ALONE?</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAH12tWJRl_6JyAnWqtt-yACdhnDxWrmyM&callback=initMap"></script>
<script>

var lineCo = [];
var linePath;
var selcon = [];

<c:forEach items="${list}" var="ls" varStatus="st">
var lat${st.count} = ${ls.hotLat};
var lng${st.count} = ${ls.hotLng};
selcon.push('${ls.hotName}');
</c:forEach>

function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 11,
      center: 
		<c:choose>
			<c:when test="${list[0].hotCity == '서울'}">{lat:37.5511694, lng:126.98822659999996}</c:when>
			<c:when test="${list[0].hotCity == '부산'}">{lat:35.1709965, lng:129.03595029999997}      </c:when>
			<c:when test="${list[0].hotCity == '제주'}">{lat:33.3616666, lng:126.52916660000005}</c:when>			      
			<c:otherwise>{lat:37.5511694, lng:126.98822659999996}</c:otherwise>
		</c:choose>
    });
    var myIcon = new google.maps.MarkerImage("img/route/test_marker3.png", null, null, null, null);

	<c:forEach items="${list}" var="ls" varStatus="st">
 	var hot${st.count} = '${ls.hotName}'; 
	var latlng${st.count} = {lat: parseFloat('${ls.hotLat}'), lng: parseFloat('${ls.hotLng}')};	
	var marker${st.count} = new google.maps.Marker({
		position: latlng${st.count},
        map: map,
        icon: myIcon,
        title: hot${st.count}
    	});
	var infowindow${st.count} = new google.maps.InfoWindow({ 
		content:'${ls.hotName}'
		});
    google.maps.event.addListener(marker${st.count}, 'click', function() {
    	
    	infowindow${st.count}.open(map, marker${st.count});
    	});
    	lineCo.push(latlng${st.count});
	</c:forEach>

	var lineSymbol = {
			path: google.maps.SymbolPath.FORWARD_OPEN_ARROW,
			scale: 2,
	        strokeColor: '#f41717'
	};
	linePath = new google.maps.Polyline({
	    path: lineCo,
	    icons: [{
				  icon: lineSymbol,
				  repeat:'50px',
				  offset: '100%'
				}],
			 geodesic: true,
			 strokeColor: '#FF0000',
			 strokeOpacity: 0.7,
			 strokeWeight: 1.5,
			 map:map
		   });
	animateCircle(linePath);
	//linePath.setMap(map);
}

function animateCircle(line) {
    var count = 0;
    window.setInterval(function() {
      count = (count + 1) % 200;

      var icons = linePath.get('icons');
      icons[0].offset = (count / 2) + '%';
      linePath.set('icons', icons);
  }, 40);
}

function dota(){
	var div = document.getElementById("textDiv");  
	var text = div.textContent;
	text +="not all ";
	div.textContent = text;  
}

//이 밑으로 수학하는 놈들 다 꺼져!
function deg2rad(deg) {
    return (deg * Math.PI / 180.0);
}

function rad2deg(rad) {
    return (rad * 180 / Math.PI);
}

function distance(lat1, lng1, lat2, lng2) {
    
    var theta = lng1 - lng2;
    var dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
     
    dist = Math.acos(dist);
    dist = rad2deg(dist);
    dist = dist * 60 * 1.1515;
	dist = dist * 1.609344;

    return dist;
}

function inputSc(){
	if(selcon.length==0){
		alert("내용물이 없어요...");
	} else {
		var addr ="";
		for(a=0; a<selcon.length; a++){
			addr+=selcon[a];
			if(a!=selcon.length-1){
				addr+=", ";		
			}
		}
		var mseq = "${monPk}";
		if(mseq != "") {
			
			var data = new Object();
			data.location = addr;
			data.startDate = routePick.start.value+"";
			data.endDate = routePick.end.value+""; 
			
			
			//var data = {startDate:"111", endDate:"222"};
			console.log(data);
			$.ajax({
				url: "/eventInsert.do",
				headers: {
	                  "Content-Type" : "application/json"
	              }, 	
				method: "post",
				data: JSON.stringify(data),
				success: function(res){
					console.log("입력되었습니다.");
				}					
			});
		} else {
			alert("회원이 아닙니다.");
		}
	}
}

</script>
</head>
<body>
        <div class="container">
            <h1 class="page-title">일정 : ${list[0].rouName}</h1>
            <h4 style="text-align:right;line-height:2.1em">${list[0].rouDetail}<br>
            <input class="btn btn-info btn-lg" type='button' value='목록으로' onclick = 'location.href="/recommend.do"'></h4>        
            <hr>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <aside class="sidebar-left">
							<div align="center" id="map" style="border:1px dashed #BDBDBD;height:400px"></div>
							<div style="line-height:3.2em">
								<hr>
								<c:forEach items="${list}" var="ls" varStatus="st">
								&emsp;<i class="fa fa-map-marker" style="font-size: 1.30em;"></i>&emsp;<font size="4">${ls.hotName}</font><br>
								</c:forEach><hr>										
							</div>
					<div style="width:100%">
						<div style="float:left;width:50%;margin-left:auto;margin-right:auto;text-align:center;vertical-align:middle;">
			                <form name="routePick" action='/eventInsert.do'>
							<div class="input-daterange" data-date-format="yyyy/mm/dd">
								<div class="form-group form-group-icon-left"><i class="fa fa-calendar input-icon input-icon-hightlight"></i>
									<label>Departing</label>
									<input class="form-control" name="start" type="text" />
								</div>
								<div class="form-group form-group-icon-left"><i class="fa fa-calendar input-icon input-icon-hightlight"></i>
									<label>Returning</label>
									<input class="form-control" name="end" type="text" />
								</div>
							</div>                                                       
				            </form>						
						</div>
						<div style="float:right;width:50%;margin-left:auto;margin-right:auto;padding:5px;text-align:center;vertical-align:middle;">
							<div class="gap"></div>
							<div>
							<input class="btn btn-warning btn-lg" type='button' id='mist' value='일정에 투입' onClick='inputSc()'>
							</div>
						</div>						
					</div>							
					
                    </aside>

                </div>


                <div class="col-md-6">                
                <c:forEach items="${list}" var="ls" varStatus="st">
                    <c:if test="${!st.first}">
					<div style="width:100%;line-height:4.1em">
						<div align="center" style="float:left;background-color:#f0f0f0;width:10%"><i class="fa fa-ellipsis-v"></i></div>
						<div id="disDiv${st.count}" style="float:left;background-color:#f0f0f0;width:90%">&emsp;undefined ㎞</div>						
					</div>
					<script>
				    	var div = document.getElementById("disDiv${st.count}");
				    	div.textContent = distance(lat${st.count}, lng${st.count}, lat${st.count-1}, lng${st.count-1}).toFixed(3)+"㎞";
					</script>
					</c:if>
                    <img src="${ls.hotPicUrl}" height="200" alt="none_image" title="${ls.hotName}">
                    <h4 style="line-height:2.1em">&emsp;<i class="fa fa-map-marker"></i>&ensp;${ls.hotName}</h4>
				</c:forEach> 
					<div style="width:100%;line-height:4.1em">
						<div align="center" style="float:left;background-color:#f0f0f0;width:100%"><i class="fa fa-ellipsis-h"></i></div>
					</div>				
                </div>
                <div class="gap"></div>              
            </div>
        </div>
</body>
</html>