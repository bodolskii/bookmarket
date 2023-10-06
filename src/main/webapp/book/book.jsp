<%@page import="dao.BookRepository"%>
<%@page import="dto.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bookDAO" class= "dao.BookRepository" scope="session"></jsp:useBean>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../inc/menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display=6">상품목록</h1>
		</div>
	</div>
	
	<%
		String bookId = request.getParameter("bookId");
		BookRepository productRepository = BookRepository.getInstance();
		Book book = productRepository.getBookById(bookId);


	
	%>
	<div class ="container">
		<div class="row">			
			<div class="col-md-6">
				<img src="/upload/<%=book.getFileName()%>" style="width: 100%">
				<h3><%=book.getBookName() %></h3>
				<p><%=book.getDescription() %></p>
				<p><strong>상품 코드</strong> : <span class="badge badge-danger">
					<%=book.getBooktId() %>
				</span></p>
				<p><strong>책이름</strong> <%=book.getBookName() %></p>
				<p><strong>분류</strong> <%=book.getCategory()%></p>
				<p><strong>재고 수</strong> <%=book.getUnitsInStock() %></p>
				<h4><%=book.getUnitPrice()%>원</h4>
				<p><a href ="books.jsp" class="btn btn-secondary">상품 목록</a></p>
			</div>			
		</div>
	</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>