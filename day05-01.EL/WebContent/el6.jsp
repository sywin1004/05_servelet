<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="book.vo.Book"
		 import="book.factory.BookFactory"
		 import="java.util.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 내장객체, 맵, 사용자 정의 타입 빈즈 객체</title>
</head>
<body>
<%

	Book vegetarian = 
	BookFactory.buildBook(1, "9788936433598", "채식주의자"
		  , "한강", "창비", 247, 10800, 10);
	
	Book littlePrince = 
	BookFactory.buildBook(2, "9791159039690", "어린왕자(초판본)"
		  , "생텍쥐페리", "더스토리", 150, 8820, 5);
	
	Book noDaap = 
	BookFactory.buildBook(3, "9791190182645", "제 인생에 답이 없어요"
		  , "선바", "위즈덤하우스", 192, 10800, 3);
	
	Book dduk = 
	BookFactory.buildBook(4, "9791196394509", "죽고 싶지만 떡볶이는 먹고 싶어"
		  , "백세희", "흔", 208, 12420, 2); 
	
	Book ax = 
	BookFactory.buildBook(5, "9788956055466", "책은 도끼다"
		  , "박웅현", "북하우스", 348, 14400, 2);
	
	// 사용자 정의 타입 객체를 각각 request 에 속성(atrribute)으로 추가
	// attribute 명은 변수명으로 추가한다
	request.setAttribute("vegetarian", vegetarian);
	request.setAttribute("littlePrince", littlePrince);
	request.setAttribute("noDaap", noDaap);
	request.setAttribute("dduk", dduk);
	request.setAttribute("ax", ax);
	
	// 맵 객체 생성 각 책이 등록될 맵 객체 생성
	// 맵 변수명 : books
	// TODO : books 맵 생성
	Map<String, Book> books = new HashMap<>();
	// TODO : 생성된 books 맵에 다섯개의 책 객체를 추가 이때 맵의 키는 책의 일련번호 (sequence 값) 로 할 것
	books.put(String.valueOf(vegetarian.getSequence()), vegetarian);
	books.put(String.valueOf(littlePrince.getSequence()), littlePrince);
	books.put(String.valueOf(noDaap.getSequence()), noDaap);
	books.put(String.valueOf(dduk.getSequence()), dduk);
	books.put(String.valueOf(ax.getSequence()), ax);
	
	// TODO : books 맵을 books 라는 이름으로 request 에 속성으로 추가
	request.setAttribute("books", books);	
%>
<h3>EL 로 사용자 정의 객체(빈즈) 값 추출</h3>
<pre>
빈즈객체의 경우
1. .(도트) 연산자로 값을 추출
	(1) Book 객체 중 ax 라는 이름으로 request에 추가된 객체가 있다면
	(2) ==> 내장객체이름.추가된속성명.필드명 으로 값을 추출
	(3) \${requestScope.ax.sequence} 등으로 접근하여 값을 추출
	
2. [](브래킷) 연산자로 값을 추출
	(1) books 라는 이름의 맵 객체가 request에 추가되었다면
	(2) ==> 내장객체이름["추가된속성명"].필드명 으로 값을 추출
	(3) \${requestScope["ax"].title} 등으로 접근하여 값을 추출

맵 객체의 경우
1. .(도트) 연산자로 값을 추출
	(1) books 맵 객체가 books 라는 이름으로 request 에 추가되었다면
	(2) ==> 내장객체이름.맵객체가추가된속성이름.맵의키값 으로 맵의 밸류를 추출	
	(3) \${requestScope.books.b001.sequence}
	(4) 도트연산자 사용으로 접근시 주의 점
		==> 맵의 키가 숫자로 된 값인 경우 도트 연산자로 접근 불가
		이런 경우는 브래킷 연산자만 사용 가능

2. [](브래킷) 연산자로 값을 추출
	(1) books 맵 객체가 books 라는 이름으로 request 에 추가되었다면
	(2) ==> 내장객체이름.맵객체가추가된속성이름["맵의키값"].필드명으로 맵 객체의 밸류를 추출
	(3) \${requestScope.books["b001"].title}
	
3. 맵, 리스트 등의 컬렉션이 속성으로 추가된 경우 주의 점
	(1) 맵, 리스트 자체가 1개의 속성으로 추가되었음을 주의
	(2) 추가된 속성을 추출할 때는 맵, 리스트 등의 컬렉션 객체 1개를 추출해야 함을
	(3) 추출된 각 컬렉션 객체안에서 맵이라면 키값, 리스트라면 인덱스 값을 조합하여
	각 컬렉션에 들어있는 객체를 재 추출해야 함
	(4) 컬렉션에 추가된 객체가 사용자 정의 객체(빈즈) 타입의 인스턴스라면
	추출된 빈즈객체의 각 필드명으로 또 다시 .(도트) 연산자를 사용하여 접근해야함		
