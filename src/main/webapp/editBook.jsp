<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Edit Book</title>
    <link rel="stylesheet" href="css/onlineBookStoreStyle.css">
</head>
<body>
<div class="container">
    <h2>Edit Book</h2>
    <form action="editBook" method="post">
        <input type="hidden" name="id" value="${book.id}" />
        <label>Title:</label>
        <input type="text" name="title" value="${book.title}" required /><br/><br/>

        <label>Author:</label>
        <input type="text" name="author" value="${book.author}" required /><br/><br/>

        <label>Price:</label>
        <input type="number" step="0.01" name="price" value="${book.price}" required /><br/><br/>

        <input type="submit" value="Update Book" class="btn btn-add"/>
        <button type="button" class="btn btn-list" onclick="window.location.href='bookList'">See Books List</button>
        <button type="button" class="btn btn-back" onclick="window.location.href='index.jsp'">Back to Home</button>
    </form>
</div>
</body>
</html>