<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<script src="js/pixlr.js"></script>
	<script src="js/jquery.js"></script>	
		<script>
	$(function(){
		$("#monProfile").click(function(){

			$("input:file").change(function() {
				var file = $(this).val();
				console.log(file);
				if(file != null ){
					
					
				   $("#inputForm").submit(); 
				} else {
					alert("파일을 선택하세요");
				}
				});			
		});
	});

</script>
<script>

function goPage(){
	var birthday = $('#monBirthday').val();
	var cell = $('#monTel').val();
	var regCell = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/; 
	var email = $('#monEmail').val();
	var regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/; 
	if(myForm.monEmail.value === ''){
		$('#monEmail').focus();
		alert("이메일을 입력하세요.")
		return false;
	 }else if(regEmail.test(myForm.monEmail.value) === false){
		$('#monEmail').focus();
		alert("올바른 이메일 형식을 입력하세요.");
		return false;
	 }else if(myForm.monTel.value == ""){
        alert("핸드폰 번호를 확인 해주세요.");
        $('#monTel').focus();
     } else if(regCell.test(myForm.monTel.value) != true){
        alert("핸드폰 번호를 확인 해주세요.");
        $('#monTel').focus();
     }else if(myForm.monSex.value==''){
            alert("성별을 선택해 주세요.");
     }else if(myForm.monBirth1.value==" "){
    	 alert("생년월일을 선택해주세요."); 
     }else if(myForm.monBirth2.value==" "){
    	 alert("생년월일을 선택해주세요.");
     }else if(myForm.monBirth3.value==" "){
    	 alert("생년월일을 선택해주세요.");	
     }else if (confirm("프로필을 수정하시겠습니까?")){
		document.getElementById("myForm").submit();
		alert("프로필 수정이 완료되었습니다.")
	}else{
		alert("프로필 수정이 취소되었습니다.")
	}
	
	
}
</script>



</head>
 <div class="container">
            <h1 class="page-title">프로필 편집</h1>
        </div>
	 <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <aside class="user-profile-sidebar">
                        <div class="user-profile-avatar text-center" >
                            <img src="/img/profile/${pro.monProfile}" alt="" title="AMaze" data-target="#my_picture_name" data-toggle="modal"/>
                            <div class="modal fade" id="my_picture_name">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header" div style="height: auto; width: 100%; border:1px solid orange;">
										<h4 class="modal-title">
											<span style="color:#A5A095" ><center>프로필 사진 바꾸기</center></span>
										</h4>
									</div>									
									<div class="modal-header">
										<h4 class="modal-title">
											<a href="/prodel.do" style="text-decoration: none"> <center>현재 사진 삭제</center></a>
										</h4>
									</div>
										<form name = "inputForm" id="inputForm" action = "/proup.do" method="post" enctype="multipart/form-data">
									<div class="modal-header">
										<h4 class="modal-title">
											<a style="text-decoration: none" onclick="document.all.file.click()"> <center>사진 업로드</center></a>
											<input type="file" name="file" id="monProfile" style="display: none;"/>											
										</h4>
									</div>
											</form>
									<div class="modal-footer">
										<h4 class="modal-title" data-dismiss="modal">
											<a href="/profile.do" style="text-decoration: none"><center>취소</center></a>
										</h4>
									</div>
								</div>
							</div>
						</div>
                            <h5>${detail.monName}</h5>
                            <p>${detail.monName}님 환영합니다!</p>
                        </div>
                        <ul class="list user-profile-nav">
                            <li><a href="/profile.do"><i class="fa fa-user"></i>프로필 편집</a>                
                            </li>
                            <li><a href="/gallery.do"><i class="fa fa-camera"></i>내 여행사진</a>
                            </li>     
                            <li><a href="/payment.do"><i class="fa fa-credit-card"></i>결제내역 확인</a>
                            </li>
                            <li><a href="/activate.do"><i class="fa fa-cog"></i>계정 비활성화</a>
                            </li>
                            <li><a href="javascript:pixlr.overlay.show({service:'express'});">
                            <i class="fa fa-camera"></i>사진 편집 기능</a>
                            </li>     
                            
                        </ul>
                    </aside>
                </div>
                <div class="col-md-9">
                           <form action="/update.do" method="post" id="myForm" >  
                    <div class="row">
                        <div class="col-md-5">
                               
                                <h4>회원 개인정보</h4> <p align="right"><label><img alt="러브볼.png" src="/img/profile/러브볼.png" style="width:20px;height:20px;">${detail.monLoveball}</label></p>
                                <div class="form-group form-group-icon-left"><i class="fa fa-user input-icon"></i>
                                    <label>이름</label>
                                    <input class="form-control" value="${detail.monName}" type="text" />
                                </div>
                                <div class="form-group form-group-icon-left"><i class="fa fa-envelope input-icon"></i>
                                    <label>이메일</label>
                                    <input class="form-control" value="${detail.monEmail}" type="text" name="monEmail"/>
                                </div>
                                <div class="form-group form-group-icon-left"><i class="fa fa-phone input-icon" ></i>
                                    <label>전화번호</label>
                                    <input class="form-control" value="${detail.monTel}" type="text" name="monTel" />
                                </div>
                              
                                <div class="gap gap-small"></div>
                                <div class="form-group form-group-icon-left">
                                    <label>생년월일 </label>
                                     <script language="javascript" name="monBirthday">
                                   
										var today = new Date(); 
										var toyear = parseInt(today.getYear()); 
										var start = 2018; 
										var end = 1920; 
										document.write("<font size=2><select name=monBirth1>"); 
										document.write("<option value='${year}' selected='selected'>${year}</option>"); 
										for (i=start;i>=end;i--) document.write("<option>"+i); 
										document.write("</select>년  "); 
									
										document.write("<select name=monBirth2>"); 
										document.write("<option value='${month}' selected='selected'>${month}</option>"); 
										for (i=1;i<=12;i++) document.write("<option>"+i); 
										document.write("</select>월  "); 
													
										document.write("<select name=monBirth3>"); 
										document.write("<option value='${day}' selected='selected'>${day}</option>"); 
										for (i=1;i<=31;i++) document.write("<option>"+i); 
										document.write("</select>일  </font>"); 											
										</script> 
                                </div>
                                <hr>   
             
                        </div>
                        <div class="col-md-4 col-md-offset-1">                        
                                <div class="form-group form-group-icon-left" >
                                    <br>
                                    <br>
                                    <label>성별</label>
                                    <input type="radio" value="m" name="monSex" <c:if test="${detail.monSex eq 'm'}">checked="checked"</c:if> />남자
									<input type="radio" value="f"  name="monSex" <c:if test="${detail.monSex eq 'f'}">checked="checked"</c:if> />여자
										<br>
                                    <br>
                                    
                                    <label>자기소개</label>
                                    <textarea  rows="6"  cols="40" width="100%" name="monIntro" >${detail.monIntro}</textarea>
                                </div>
                                <input class="btn btn-primary" type="button" value="프로필 수정" onclick="goPage()"  />
                        </div>
                    </div>
                            </form>

                </div>
            </div>
        </div>
	<div class="gap"></div>
	

</html>