<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 이 JSP 파일에서는 이후 JSTL 확장태그를 사용할 것이므로 
사용할 추가태그 선언이 반드시 필요합니다. --%>
<%-- Directive Tag 를 사용, taglib 지시어와 속성 prefix, uri 를 명시 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(1) JSTL : Core Tag : set, remove</title>
</head>
<body>
<%--
	<jsp:useBean>
	<jsp:param>
	<jsp:include>
	위와 같이 : 깆ㄴ 왼쪽에 prefix(접두사), 오른쪽에 실제 태그명을 조합하여 태그를 작성하는 방식은 
	XML 에서 온 엘리먼트 명 작성 기법
	이렇게 만들어진 태그의 형태를 qualified form tag 라고 부른다.
	
	<c:set> : setAttribute() 메소드와 같은 역할
			  page | request | session | application 범위 객체에
			  속성 값을 추가하는 기능
			  
	<c:remove> : removeAttribute() 메소드와 같은 역할
				 page | request | session | application 범위 객체에
			     속성 값을 제거하는 기능
	
 --%>
 <%
 	// 이 페이지 진입시 request 객체에 attribute 추가
 	request.setAttribute("name", "길동");
 
 %>
 <%-- <c:set> 으로 surname 속성 추가 --%>
<c:set var="surname" value="홍" scope="request"></c:set>
<%--
	위와 같은 스크립트릿 코드는
	request.setAttribute("surname","홍");
	이다
--%>

<%-- 3. name, surname 속성 추출 --%>
<h3>1. EL 로 추출</h3>
성 : \${requestScope.surname} = ${requestScope.surname} <br />
이름 : \${name} = ${name}
<hr />
<h3>2. expression Tag 추출</h3>
<%=request.getAttribute("name") %>
<%=request.getAttribute("surname") %>
<hr noshade="noshade" />

<%-- 4. <c:remove>, removeAttribute() 메소드로 속성 제거 --%>
<c:remove var="surname" scope="request"/>
<% request.removeAttribute("name"); %>
<%-- 5. 제거된 속성에 접근 시도 --%>
<h3>삭제 후 surname, name 추출</h3>
${surname} <br />
${name} <br />
<hr />
</body>
</html>