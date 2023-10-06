package dao;

import java.util.ArrayList;
import java.util.*;
import dto.Book;




public class BookRepository {
	private static BookRepository instance = new BookRepository();

	private ArrayList<Book> books = new ArrayList();
	public static BookRepository getInstance() {
		return instance;
	}
	public void addProduct(Book book) {
		this.books.add(book);
	}
	
	public BookRepository() {
		Book b1 = new Book("111", "JAVA", 10000);
		Book b2 = new Book("222", "JSP", 10000);
		Book b3 = new Book("333", "SPRING", 10000);
			
		b1.setAuthor("서보성");
		b1.setFileName("P1234.png");
		b2.setAuthor("고지훈");
		b2.setFileName("P1235.png");
		b3.setAuthor("홍길동");
		b3.setFileName("P1236.png");
	
		 books.add(b1);
	     books.add(b2);
	     books.add(b3);
		
	}
	public ArrayList<Book> getAllBooks (){
		//상품리스트 객체를 반환
		return books;
	}
	public Book getBookById(String bookId) {
		Book book = null;
		
		//포이치문 목록순회
		for(Book p : books) {
			if(p.getBooktId().equals(bookId)) {
				//매개변수와 아디가같으면
				book = p;
				break;
			}
		}
		return book;
	}	
}
	
