<%@page import="dao.BookRepository" %>
<%@page import="dto.Book" %>
<%@page import="java.util.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page contentType="text/html; charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("UTF-8");
    String folder = "C:\\upload";
    int maxSize = 5 * 1024 * 1024;
    String encType = "UTF-8";//인코딩 타입

    MultipartRequest multipartRequest = new MultipartRequest(request, folder, maxSize, encType,new DefaultFileRenamePolicy());



    //파라미터로 값을 가져와서 스트링으로 변환,
    String booktId = multipartRequest.getParameter("booktId");
    String bookName = multipartRequest.getParameter("bookName");
    String unitPrice = multipartRequest.getParameter("unitPrice");
    String description = multipartRequest.getParameter("description");
    String author = multipartRequest.getParameter("author");
    String publisher = multipartRequest.getParameter("publisher");
    String unitsInStock = multipartRequest.getParameter("unitsInStock");
    String totalPages = multipartRequest.getParameter("totalPages");
    String releaseDate = multipartRequest.getParameter("releaseDate");
    String condition = multipartRequest.getParameter("condition");
    String fileName = multipartRequest.getFilesystemName("fileName");

    //정수값을 스트링으로되잇던걸 숫자자료형으로 변환
    Integer price = unitPrice.isEmpty() ? 0 : Integer.parseInt(unitPrice);
    Long total = totalPages.isEmpty() ? 0L : Long.parseLong(totalPages);
    Long stock = unitsInStock.isEmpty() ? 0L : Long.parseLong(unitsInStock);
    //ProductRepository.getInstance()메서드 호출하는것 productRepository
    BookRepository bookRepository = BookRepository.getInstance();

    //product 개체 만들고 객체 내용정보 set;
    Book book = new Book();
    book.setBookName(bookName);
    book.setBooktId(booktId);
    book.setUnitPrice(price);
    book.setDescription(description);
    book.setAuthor(author);
    book.setPublisher(publisher);
    book.setUnitsInStock(stock);
    book.setTotalPages(total);
    book.setCondition(condition);
    book.setReleaseDate(releaseDate);
    book.setFileName(fileName);

    bookRepository.addProduct(book);

    System.out.println(book);//과정확인

    System.out.println(bookRepository.getAllBooks());//과정확인
    System.out.println(book);//과정확인
    response.sendRedirect("books.jsp");

%>
