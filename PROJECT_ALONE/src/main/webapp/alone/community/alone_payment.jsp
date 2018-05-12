<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
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

</head>

<body>


        <div class="container">
            <h1 class="page-title">결제내역 확인</h1>
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
											<a href="/prodel3.do" style="text-decoration: none"> <center>현재 사진 삭제</center></a>
										</h4>
									</div>
										<form name = "inputForm" id="inputForm" action = "/proup3.do" method = "post" enctype="multipart/form-data">
									<div class="modal-header">
										<h4 class="modal-title">
											<a style="text-decoration: none" onclick="document.all.file.click()"> <center>사진 업로드</center></a>
											<input type="file" name="file" id="monProfile" style="display: none;"/>											
										</h4>
									</div>
											</form>
									<div class="modal-footer">
										<h4 class="modal-title" data-dismiss="modal">
											<a href="/payment.do" style="text-decoration: none"><center>취소</center></a>
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
                        <label>
                          <h4>  러브볼 충전내역</h4> </label> <p align="right"><a href="/payment2.do" class="btn btn-primary mb20" > 러브볼 사용내역 </a></p>                            
                    <table class="table table-bordered table-striped table-booking-history">           
                            <tr>
                                <th>이름</th>
                                <th>상품명</th>
                                <th>상품상세정보</th>
                                <th>상품가격</th>
                                <th>구매날짜</th>                          
                            </tr>
                   
                   			<c:forEach items="${pay}" var="v">  
                            <tr>
                             
                                <td>${v.monName}</td>
                                <td >${v.proName}</td>
                                <td>${v.proDetail}</td>
                                <td>${v.proPrice}</td>
                                <td>${v.payRegdate}</td>                 
                            </tr>                        
                      </c:forEach>
                    </table>
                         
		${paging}
                </div>
            </div>
        </div>


        <div class="gap"></div>
        
		
 
</body>

</html>


