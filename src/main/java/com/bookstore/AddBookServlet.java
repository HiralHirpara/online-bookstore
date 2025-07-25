package com.bookstore;

import com.bookstore.dao.BookDAO;
import com.bookstore.model.Book;

import javax.servlet.annotation.WebServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addBook")
public class AddBookServlet extends HttpServlet {

    BookDAO bookDAO = new BookDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String priceStr = request.getParameter("price");

        if (title == null || author == null || priceStr == null || title.isEmpty() || author.isEmpty() || priceStr.isEmpty()) {
            response.getWriter().println("<h3>Error: All fields are required!</h3>");
            return;
        }
        double price = 0;
        try {
            price = Double.parseDouble(priceStr);
        } catch (NumberFormatException e) {
            response.getWriter().println("<h3>Error: Invalid price format!</h3>");
            return;
        }
        Book addBook = new Book();
        addBook.setTitle(title);
        addBook.setAuthor(author);
        addBook.setPrice(price);

        bookDAO.addBook(addBook);

        // Redirect or forward after adding
        request.setAttribute("book", addBook);
        request.getRequestDispatcher("success.jsp").forward(request, response);
        
    }
}
