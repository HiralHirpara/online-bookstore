
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
    <head>
        <title>Add New Book</title>
    </head>
    <body>
     <center>
        <h2>Add Book</h2>
        <br/>
        <form action="addBook" method="post">
            Title: <input type="text" name="title" required /><br/><br/>
            Author: <input type="text" name="author" required /><br/><br/>
            Price: <input type="number" step="0.01" name="price" required /><br/><br/>
            <input type="submit" value="Add Book" />
        </form>
       </center>
    </body>
</html>