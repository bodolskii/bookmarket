
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

    <title>Title</title>
</head>
<body>
<jsp:include page="/inc/menu.jsp"></jsp:include>
<div class="jumbotron">
    <div class="container">
        <h1 class="alert alert-danger">해당상품이 존재하지 않습니다.</h1>
    </div>
</div>
<div class ="container">
    <p>?<%=request.getQueryString()%></p>

    <p><a href ="books.jsp" class="btn btn-secondary">상품 목록</a></p>
</div>

</div>
<jsp:include page="/inc/footer.jsp"></jsp:include>

</body>
</html>
