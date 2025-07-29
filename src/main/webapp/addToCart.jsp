
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page isELIgnored="false" %>
<html>
    <head>
        <title>Add Book to Cart</title>
        <link rel="stylesheet" href="css/onlineBookStoreStyle.css">
    </head>
    <body>
        <div class="container">
              <h2>Add Book to Cart</h2>
              <%
                  String title = request.getParameter("title");
                  String newTitle = URLDecoder.decode(request.getParameter("title"), "UTF-8");
                  String id = request.getParameter("id");
              %>
              <form action="#" method="post">
                   <input type="text" name="bookName" value=<%=title %> />
                  <input type="hidden" name="bookId" value=<%=id %> />
                  <input type="number" name="bookQuantity" value="1" min="1" />
                  <input type="submit" value="Add to Cart" />

                  <div class="form-buttons">
                      <button type="button" class="btn btn-list" onclick="window.location.href='bookList'">See Books List</button>
                      <button type="button" class="btn btn-back" onclick="window.location.href='index.jsp'">Back to Home</button>
                  </div>
              </form>
        </div>
    </body>
</html>