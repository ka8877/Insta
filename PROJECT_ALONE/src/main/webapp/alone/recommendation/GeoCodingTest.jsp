<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAH12tWJRl_6JyAnWqtt-yACdhnDxWrmyM"></script>
<script>	
function geoUnit() {
	if(putin.juso.value==""){
		alert('하지마!!!!!!!!!!!!!!!!!!');
	} else {
		var faddr = putin.juso.value;
		var geocoder;
		geocoder = new google.maps.Geocoder();
		geocoder.geocode( { 'address': faddr}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				var faddr_lat = results[0].geometry.location.lat();	//위도
				var faddr_lng = results[0].geometry.location.lng();	//경도
				alert('지오코딩 성공\n\n주소 : ' + faddr + '\n\n위도 : ' + faddr_lat + '\n\n경도 : ' + faddr_lng);
				console.log(faddr+"\nlat:"+faddr_lat+", lng:"+faddr_lng)
			} else {
				var faddr_lat = "";
				var faddr_lng = "";
				alert('지오코딩 실패\n\n주소 : ' + faddr + '\n\n위도 : ' + faddr_lat + '\n\n경도 : ' + faddr_lng);
			}		
			return;
		});
	}
}

function geoTrap(){
	if(putout.lat.value==""||putout.lng.value==""){
		alert('하지말라고!!!!!!!!!!!!!!!!!!');
	} else {
		var lat = putout.lat.value;
		var lng = putout.lng.value;
		var latlngc = lat+","+lng;
		var latlngStr = latlngc.split(',', 2);
		var latlng = {lat: parseFloat(latlngStr[0]), lng: parseFloat(latlngStr[1])};
		var geocoder;
		geocoder = new google.maps.Geocoder();
		geocoder.geocode( { 'location': latlng}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				var faddr = results[0].formatted_address;
				alert('역지오코딩 성공\n\n위도 : ' + lat + '\n\n경도 : ' + lng + '\n\n주소 : ' + faddr);
				console.log(faddr);
			} else {
				var faddr = "epic fail";
				alert('역지오코딩 실패\n\n위도 : ' + lat + '\n\n경도 : ' + lng + '\n\n주소 : ' +  faddr);
			}			
			return;
		});

	}
}

function geoJoid(){
	alert('사실 딱히 뭐 굳이 꼭 살릴 필요까지는 없고...');
}
</script>

<title>Now Tes2</title>
</head>
<body>

<!-- 주요거점 메모

	서울 정중앙 init map 용도, N 서울타워
	lat:37.5511694, lng:126.98822659999996
	
	부산 정중앙 init map 용도, 여기가 어디냐?
	대한민국 부산광역시 부산진구 부암3동 548-12
	lat:35.1709965, lng:129.03595029999997
	
	한라산은 제주도의 중심입니까?
	대한민국 제주특별자치도 제주시 오등동 산182
	lat:33.3616666, lng:126.52916660000005
	
	서울시청
	lat:37.5657037, lng:126.9768616
	
	경복궁
	lat:37.579617, lng:126.97704099999999
	
	서울시 금천구 가산동 426-5
	lat:37.4787503, lng:126.87865250000004 
	
	
	암사동 선사 주거지
	lat:37.5604879, lng:127.13015619999999
	
	봉은사
	lat:37.514852, lng:127.0573766
	
	영등포구 여의동 85-7, 유람선 타는데!
	lat:37.5258312, lng:126.93720719999999
	
	한강 공원
	lat:37.5194476, lng:127.00988480000001
	
	예술의 전당
	lat:37.4786896, lng:127.01182410000001
	
	세빛섬
	lat:37.5116807, lng:126.99471940000001
	
	풋싼 해운대
	lat:35.1631139, lng:129.16355090000002
	
	-->
		
	<input type="button" value="살려야한다" onClick="geoJoid()"><br><br>
	
	<form name='putin'>
		不生不殺<br>
		<input type="text" name="juso">
		<input type='button' value='주소 -> 좌표' onClick="geoUnit()">
	</form><br>
	
	<form name='putout'>
		<table border=1>
			<tr>
			<td colspan=2 align=center>
			断罪炎刀
			</td>
			</tr>
			<tr>
				<td>latitude</td>
				<td><input type="text" name="lat"></td>
			</tr>
			<tr>
				<td>longitude</td>
				<td><input type="text" name="lng"></td>
			</tr>
			<tr>
				<td colspan=2 align=center>
				<input type='button' value='좌표 -> 주소' onClick="geoTrap()">
				</td>
			</tr>
		</table>
	</form><br>
	크롬이면 f12 눌러라. 콘솔 봐야지.<br>

</body>
</html>