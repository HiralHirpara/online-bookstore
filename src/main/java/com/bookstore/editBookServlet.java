package com.bookstore;

import com.bookstore.dao.BookDAO;
import com.bookstore.model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editBook")
public class editBookServlet  extends HttpServlet {

    BookDAO bookDAO = new BookDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr == null) {
            response.sendRedirect("bookList"); // Redirect if no id provided
            return;
        }
        try {
            Long id = Long.parseLong(idStr);
            Book book = bookDAO.findBook(id);
            if (book == null) {
                response.sendRedirect("bookList");
                return;
            }
            request.setAttribute("book", book);
            request.getRequestDispatcher("editBook.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("bookList");
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String idStr = request.getParameter("id");
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String priceStr = request.getParameter("price");

        try {
            long id = Long.parseLong(idStr);
            double price = Double.parseDouble(priceStr);

            Book updatedBook = new Book(id, title, author, price);
            bookDAO.updateBook(updatedBook);

            response.sendRedirect("bookList"); // Redirect to list after update

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Invalid input. Please try again.");
            request.getRequestDispatcher("editBook.jsp").forward(request, response);
        }
    }
}
