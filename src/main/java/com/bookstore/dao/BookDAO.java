package com.bookstore.dao;

import com.bookstore.MySQLConnection;
import com.bookstore.model.Book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {

    Connection connection = null;
    PreparedStatement stmt = null   ;

    public List<Book> findAll(){
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM book";

        try {
            connection = MySQLConnection.getConnection();
            stmt = connection.prepareStatement(sql);
            ResultSet set = stmt.executeQuery();
            while (set.next()){
                Book book = new Book();
                book.setId(set.getLong("id"));
                book.setTitle(set.getString("title"));
                book.setPrice(set.getDouble("price"));
                book.setAuthor(set.getString("author"));
                books.add(book);
            }
            connection.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
        return books;
    }

    public void addBook(Book book){
        String sql = "INSERT INTO book (title, author, price) values (?,?,?)";

        try{
            connection = MySQLConnection.getConnection();
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, book.getTitle());
            stmt.setString(2, book.getAuthor());
            stmt.setDouble(3, book.getPrice());
            stmt.execute();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Book findBook(Long id){
        String sql = "SELECT * FROM book WHERE id = ?";
        Book book = null;
        try{
            connection = MySQLConnection.getConnection();
            stmt = connection.prepareStatement(sql);
            stmt.setLong(1, id);
            ResultSet set = stmt.executeQuery();
            if(set.next()){
                book = new Book();
                book.setId(set.getLong("id"));
                book.setTitle(set.getString("title"));
                book.setAuthor(set.getString("author"));
                book.setPrice(set.getDouble("price"));
            }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  book;
    }
    public boolean updateBook(Book book) {
        String UPDATE_BOOK_SQL = "UPDATE book SET title = ?, author = ?, price = ? WHERE id = ?;";
        boolean rowUpdated = false;

        try (Connection connection = MySQLConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_BOOK_SQL)) {

            statement.setString(1, book.getTitle());
            statement.setString(2, book.getAuthor());
            statement.setDouble(3, book.getPrice());
            statement.setLong(4, book.getId());

            rowUpdated = statement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rowUpdated;
    }

    public void deleteBook(Long id){
        String sql = "DELETE FROM book WHERE id = ?";
        try{
            connection = MySQLConnection.getConnection();
            stmt = connection.prepareStatement(sql);
            stmt.setLong(1, id);
            stmt.executeUpdate();
            connection.close();
        } catch (SQLException e) {
           e.printStackTrace();
        }
    }

    // Try out db connection and sql query
    /*
    public static void main(String[] args) {
        BookDAO dao = new BookDAO();

        // Add a book
        dao.addBook(new Book(0L, "Java EEE", "John Dan", 19.99));

        // Get all books
        List<Book> books = dao.findAll();
        for (Book b : books) {
            System.out.println(b.getId()+" | "+b.getTitle()+" | "+b.getAuthor()+" | "+b.getPrice());
        }
        // delete a book
        dao.deleteBook(4L);

    }
    */
}
