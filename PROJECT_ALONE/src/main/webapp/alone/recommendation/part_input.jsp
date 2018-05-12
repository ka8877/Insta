<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>hotspot input form</title>
</head>
<body>

<form id=spot>
	<table id=spotData border=1>
		<tr>
			<th>분류</th>
			<th>내용</th>
		</tr>
		<tr>
			<td align='center'>카테고리</td>
			<td>
				<select id='hotCateSeq'>
				  <option value="1">관광</option>
				  <option value="2">쇼핑</option>
				  <option value="3">음식</option>
				</select>		
			</td>
		</tr>
		<tr>
			<td align='center'>관광지 이름</td>
			<td><input type='text' id='hotName'></td>
			<td><input type='button' value='이름으로 주소지 검색' onClick=''></td>		
		</tr>
		<tr>
			<td align='center'>관광지 설명</td>
			<td><input type='text' id='hotDetail'></td>
		</tr>
		<tr>
			<td align='center'>관광지 주소</td>
			<td><input type='text' id='hotAddr'></td>
			<td><input type='button' value='주소지로 위경도 검색' onClick=''></td>
		</tr>
		<tr>
			<td align='center'>개장/폐장시간</td>
			<td><input type='text' id='hotOpen'></td>
		</tr>
		<tr>
			<td align='center'>문의/연락처</td>
			<td><input type='text' id='hotTel'></td>
		</tr>
		<tr>
			<td align='center'>위도</td>
			<td><input type='text' id='hotLat'></td>
		</tr>
		<tr>
			<td align='center'>경도</td>
			<td><input type='text' id='hotLng'></td>
		</tr>
		<tr>
			<td align='center'>도시 분류</td>
			<td><input type='text' id='hotCity'></td>
		</tr>
		<tr>
			<td colspan=2 align='center'>
			<input type='submit' value='입력'>
			</td>
		</tr>
	</table>
</form>

</body>
</html>