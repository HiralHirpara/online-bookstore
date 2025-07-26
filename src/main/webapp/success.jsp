
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
    <head>
        <title>Book Added Successfully</title>
        <link rel="stylesheet" href="css/onlineBookStoreStyle.css">
    </head>
    <body>
    <div class="container">
        <h2>Book added successfully!</h2>
        <p>Title: ${book.title}</p>
        <p>Author: ${book.author}</p>
        <p>Price: $${book.price}</p>
        <br/>
        <button class="btn btn-back" onclick="window.location.href='index.jsp'">Back to Home</button>
        <button class="btn btn-list" onclick="window.location.href='bookList'">See Books List</button>
    </div>
    </body>
</html>