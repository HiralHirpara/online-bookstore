
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
    <head>
        <title>Book Added Successfully</title>
    </head>
    <body>
    <center>
        <h2 var="book" items="${book}">Book added successfully!</h2>
        <p>Title: ${book.title}</p>
        <p>Author: ${book.author}</p>
        <p>Price: $${book.price}</p>
        <br/>
        <button onclick="window.location.href='index.jsp'">Back to Home</button>
        <button onclick="window.location.href='bookList'">See Books List</button>
        </center>
    </body>
</html>