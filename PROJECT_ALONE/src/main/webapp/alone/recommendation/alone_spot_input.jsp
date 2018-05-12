<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>hotspot input form</title>

<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAH12tWJRl_6JyAnWqtt-yACdhnDxWrmyM"></script>
<script>
function geoUnit() {
	if(spotInsert.hotName.value==""){
		alert('입력값이 없습니다만?');
	} else {
		var faddr = spotInsert.hotName.value;
		var geocoder;
		geocoder = new google.maps.Geocoder();
		geocoder.geocode( { 'address': faddr}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				var addr = results[0].formatted_address;
				var pid = results[0].place_id;
				if (confirm('<검색 성공>\n결과 주소 : ' + addr+"\n이대로 입력할까요?")){ 
					spotInsert.hotAddr.value = addr;
					spotInsert.hotPlaceId.value = pid;
					alert('주소지를 입력했습니다');
					} else { 
					return;
					}
			} else {
				alert('<검색 실패>\n검색어를 다시 확인해주세요.');
			}		
			return;
		});
	}
}

function geoTude() {
	if(spotInsert.hotAddr.value==""){
		alert('입력값이 없습니다만?');
	} else {
		var faddr = spotInsert.hotAddr.value;
		var geocoder;
		geocoder = new google.maps.Geocoder();
		geocoder.geocode( { 'address': faddr}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				var faddr_lat = results[0].geometry.location.lat();	//위도
				var faddr_lng = results[0].geometry.location.lng();	//경도
				var pid = results[0].place_id;
				if (confirm('<검색 성공>\n결과 위도 : ' + faddr_lat + '\n경도 : ' + faddr_lng +"\n이대로 입력할까요?")){ 
					spotInsert.hotLat.value = faddr_lat;
					spotInsert.hotLng.value = faddr_lng;
					spotInsert.hotPlaceId.value = pid;
					alert('위도, 경도를 입력했습니다.');
					} else { 
					return;
					}
			} else {
				alert('<검색 실패>\n검색어를 다시 확인해주세요.');
			}		
			return;
		});
	}
}

function geoTrap(){
	if(spotInsert.hotLat.value==""||spotInsert.hotLng.value==""){
		alert('입력값이 하나라도 비어있으면 안됩니다.');
	} else {
		var lat = spotInsert.hotLat.value;
		var lng = spotInsert.hotLng.value;
		var latlngc = lat+","+lng;
		var latlngStr = latlngc.split(',', 2);
		var latlng = {lat: parseFloat(latlngStr[0]), lng: parseFloat(latlngStr[1])};
		var geocoder;
		geocoder = new google.maps.Geocoder();
		geocoder.geocode( { 'location': latlng}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				var addr = results[0].formatted_address;
				var pid = results[0].place_id;
				if (confirm('<검색 성공>\n결과 주소 : ' + addr+"\n이대로 입력할까요?")){ 
					spotInsert.hotAddr.value = addr;
					spotInsert.hotPlaceId.value = pid;
					alert('주소지를 입력했습니다');
					} else { 
					return;
					}
			} else {
				alert('<검색 실패>\n검색값을 다시 확인해주세요.');
			}		
			return;
		});

	}
}

function dollar4(){
	if(spotInsert.hotCateSeq.value==""){
		alert("카테고리는 선택하세요.");
		return;
	} else if(spotInsert.hotName.value==""){
		alert("관광지 이름은 입력하세요.");
		return;
	} else if(spotInsert.hotAddr.value==""){
		alert("주소지는 입력하세요.");
		return;
	} else if(spotInsert.hotLat.value==""||spotInsert.hotLng.value==""){
		alert("위경도는 입력하세요.");
		return;
	} else if(spotInsert.hotCity.value==""){
		alert("도시 분류는 입력하세요");
	} else {
		alert("입력하느라 수고하셨습니다.");
		spotInsert.submit();
	}
}

</script>

</head>
<body>
<h1 class="page-title">새 관광지 입력하기</h1>
<div style="text-align:right;margin: 10px 50px 10px 50px">
	<input class="btn btn-info btn-lg" type='button' value='일정 입력으로 돌아가기' onclick = 'location.href="/route_input.do"'>
</div>
<hr>
<form id=spotInsert action="/spot_insert.do"  method="post">
	<table id=spotData border=1>
		<tr>
			<td align='center' style="font-weight:bold;font-size:18px">분류</td>
			<td align='center' style="font-weight:bold;font-size:18px">내용</td>
		</tr>
		<tr>
			<td align='center'>카테고리</td>
			<td>
				<select name='hotCateSeq'>
					<option value=""></option>
					<option value="1">관광</option>
					<option value="2">쇼핑</option>
					<option value="3">음식</option>
				</select>		
			</td>
		</tr>
		<tr>
			<td align='center'>관광지 이름</td>
			<td><input type='text' name='hotName' size='40'></td>
			<td><input type='button' value='이름으로 주소지 검색' onClick='geoUnit()'></td>		
		</tr>
		<tr>
			<td align='center'>관광지 설명</td>
			<td><input type='text' name='hotDetail' size='40'></td>
		</tr>
		<tr>
			<td align='center'>관광지 주소</td>
			<td><input type='text' name='hotAddr' size='40'></td>
			<td><input type='button' value='주소지로 위경도 검색' onClick='geoTude()'></td>
		</tr>
		<tr>
			<td align='center'>개장/폐장시간</td>
			<td><input type='text' name='hotOpen' size='40'></td>
		</tr>
		<tr>
			<td align='center'>문의/연락처</td>
			<td><input type='text' name='hotTel' size='40'></td>
		</tr>
		<tr>
			<td align='center'>위도</td>
			<td><input type='text' name='hotLat' size='40'></td>
		</tr>
		<tr>
			<td align='center'>경도</td>
			<td><input type='text' name='hotLng' size='40'></td>
			<td><input type='button' value='위경도로 주소지 검색' onClick='geoTrap()'></td>
		</tr>
		<tr>
			<td align='center'>도시 분류</td>
			<td><input type='text' name='hotCity' size='40'></td>
		</tr>
		<tr>
			<td align='center'>PlaceID</td>
			<td><input type='text' size='40' name='hotPlaceId'></td>
			<td align='center'>↑↑↑검색시 자동입력</td>
		</tr>
		<tr>
			<td colspan=2 align='center'>
			<input type='button' value='입력' onClick='dollar4()'>
			</td>
		</tr>
	</table>
</form>
<h4>※  지오코딩(위도경도↔주소 변환)은 근사값을 취하므로 정확하지 않거나 변동될 수 있습니다.</h4>

</body>
</html>