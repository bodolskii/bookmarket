
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Cart" %>
<%@ page import="dao.BookRepository" %>
<%@ page import="dto.Book" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-09-12
  Time: 오전 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="../inc/menu.jsp"></jsp:include>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<div class="jumbotron">
  <div class="container">
    <h1 class="display-3">장바구니</h1>
  </div>
</div>
<div class="container">
  <div class="row">
    <table width="100%">
      <tr>
        <td align="left">
          <a href="#" class="btn btn-danger btn-removeAll">비우기</a>
          <a href="#" class="btn btn-danger btn-removeSel">선택삭제</a>
          <a href="#" class="btn btn-success">주문</a>
        </td>
      </tr>
    </table>
  </div>
  <div style="padding-top: 50px">
    <form name="frmCart" method="post">
      <input type="hidden" name="productId">
      <table class="table table-hover">
        <tr>
          <td>선택</td>
          <td>사진</td>
          <td>상품</td>
          <td>가격</td>
          <td>수량</td>
          <td>소계</td>
          <td>비고</td>
        </tr>
        <%
          ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts"); // 세션에저장된목록들고오기,다운캐스팅
          if(carts == null) {
            carts = new ArrayList<Cart>();
            session.setAttribute("carts",carts);
          }

          BookRepository bookRepository = BookRepository.getInstance(); //가격등 정보불러옴
          int sum = 0;
          for (Cart cart : carts) {
            Book book = bookRepository.getBookById(cart.getBookId());
            Integer price = book.getUnitPrice() * cart.getBookCnt(); //소계 : 가격*수량
            sum += price;


        %>

        <tr>

          <td><input type="checkbox" name="checkedId" value="<%=book.getBooktId()%>"></td>
          <td><img src="/upload/<%=book.getFileName()%>" style="width: 100px"></td>
          <td><a href="../Book/book.jsp?bookId=<%=book.getBooktId()%>"%>
            <%=book.getFileName()%></a></td>
          <td><%=book.getUnitPrice()%></td>
          <td><%=cart.getBookCnt()%></td>
          <td><%=price%></td>
          <td><a href="#" role="<%=cart.getBookId()%>"class="badge badge-danger btn-removeById">삭제</a></td>

        </tr>
        <%
          }
        %>

      </table>
    </form>
    <a href="../Book/books.jsp" class="btn btn-secondary">&laquo;쇼핑계속하기</a>
  </div>
</div>

<script>
  document.addEventListener("DOMContentLoaded", function () {
    const btnAll = document.querySelector(".btn-removeAll")
    btnAll.addEventListener('click',function () {
      if(confirm('정말삭제하시겟습니까>')) {
        location.href = './processRemoveCart.jsp';
      }
    })
  })
  document.addEventListener("DOMContentLoaded", function () {
    const btnSel = document.querySelector(".btn-removeSel");
    const frmCart = document.querySelector('form[name=frmCart]');
    btnSel.addEventListener('click',function () {
      if(confirm('정말삭제하시겟습니까?')) {
        frmCart.action = './processRemoveSel.jsp';
        frmCart.submit();
      }
    })
  })


  const btnRemoveByIds = document.querySelectorAll('.btn-removeById');
  btnRemoveByIds.forEach(button => {
    button.addEventListener('click', function (e){
      if(confirm("삭제하시겟습니까?")) {
        frmCart.productId.value = e.target.role;
        frmCart.action = './processRemoveCartById.jsp';
        frmCart.submit();
      }
    })
  })

</script>
</body>
</html>
