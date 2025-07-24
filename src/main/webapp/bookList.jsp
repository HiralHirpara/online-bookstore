
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
    <head>
        <title>Book List</title>
    </head>
    <body>
    <center>
        <h2>Available Books</h2>
        <table border="1" width="30%">
            <tr>
                <th>Title</th>
                <th>Author</th>
                <th>Price</th>
            </tr>
            <c:forEach var="book" items="${books}">
                <tr>
                    <td>${book.title}</td>
                    <td>${book.author}</td>
                    <td>$${book.price}</td>
                </tr>
            </c:forEach>
        </table>
        <br/>
        <button onclick="window.location.href='addBook.jsp'">Add New Book</button>
        </center>
    </body>
</html>