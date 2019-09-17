<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(2) JSTL Core Tag : if</title>
</head>
<body>

<%--
	<c:if>
	================================================================ 
	if 구문과 같이 논리 결과에 따라 선택을 분기하는 기능
	test 속성 값에 true/false 인지에 따라 분기
	test 속성 값에 EL 을 사용할 수 있다.
	else 구문은 없다
--%>
<h3>&lt;c:if&gt; 태그</h3>
<br />
<%-- 1. request 에 name 속성을 <c:set> 으로 추가 --%>
<c:set var="name" value="홍길동" scope="request"></c:set>

<%-- 2. <c:if> 로 name 속성 값이 존재하는지 여부를 기준으로 분기 --%>
<h4>EL 과 c:if 의 test 속성을 조합</h4>
<hr />
<h4>EL 과</h4>
<c:if test="${not empty requestScope.name}">
	${name} <br />
</c:if>
<c:if test="${empty requestScope.name}">
	request 에 name attribute 가 없습니다. <br />
</c:if>
<hr />	
<%-- 3. <c:if test="not empty ... "><c:if test="empty .."
		와 동일한 스크립트릿 코드 작성
 --%>
<%
	if (request.getAttribute("name") != null) {
%>		
		<%=request.getAttribute("name") %> <br />
<%
	} else {
%>
		request 에 name attribute 가 없습니다. <br />
<%  
	} 
%>

<%-- 4. name 이라는 이름의 값이 '길동' 과 같은지 여부 기준으로 분기 --%>
<h4>name 이라는 속성의 값이 '길동' 과 같은지 검사</h4>
<c:if test="${requestScope.name eq '길동'}">
	이름이 ${name} 입니다. <br />
</c:if>
<c:if test="${requestScope.name ne '길동'}">
	이름이 '길동' 이 아닙니다. <br />
</c:if>
<hr />
<%-- 5. parameter 로 id 라는 값을 붙여서 요청 --%>
<ul>
	<li>http://localhost:8080/jstl/jstl2-if.jsp?id=gildong</li>
	<li>http://localhost:8080/jstl/jstl2-if.jsp?id=</li>
	<li>http://localhost:8080/jstl/jstl2-if.jsp?</li>
</ul>
<%-- 6. id 라는 값이 파라미터에 존재하는가? --%>
<h4>id 라는 값이 파라미터에 존재하는가?</h4>
\${not empty param.id}"
<c:if test="${not empty param.id}">
	파라미터에 id 라는 값이 존재합니다. <br />
</c:if>
<c:if test="${empty param.id}">
	파라미터에 id 라는 값이 존재하지 않습니다. <br />
</c:if>
<hr />

<%-- 7. id 가 파라미터에 존재할 때, 값이 gildong 인가? --%>
<h4>id 값이 길동 인가?</h4>
\${param.id eq '길동'}
<c:if test="${param.id eq 'gildong'}">
	파라미터 id 의 값은 ${param.id} 입니다 <br />
</c:if>
<c:if test="${param.id ne 'gildong'}">
	파라미터 id 의 값은 'gildong' 이 아닙니다. <br />
</c:if>

<%-- 8. 여러 파라미터 전송 : id, size, hobby --%>
<h4>다음의 파라미터를 주소 뒤에 붙여 요청합니다.</h4>
<ul>
	<li>?id=gildong&size=L&hobby=magic</li>
	<li>?id=&size=&hobby=</li>
	<li>?size=M</li>
	<li>?size=M&hobby=soccer</li>
</ul>
<h4>주분받기</h4>
안녕하세요,
<c:if test="${not empty param.id}">
	${param.id} 님.
</c:if>
<c:if test="${empty param.id}">
	무명 님.
</c:if>
<br />

	선택한 옷의 사이즈는 :
<c:if test="${not empty param.size}">
	<c:if test="${param.size eq 'L'}">
		라지입니다.
	</c:if>
	<c:if test="${param.size eq 'M'}">
		미디움입니다.
	</c:if>
	<c:if test="${param.size eq 'S'}">
		스몰입니다.
	</c:if>
</c:if>
<c:if test="${empty param.size}">
	사이즈가 입력되지 않았습니다.
</c:if>
<br />
	당신의 취미는 :
<c:if test="${not empty param.hobby}">
	${param.hobby} 입니다.
</c:if>
<c:if test="${empty param.hobby}">
	없네요
</c:if>

<%-- 9. 4, 6, 7, 8 번 동일 작업 스크립트릿으로 변경 --%>
<h4> 9. 4, 6, 7, 8 번 동일 작업 스크립트릿으로 변경</h4>
<br />
<h4>4번</h4>
<%		
	if (request.getParameter("id") == "gildong") {
%>
		이름이 <$=request.getParameter("id") $> 입니다. <br />

<%		
	} else {
%>
		이름이 '길동' 이 아닙니다. <br />
<%  	
	}
%>
<hr />
<h4>6번</h4>
<%
	if (request.getParameter("id") != null) {
%>
		파라미터에 id 라는 값이 존재합니다. <br />
<%
	} else {
%>
	파라미터에 id 라는 값이 존재하지 않습니다. <br />
<%
	}
%>
<hr />
<h4>7번</h4>
<%
	if (request.getParameter("id") != null) {
		if (request.getParameter("id").equals("gildong")) {
%>
			파라미터 id 의 값은 <%=request.getParameter("id") %> 입니다. <br />
<%
		}
%>
<%
	} else {
%>			
		파라미터 id 의 값은 'gildong' 이 아닙니다. <br />
<%		
	}
%>
<hr />
<h4>8번 주문받기</h4>
안녕하세요,
<%
	if (request.getParameter("name") != null) {
%>
	<%=request.getParameter("name") %> 님	
<% 
	} else {
%>	
	무명 님
<%
	}
%>
<br />
선택한 옷의 사이즈는 : 
<%
	if (request.getParameter("size") != null) {
		if ("L".equals(request.getParameter("size"))) {
%>			
			라지입니다.
<%
		} else if ("M".equals(request.getParameter("size"))) {
%>			
			미디움입니다.
<%
		} else if ("S".equals(request.getParameter("size"))) {
%>
			스몰입니다.
<%
		} else {
%>		
			사이즈가 입력되지 않았습니다.
<%
		}			
	}
%>
<%-- <%
	if (request.getParameter("size") != null) {
		if (request.getParameter("size").equals("L")) {
%>			
			라지입니다.
<%
		} else if (request.getParameter("size").equals("M")) {
%>			
			미디움입니다.
<%
		} else if (request.getParameter("size").equals("S")) {
%>
			스몰입니다.
<%
		} else {
%>		
			사이즈가 입력되지 않았습니다.
<%
		}			
	}
%> --%>
<br />
당신의 취미는 :
<%
	if (request.getParameter("hobby") != null) {
%>
	<%=request.getParameter("hobby") %> 입니다.
<%
	} else {
%>
	없네요
<%
	}
%>		

</body>
</html>