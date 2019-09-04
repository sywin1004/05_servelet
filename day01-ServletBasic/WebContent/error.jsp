<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 카운트 증가 예제</title>
<script type="text/javascript">
	for (var i = 0; i < 5; i++) {
		document.write("안녕하세요, JavaScript" + i + "<br/>");
	}
</script>
</head>
<body>
<hr />
	<!-- HTML 주석 -->
	<%-- JSP 주석 --%>
	<%-- JSP : HTML 에 Java 코드가 삽입되는 형태 --%>
	
	<%  // 이 태그는 scriptlet : 스크립트 릿 태그라고 부른다.
		// 이 태그 안쪽에는 순수 자바코드가 들어간다.
		
		// for 반복문 시작 블록 괄호가 누락된 에러가 있는 코드
		for (int idx = 0; idx < 5; idx++) 			
	%>
			<h2>안녕하세요, JSP <%=idx %></h2>
	<% }%>	
	
	<% // <%= 이 태그는 expression : 익스프레션 태그라고 부른다.
	   // 이 태그 안쪽에서는 변수, 메소드 호출구문 등이 들어감
	   // 변수, 메소드 호출구문 사용 후 ; 을 쓰지 않음
	   String hello = "안녕하세요, JSP!";
	%>
	<br />
	<%= hello %>
</body>
</html>