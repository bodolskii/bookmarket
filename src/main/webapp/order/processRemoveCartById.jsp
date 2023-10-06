<%@ page import="dao.BookRepository" %>
<%@ page import="dto.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Cart" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-09-12
  Time: 오후 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    String bookId = request.getParameter("bookId");
    if(bookId == null || bookId.trim().equals("")) {
        response.sendRedirect("../books.jsp");
        return;
    }
    //유효성검사Id
    BookRepository bookRepository = BookRepository.getInstance();
    Book book = bookRepository.getBookById(bookId);
    if(book == null) {
        response.sendRedirect("../webapp/exception/exceptionNoBook.jsp");
    }
    //세션에서 장바구니목록 가져옴
    ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");
    for(int i = 0; i < carts.size(); i++) {
        Cart cart = carts.get(i);
        if(cart.getBookId().equals(bookId)) {
            carts.remove(cart);
            break;
        }
    }
    response.sendRedirect("./cart.jsp");
%>
</body>
</html>
