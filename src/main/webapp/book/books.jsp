<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
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
			<h1 class="display=3">상품목록</h1>
		</div>
	</div>
	<%
		BookRepository bookRepository = BookRepository.getInstance();
		ArrayList<Book> books = bookRepository.getAllBooks();
	%>
	
	<div class = "container">
		<div class="row">
			<%
				for(Book book : books) {
			%>
			<div class = "col-md-4">
				<img src="/upload/<%=book.getFileName()%>" style="width: 100%">
				<h3><%=book.getBookName() %></h3>
				<p><%=book.getAuthor() %></p>
				<p><%=book.getUnitPrice() %></p>
				<p><a href="book.jspbookId=<%=book.getBooktId()%>" class= "btn btn-secondary" role="button">
				상세정보</a></p>
			</div>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>