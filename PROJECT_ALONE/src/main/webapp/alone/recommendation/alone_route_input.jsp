<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Don't come</title>

<script>
function dollar4(){
	if(insertR.rouName.value==""){
		alert("일정 이름은 입력하세요.");
		return;
	} else if(insertR.rouDetail.value==""){
		alert("간단한 설명 정도는 달아주세요.");
		return;
	} else if(confirm("이대로 입력할까요?")){
		alert("입력하느라 수고하셨습니다.");
		insertR.submit();
	}
}
</script>

</head>
<body>
<h1 class="page-title">입력된 일정/새 일정</h1>
	<div style="text-align:right;margin: 10px 50px 10px 50px">
		<input class="btn btn-info btn-lg" type='button' value='관광지 추가하기' onclick = 'location.href="/spot_input.do"'>
	</div>
<hr><h3>내용 있는 일정</h3>
<table border=1 id=noListTable width=100%>
	<tr align='center' style="font-weight:bold;font-size:18px">
		<td>일정번호</td>
		<td>일정이름</td>
		<td>등록일자</td>
		<td>이미지</td>
		<td>상세정보</td>
		<td>GO TO</td>
	</tr>
	<c:forEach items="${list2}" var="ls2">
	<tr>
		<td align='center'>${ls2.rouPk}</td>
		<td>&emsp;${ls2.rouName}</td>
		<td>${ls2.rouRegdate}</td>
		<td><a href="${ls2.rouImg}">${ls2.rouImg}</a></td>
		<td>${ls2.rouDetail}</td>
		<td align='center'>
		<form id=deleteR action="/route_delete.do" method="post">
		<input type='button' value='이동' onClick='location.href ="/rec_detail.do?rouPk=${ls2.rouPk}"'>
		<input type='hidden' value='${ls2.rouPk}' name='rouPk'>
		<input type='submit' value='삭제'>
		</form>
		</td>
	</tr>
	</c:forEach>
</table>
<br>
<hr><h3>내용 없는 일정</h3>

<table border=1 id=noListTable width=100%>
	<tr align='center' style="font-weight:bold;font-size:18px">
		<td>일정번호</td>
		<td>일정이름</td>
		<td>등록일자</td>
		<td>이미지</td>
		<td>상세정보</td>
		<td>GO TO</td>
	</tr>
	<c:forEach items="${list}" var="ls">
	<tr>
		<td align='center'>${ls.rouPk}</td>
		<td>&emsp;${ls.rouName}</td>
		<td>${ls.rouRegdate}</td>
		<td><a href="${ls.rouImg}">${ls.rouImg}</a></td>
		<td>${ls.rouDetail}</td>
		<td align='center'>
		<form id=deleteR action="/route_delete.do" method="post">
			<input type='button' value='입력' onClick='location.href ="/route_detail_input.do?rouPk=${ls.rouPk}"'>
			<input type='hidden' value='${ls.rouPk}' name='rouPk'>
			<input type='submit' value='삭제'>
		</form>
		</td>
		
	</tr>
	</c:forEach>
</table>

<br>
<hr><h3>새 일정 입력하기</h3>
<form id=insertR action="/route_insert.do" enctype="multipart/form-data" method="post">
<table border=1 id=noListInsert width=100%>
	<tr align='center' style="font-weight:bold;font-size:18px">
		<td>일정번호</td>
		<td>일정이름</td>
		<td>등록일자</td>
		<td>이미지</td>
		<td>상세정보</td>
	</tr>
	<tr>
		<td>auto:blank</td>
		<td><input type='text' name='rouName' size='45'></td>
		<td>auto:blank</td>
		<td><input type='file' name='ufile'></td>
		<td><input type='text' name='rouDetail' size='50'></td>
	</tr>
	<tr>
		<td colspan=5  align='center'><input type='button' value='입력' onClick='dollar4()'></td>
	</tr>
</table>
</form>

</body>
</html>