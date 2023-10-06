package dto;

public class Cart {
    public String bookId;
    public Integer bookCnt;

    @Override
    public String toString() {
        return "Cart{" +
                "bookId='" + bookId + '\'' +
                ", bookCnt=" + bookCnt +
                '}';
    }


    public Cart(String bookId, Integer bookCnt) {
        this.bookId = bookId;
        this.bookCnt = bookCnt;
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public Integer getBookCnt() {
        return bookCnt;
    }

    public void setBookCnt(Integer bookCnt) {
        this.bookCnt = bookCnt;
    }
}

