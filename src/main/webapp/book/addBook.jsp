<%@page import="dao.BookRepository"%>
<%@page import="dto.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class= "dao.BookRepository" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <title>상품등록</title>
</head>
<body>
<jsp:include page="../inc/menu.jsp"></jsp:include>
<div class="jumbotron">
    <div class="container">
        <h1 class="display=3">도서등록</h1>
    </div>
</div>


<div class ="container">
    <form name="frmBook" action="processAddBook.jsp" method="post" enctype="multipart/form-data">
        <div class="form-group row">
            <label class="col-sm-2">도서코드</label>
            <div class="col-sm-3">
                <input type="text" name="booktId" class="form-control" value="1234">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">도서명</label>
            <div class="col-sm-3">
                <input type="text" name="bookName" class="form-control" value="파이썬 정복">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">가격</label>
            <div class="col-sm-3">
                <input type="text" name="unitPrice" class="form-control" value="19000">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">저자</label>
            <div class="col-sm-3">
                <input type="text" name="author" class="form-control" value="김정환">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">출판사</label>
            <div class="col-sm-3">
                <input type="text" name="publisher" class="form-control" value="한빛아카데미">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">출판일</label>
            <div class="col-sm-3">
                <input type="date" name="releaseDate" class="form-control" value="20181212">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">총페이지수</label>
            <div class="col-sm-3">
                <input type="text" name="totalPages" class="form-control" value="360">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">상세정보</label>
            <div class="col-sm-3">
                <textarea  name="description" rows="5" cols="20" class="form-control" value="누구나쉽세 배울수 있는 파이썬 교재입니다"></textarea>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">재고수</label>
            <div class="col-sm-3">
                <input type="text" name="unitsInStock" class="form-control" value="10">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">상태</label>
            <div class="col-sm-3">
                <input type="radio" name="condition" value="new">신규 도서
                <input type="radio" name="condition" value="old">중고 도서
                <input type="radio" name="condition" value="new">재생 도서
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">이미지</label>
            <div class="col-sm-3">
                <input type="file" name="fileName" class="form-control">
            </div>
        </div>
        <div class="form-group row">
            <input type="submit" class="btn btn-primary" value="등록">
        </div>

    </form>
</div>
<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>