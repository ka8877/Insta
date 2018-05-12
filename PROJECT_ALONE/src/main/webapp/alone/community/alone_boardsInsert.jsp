<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style>
#bold a:hover {
	cursor: pointer;
	text-decoration: underline;
}
</style>
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="#">커뮤니티</a></li>
			<li><a href="#">게시판</a></li>
			<li><a href="#">${vo.cateName }</a></li>
			<li class="active">전체: 게시글 모아보기</li>
		</ul>

 <div class="gap gap-small"></div>
		<div class="row">
			<div class="col-md-10">
				<!--  리스트 뿌리기 -->
				<form action="/boardsInsert.do" method="post" id="frm">
					<div class="col-md-9">
						<div class="form-group">
							<div><strong>게시판</strong>&nbsp;&nbsp;<select name="boaGubun" id="gubun">
								<option>-----------카테고리 선택-----------</option>
								<option value="2">월간 BEST</option>
								<option value="3">여행꿀팁</option>
								<option value="4">맛집추천</option>
								<option value="5">Q&A</option>
								<option value="6">자유 게시판</option>
							</select></div>
							<div class="gap gap-small"></div>
							<div><strong>타이틀</strong>&nbsp;&nbsp;<input type="email" placeholder=" 제목을 입력하세요." name="boaTitle" size="64" maxlength="62" /></div>
						</div>
					</div>
					<div class="gap gap-small"></div>
					<textarea name="smarteditor" id="smarteditor" rows="1" cols="1"
						style="width: 100%; height: 550px; display: none;"></textarea>
					저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시글은 이용약관 및 관련법률에 의해 제재를 받으실 수
					있습니다.
					<div class="gap gap-small"></div>
					<div class="col-md-12" align="center">
						<input class="btn btn-ghost btn-primary" type="button"
							id="savebutton" value="글쓰기" style="text-align: right;" />
					</div>
					<input type="hidden" value="${catePk }" name="catePk">
				</form>
				<!-- 리스트뿌리기 끝 -->

			</div>
		</div>
		<div class="gap"></div>
	</div>

	<script type="text/javascript">
		$(function() {
			//전역변수선언
			var editor_object = [];

			nhn.husky.EZCreator.createInIFrame({
				oAppRef : editor_object,
				elPlaceHolder : "smarteditor",
				sSkinURI : "/resources/editor/SmartEditor2Skin.html",
				htParams : {
					// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseToolbar : true,
					// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseVerticalResizer : true,
					// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
					bUseModeChanger : true,
				}
			});

			//전송버튼 클릭이벤트
			$("#savebutton").click(
					function() {
						//id가 smarteditor인 textarea에 에디터에서 대입
						editor_object.getById["smarteditor"].exec(
								"UPDATE_CONTENTS_FIELD", []);

						// 이부분에 에디터 validation 검증
							value = $("#gubun").val(); 
						if(value=='-----------카테고리 선택-----------'){
			    			alert('카테고리를 선택하세요.');
			    			return;
			    		}
						//폼 submit
						$("#frm").submit();
					})
		})
	</script>

</body>
</html>