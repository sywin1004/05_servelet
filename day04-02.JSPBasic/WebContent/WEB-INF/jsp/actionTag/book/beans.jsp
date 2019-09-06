<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="book.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 정보 저장</title>
</head>
<body>
<%
	// 1. 요청 한글 처리
	request.setCharacterEncoding("utf-8");
	
	// 2. 요청 파라미터 추출하여 Book 객체로 포장
	Book book = new Book();
	// sequence
	book.setSequence(Integer.parseInt(request.getParameter("sequence")));
	// isbn
	book.setIsbn(request.getParameter("isbn"));
	// title
	book.setTitle(request.getParameter("title"));
	// author
	book.setAuthor(request.getParameter("author"));
	// company
	book.setCompany(request.getParameter("company"));
	// totalPage
	book.setTotalPage(Integer.parseInt(request.getParameter("totalPage")));
	// price
	book.setPrice(Integer.parseInt(request.getParameter("price")));
	// quantity
	book.setQuantity(Integer.parseInt(request.getParameter("quantity")));
%>
<h3>입력된 책 정보</h3>
<br />
<h4>스크립트릿에서 요청 파라미터를 직접 추출하여 조합된 객체 출력</h4>
<br />
<%-- 	<div>책 정보[일련번호:<%=book.getSequence() %>, ISBN:<%=book.getIsbn() %>, 제목:<%=book.getTitle() %>, 저자:<%=book.getAuthor() %>, 출판사:<%=book.getCompany() %>, 페이지:<%=book.getTotalPage() %>, 가격:<%=book.getPrice() %>, 재고:<%=book.getQuantity() %>]</div> --%>
<%=book %>

<hr />
<h4>&lt;jsp:useBean&gt; 액션태그로 조합된 객체 출력</h4>
<jsp:useBean id="littlePrince" class="book.vo.Book" scope="page"></jsp:useBean>
<%--
	//위의 useBean 액션태그 구문은 아래의 자바 코드와 완전히 동일한 작업을 하는 구문
	// id 속성 : 자바코드의 변수명
	// class 속성 : 인스턴스를 생성할 클래스명을 패키지 이름까지 명시하여 작성
	// scope 속성 : 이 페이지의 지역변수로 사용하는 경우 page, 요청객체에서 추출하려면 request 등으로 사용가능
	Book littlePrince = new Book();
 --%>
littlePrince 책 정보: <%=littlePrince %> <br />
<jsp:setProperty property="sequence" name="littlePrince" value="2" />
<jsp:setProperty property="isbn" name="littlePrince" value="9791159039690" />
<jsp:setProperty property="title" name="littlePrince" value="어린왕자(초판본)" />
<jsp:setProperty property="author" name="littlePrince" value="생텍쥐페리" />
<jsp:setProperty property="company" name="littlePrince" value="더스토리" />
<jsp:setProperty property="totalPage" name="littlePrince" value="150" />
<jsp:setProperty property="price" name="littlePrince" value="8820" />
<jsp:setProperty property="quantity" name="littlePrince" value="5" />
<%--
	<jsp:setProperty> 는 setter 메소드 호출과 동일한 용법
	property 속성 : 객체의 필드명(멤버변수 명)
	value 속성 : setter 메소드에 전달되는 매개변수가 된다.
	
	littlePrince.setAuthor("생택쥐페리");
	
	와 완전히 동일한 코드
 --%>
<h4>각 속성 값 설정 후 littlePrince</h4>
<%=littlePrince %>

</body>

</html>