<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%--
	브라우저 =========== Controller ======== 해당 Model로 request전송 (request에 결과값을 추가)
	(사용자)  request               request                          |
	                                                              JSP로 전송
	                                                              setAttribute()
	                                                              => getAttribute() => ${}
	MVC(Model2) => 단점 (자바에 대해 어느정도 ㅏㄹ고있다 , 파일이 복잡하다)
	                          장점 (보안 , 재사용, 확장성 , 분산처리(여러명이 동시작업)
	JSP(Model1) => 단점 (보안=전체파일보내준다, 일회용(재사용이 불가능)) , 장점 (코딩하기가 간단하다:(자바/HTML))                                                              
    JSP에서 기술 면접 => Model1 과 Model2의 차이점
    				Get vs Post => 한글처리
    				Cookie Vs session
 --%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>