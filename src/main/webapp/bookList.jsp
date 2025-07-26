
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
    <head>
        <title>Books List</title>
        <link rel="stylesheet" href="css/onlineBookStoreStyle.css">
    </head>
    <body>
    <div class="container">
        <h2>Available Books</h2>
        <table border="1" width="30%">
            <tr>
                <th>Title</th>
                <th>Author</th>
                <th>Price</th>
                <th>Edit Book</th>
                <th>Delete Book</th>
            </tr>
            <c:forEach var="book" items="${books}">
                <tr>
                    <td>${book.title}</td>
                    <td>${book.author}</td>
                    <td>$${book.price}</td>
                    <td><a href="editBook?id=${book.id}" title="Edit">&#9998;</a></td>
                    <td><a href="deleteBook?id=${book.id}"
                    onclick="return confirm('Are you sure you want to delete this book?');"title="Delete">&#128465;</a></td>

                </tr>
            </c:forEach>
        </table>
        <br/>
        <button class="btn btn-add" onclick="window.location.href='addBook.jsp'">Add New Book</button>
        <button class="btn btn-back" onclick="window.location.href='index.jsp'">Back to Home</button>
    </div>
    </body>
</html>