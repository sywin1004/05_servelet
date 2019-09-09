<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(2) EL 에서 파라미터 다루기</title>
</head>
<body>
<!-- 
==================================================================================
	EL 은 기존 JSP 에서 scriptlet, expression 이 했던 일을 단순화하여 제공
	
	scriptlet 에서 했던 파라미터 추출을 단순하게 바꾸어 줌
	==============================================================================
 -->
<%
	// 이 페이지가 요청될 때, 주소 표시줄에 QUERY_STRING 으로 전달되는 파라미터를 scriptlet 에서 추출하는 방심
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String id = request.getParameter("id");
%>

이 페이지를 요청할 때 다음의 주소를 복사해서 요청합니다. <br />
http://localhost:8080/el/el2.jsp?name=홍길동 <br />
http://localhost:8080/el/el2.jsp?name=홍길동&address=율도국 <br />
http://localhost:8080/el/el2.jsp?name=홍길동&address=율도국&id=gildong2<br />
http://localhost:8080/el/el2.jsp?name=&address=&id=<br />

<h3>EL 의 파라미터 추출</h3>
<ol>
	<li>\${param.name} = ${param.name}</li>
	<li>\${param.address} = ${param.address}</li>
	<li>\${param.id} = ${param.id}</li>
</ol>
<hr />
<h3>expression Tag 의 파라미터 추출</h3>
<ol>
	<li>name=<%=name %></li>
	<li>address=<%=address %></li>
	<li>id=<%=id %></li>
</ol>

<!-- 
	empty 연산자
	==============================
	param.XXX 과 같이 파라미터의 존재여부 검사할 때
	파라미터의 키가 존재하지 않는 경우 empty 로 판단함
	파라미터의 키가 존재하지만 값이 없는 경우도 ept로 판닪마
 -->
<h3>EL 의 파라미터 존재 여부 검사</h3>
empty : EL 의 연산자
&bnsp;&bnsp;&bnsp;&bnsp; = &gt; 값의 존재여부를 검사하는 연산자, 값이 없을 때 true
<ol>
	<li>parameter 중 name 이라는 것이 존재하는가? <br /> \${not empty param.name} = ${not empty param.name}</li>
	<li>parameter 중 address 라는 것이 존재하는가? <br /> \${not empty param.address} = ${not empty param.address}</li>
	<li>parameter 중 id 라는 것이 존재하는가? <br /> \${not empty param.id} = ${not empty param.id}</li>
	<li>parameter 중 name 이라는 것이 없는가? <br /> \${empty param.name} = ${empty param.name}</li>
	<li>parameter 중 address 라는 것이 없는가? <br /> \${empty param.address} = ${empty param.address}</li>
	<li>parameter 중 id 라는 것이 없는가? <br /> \${empty param.id} = ${empty param.id}</li>
</ol>
</body>
</html>