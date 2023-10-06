<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Cart" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String bookId = request.getParameter("bookId");

    if(bookId == null || bookId.trim().equals("")) {
        //null이거나 빈문자열이들어온 경우 name은있는데 value가 없는경우
        response.sendRedirect("../books.jsp");
        return;
    }

    //유효성 확인
    BookRepository bookRepository = BookRepository.getInstance();
    Book book = bookRepository.getBookById(bookId);
    if(book == null) {
        response.sendRedirect("../exceprion/exceprionNoBook.jsp");
    }
    //장바구니에 파라미터로 전달된 productId와 동일한 데이터가 있는경우에는
    //장바구니에 추가하지말고 갯구만 변경하도록 수정
    ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");
    if(carts == null) {//생성된 목록이 없는경우.목록 생성후 세션에 저장.
        carts = new ArrayList<Cart>();
        session.setAttribute("carts",carts);
    }
    boolean isAddCart = false;


    for(Cart i : carts) {
        if(i.getBookId().equals(bookId)) {
            i.setBookCnt(i.getBookCnt()+1);
            isAddCart = true;
            break;
        }
    }
    if(!isAddCart) {
        Cart cart = new Cart(bookId, 1);
        carts.add(cart);
    }

    response.sendRedirect("../Book/book.jsp?productId=" + bookId);
%>
</body>
</html>
