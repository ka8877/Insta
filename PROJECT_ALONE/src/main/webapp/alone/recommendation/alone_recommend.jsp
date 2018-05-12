<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Did you come ALONE?</title>
</head>
<body>
        <div class="container">
            <h1 class="page-title">일정 추천</h1>
        </div>

        <div class="container">
            <div class="gap gap-small"></div>
	            <h4 class="mb20" style="text-align:right;line-height:2.1em">김태원씨가 추천하지는 않았지만 그럭저럭 나쁘지 않은 당일치기 여행 일정 추천<br>
	            </h4>
	            <hr>
            <div class="row row-wrap">
            
            <c:forEach items="${list}" var="ls">
                <div class="col-md-3">
                    <div class="thumb">
                        <a class="hover-img" href="/rec_detail.do?rouPk=${ls.rouPk}">
                            <img src="${ls.rouImg}" width="300" height="200" alt="이미지를 불러오지 못 했습니다." title="${ls.rouName}" />
                            <div class="hover-inner hover-inner-block hover-inner-bottom hover-inner-bg-black hover-hold">
                                <div class="text-small">
                                    <h5>${ls.rouName}</h5>
                                    <p>${ls.rouView} views</p>
                                    <p class="mb0">${ls.rouDetail}</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>        
            </c:forEach> 
                            
            </div>
	            <hr>
	            <p style="text-align:center;">
				<input class="btn btn-info btn-lg" type='button' value='일정 직접 만들기' onclick = 'location.href="/make_route.do"'>
				</p>
            <div class="gap"></div>
            <div class="gap gap-small"></div>
        </div>
</body>
</html>