</pre>
<table>
	<tr>
		<td>책 번호</th>
		<td>ISBN</th>
		<td>제목</th>
		<td>저자</th>
		<td>출판사</th>
		<td>페이지 수</th>
		<td>가격</th>
		<td>재고 수량</th>
	</tr>
	<tr><!-- 채식주의자 빈즈 객체로 추가된 것 EL 로 추출 -->
		<td>${requestScope.vegetarian.sequence}</td>
		<td>${requestScope.vegetarian.isbn}</td>
		<td>${requestScope.vegetarian.title}</td>
		<td>${requestScope.vegetarian.author}</td>
		<td>${requestScope.vegetarian.company}</td>
		<td>${requestScope.vegetarian.totalPage}</td>
		<td>${requestScope.vegetarian.price}</td>
		<td>${requestScope.vegetarian.quantity}</td>
	</tr>
	<tr><!-- 어린왕자 빈즈 객체로 추가된 것 EL 로 추출 -->
		<td>${littlePrince.sequence}</td>
		<td>${littlePrince.isbn}</td>
		<td>${littlePrince.title}</td>
		<td>${littlePrince.author}</td>
		<td>${littlePrince.company}</td>
		<td>${littlePrince.totalPage}</td>
		<td>${littlePrince.price}</td>
		<td>${littlePrince.quantity}</td>
	</tr>
	<tr><!-- 노답 빈즈 객체로 추가된 것 EL 로 추출 -->
		<td>${noDaap.sequence}</td>
		<td>${noDaap.isbn}</td>
		<td>${noDaap.title}</td>
		<td>${noDaap.author}</td>
		<td>${noDaap.company}</td>
		<td>${noDaap.totalPage}</td>
		<td>${noDaap.price}</td>
		<td>${noDaap.quantity}</td>
	</tr>
	<tr><!-- 떡볶이 빈즈 객체로 추가된 것 EL 로 추출 -->
		<td>${dduk.sequence}</td>
		<td>${dduk.isbn}</td>
		<td>${dduk.title}</td>
		<td>${dduk.author}</td>
		<td>${dduk.company}</td>
		<td>${dduk.totalPage}</td>
		<td>${dduk.price}</td>
		<td>${dduk.quantity}</td>
	</tr>
	<tr><!-- 도끼 빈즈 객체로 추가된 것 EL 로 추출 -->
		<td>${ax.sequence}</td>
		<td>${ax.isbn}</td>
		<td>${ax.title}</td>
		<td>${ax.author}</td>
		<td>${ax.company}</td>
		<td>${ax.totalPage}</td>
		<td>${ax.price}</td>
		<td>${ax.quantity}</td>
	</tr>
</table>
<hr />
<h3>EL 로 사용자 정의 객체(빈즈) 값 추출</h3>
<table>
	<tr>
		<td>책 번호</th>
		<td>ISBN</th>
		<td>제목</th>
		<td>저자</th>
		<td>출판사</th>
		<td>페이지 수</th>
		<td>가격</th>
		<td>재고 수량</th>
	</tr>
	<tr><!-- 채식주의자 맵 객체로 추가된 것 EL 로 추출 -->
		<td>${requestScope.books["1"].sequence}</td>
		<td>${requestScope.books["1"].isbn}</td>
		<td>${requestScope.books["1"].title}</td>
		<td>${requestScope.books["1"].author}</td>
		<td>${requestScope.books["1"].company}</td>
		<td>${requestScope.books["1"].totalPage}</td>
		<td>${requestScope.books["1"].price}</td>
		<td>${requestScope.books["1"].quantity}</td>
	</tr>
	<tr><!-- 어린왕자 맵 객체로 추가된 것 EL 로 추출 -->
		<td>${books["2"].sequence}</td>
		<td>${books["2"].isbn}</td>
		<td>${books["2"].title}</td>
		<td>${books["2"].author}</td>
		<td>${books["2"].company}</td>
		<td>${books["2"].totalPage}</td>
		<td>${books["2"].price}</td>
		<td>${books["2"].quantity}</td>
	</tr>
	<tr><!-- 노답 맵 객체로 추가된 것 EL 로 추출 -->
		<td>${books["3"].sequence}</td>
		<td>${books["3"].isbn}</td>
		<td>${books["3"].title}</td>
		<td>${books["3"].author}</td>
		<td>${books["3"].company}</td>
		<td>${books["3"].totalPage}</td>
		<td>${books["3"].price}</td>
		<td>${books["3"].quantity}</td>
	</tr>
	<tr><!-- 떡볶이 맵 객체로 추가된 것 EL 로 추출 -->
		<td>${books["4"].sequence}</td>
		<td>${books["4"].isbn}</td>
		<td>${books["4"].title}</td>
		<td>${books["4"].author}</td>
		<td>${books["4"].company}</td>
		<td>${books["4"].totalPage}</td>
		<td>${books["4"].price}</td>
		<td>${books["4"].quantity}</td>
	</tr>
	<tr><!-- 도끼 맵 객체로 추가된 것 EL 로 추출 -->
		<td>${books["5"].sequence}</td>
		<td>${books["5"].isbn}</td>
		<td>${books["5"].title}</td>
		<td>${books["5"].author}</td>
		<td>${books["5"].company}</td>
		<td>${books["5"].totalPage}</td>
		<td>${books["5"].price}</td>
		<td>${books["5"].quantity}</td>
	</tr>
</table>
<hr />
</body>
</html>