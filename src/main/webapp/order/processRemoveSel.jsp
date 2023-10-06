<%@ page import="dao.BookRepository" %>
<%@ page import="dto.Book" %>
<%@ page import="dto.Cart" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-09-12
  Time: 오후 3:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%

    //세션에서 장바구니목록 가져옴
    ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");
    String[] checkedId = request.getParameterValues("checkedId");
    if(checkedId != null) {
        for (String s : checkedId) {
            for (int i = 0; i < carts.size(); i++) {
                Cart cart = carts.get(i);
                if(cart.getBookId().equals(s)) {
                    carts.remove(cart);
                    break;
                }
            }
        }
    }
    response.sendRedirect("./cart.jsp");
%>
</body>
</html>
