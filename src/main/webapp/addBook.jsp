
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
    <head>
        <title>Add New Book</title>
        <link rel="stylesheet" href="css/onlineBookStoreStyle.css">
    </head>
    <body>
        <div class="container">
              <h2>Add a New Book</h2>
              <form action="addBook" method="post" class="form">
                  <label>Title:</label>
                  <input type="text" name="title" required />

                  <label>Author:</label>
                  <input type="text" name="author" required />

                  <label>Price:</label>
                  <input type="number" step="0.01" name="price" required />

                  <div class="form-buttons">
                      <input type="submit" value="Add Book" class="btn btn-add" />
                      <button type="button" class="btn btn-list" onclick="window.location.href='bookList'">See Books List</button>
                      <button type="button" class="btn btn-back" onclick="window.location.href='index.jsp'">Back to Home</button>
                  </div>
              </form>
        </div>
    </body>
</html>