<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(1) EL 의 산술연산자</title>
</head>
<body>
<h3>EL 의 산술연산자</h3>
<hr />

<pre>
	<ol>
		<li>EL 의 덧셈 : 10 + 55 = ${10 + 55}</li>
		<li>EL 의 뺄셈 : 10 - 55 = ${10 - 55}</li>
		<li>EL 의 곱셈 : 10 * 55 = ${10 * 55}</li>
		<li>EL 의 나눗셈 : 10 / 55 = ${10 / 55}</li>
		<li>EL 의 나머지 : 10 % 55 = ${10 % 55}</li>
	</ol>
<hr />
<h3>EL 의 관계 연산자</h3>
<hr />
<ol>
	<li>~보다 크다(&gt;) : 10 &gt; 55 = ${10 > 55}, ${10 gt 55}</li>
	<li>~ 보다 작다(&lt;) : 10 &lt; 55 = ${10 < 55}, ${10 lt 55}</li>
	<li>~보다 크거나 같다(&ge;) : 10 &ge; 55 = ${10 >= 55 }, ${10 ge 55}</li>
	<li>~보다 작거나 같다(&le;) : 10 &le; 55 = ${10 <= 55}, ${10 le 55}</li>
	<li>~와 같다(==) = 10 == 50 = ${10 == 55}, ${10 eq 55}</li> 
	<li>~와 같지 않다(!=) : 10 &ne; 55 = ${10 != 55}, ${10 ne 55}</li>
</ol>
<h3>EL 의 논리 연산자</h3>
<ol>
	<li>논리 AND : true && false = ${ture && false}, ${true and false}</li>
	<li>논리 OR : true || false = ${true || false}, ${true or false}</li>
	<li>논리 NOT : !true = ${! true}, ${not true}</li>
	<li>논리 NOT : !false = ${! false}, ${not false}</li>
</ol>
</pre>
</body>
</html>