<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(6) JSTL Format Tag : formatNumber, formatDate</title>
</head>
<body>
<!-- 사용할 값을 설정 -->
<c:set var="number" value="123456.789" scope="page"></c:set>
<c:set var="currency" value="2300000" scope="page"></c:set>

<%-- 
	<fmt:formatNumber>
	숫자 형식을 포맷팅 하여 출력하는 태그
	통화코드, 심볼을 표기
	숫자 패턴화 출력 : 세자리 숫자 끊어 읽기, 소숫점 이하 버림 등 
--%>
<h3>1. 숫자 형식 출력</h3>
${number} 값을 : 3자리 끊어 읽기 적용 <br />
<fmt:formatNumber value="${number}" type="number"></fmt:formatNumber> <br />
<fmt:formatNumber value="987654.321" type="number"></fmt:formatNumber> <br />
<br />

(2) ${number} 값 : 통화 형태로 읽기 적용
<fmt:formatNumber value="${number}" type="currency" currencyCode="KRW"></fmt:formatNumber> <br />
<fmt:formatNumber value="5000" type="currency" currencyCode="EUR"></fmt:formatNumber> <br />
<fmt:formatNumber value="3000" type="currency" currencyCode="USD"></fmt:formatNumber> <br />
<fmt:formatNumber value="3000" type="currency" currencySymbol="€"></fmt:formatNumber> <br />

<fmt:formatNumber value="3000" type="currency" currencyCode="USD" ></fmt:formatNumber> <br />
<fmt:formatNumber value="3000" type="currency" currencyCode="USD" currencySymbol="$"></fmt:formatNumber> <br />

<fmt:formatNumber value="2000" type="currency" currencyCode="JPY" ></fmt:formatNumber> <br />
<fmt:formatNumber value="2000" type="currency" currencySymbol="¥" ></fmt:formatNumber> <br />

<fmt:formatNumber value="1000" type="currency" currencySymbol="CHY" ></fmt:formatNumber> <br />
<fmt:formatNumber value="1000" type="currency" currencySymbol="¥" ></fmt:formatNumber> <br />

(3) ${number} 값 :소수점 읽기 패턴화 적용 <br />
<!-- type 이 number 이므로 숫자 세자리 끊어읽기 적용, 소수점 이하 2 자리 읽기 적용 -->
<fmt:formatNumber value="${number}" type="number" pattern=".00"></fmt:formatNumber> <br />
<fmt:formatNumber value="${number}" pattern="000,000.00"></fmt:formatNumber> <br />
<br />
<hr />
<h2>2. 날짜 형식 출력</h2>
<!-- 오늘의 날짜를 c:set 으로 생성 -->
<c:set var="today" value="<%= new Date() %>" scope="page"></c:set>

(1) 시간만 출력 <br />
<fmt:formatDate value="${today}" type="time"/> <br />
(2) 날짜만 출력 <br />
<fmt:formatDate value="${today}" type="date"/> <br />
(3) 시간 + 날짜 출력 <br />
<fmt:formatDate value="${today}" type="both"/> <br />

<hr />

<!--  
	1. 100만 ~ 500만 까지 100만 단위로 늘어나는 숫자를
	numbers 리스트에 저장, for 구문 사용할 것
	
	2. 리스트를 요청 객체에 추가 
	
	3. fmt: formatNumber 태그를 사용하여 numbers 리스트의 각 원소 값에 대해 세자리 끊어 읽기 적용 출력
	
	4. 3을 출력할 때, 각 100만 ~ 500 만 사이의 숫자 중
	3의 배수인 숫자를 판별하는 내용을 같이 출력할 것
	
	5. fmt:formatNumber 태그를 사용하여 numbers 리스트의 각 원소 값에 대해 통화코드 한국원화 적용 출력
-->
<% 
	List<Integer> numbers = new ArrayList<>();
	for (int idx = 1000000; idx <= 5000000; idx += 1000000) {
		numbers.add(idx);
	}
	request.setAttribute("numbers", numbers);
%>
<%-- <c:set var="numbers" value="${numbers}" scope="request"></c:set> --%>

<c:forEach var="number" items="${numbers}">
	<fmt:formatNumber value="${number}" type="number" />
	<c:if test="${number % 3 eq 0}">
				${number} 는 3의 배수입니다. <br />
	</c:if>
	
</c:forEach>
<c:forEach var="number" items="${numbers}">
	<fmt:formatNumber value="${number}" type="currency" currencyCode="KRW" /> <br />
</c:forEach>
</body> 
</html>