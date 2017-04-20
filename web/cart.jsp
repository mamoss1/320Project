<%-- 
    Document   : Cart
    Created on : Apr 6, 2017, 9:40:16 AM
    Author     : carte
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<html>
    
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
        <title>Cart</title>
    </head>
         
<body>
      <ul>
            <li><a href="customerHome.jsp">Home</a></li>
            <li><a class="active" href="home_cart.jsp">Cart</a></li>
            <li><a href="home_wishlist.jsp">Wishlist</a></li>    
            <li><a href="search.jsp">Search</a></li>     
            <li><a href="checkout.jsp">Checkout</a></li>
            <li><a href="home.jsp">Log Out</a></li>
        </ul> <br>
            <% String email = session.getAttribute("email").toString();
              Integer user_id=(Integer)session.getAttribute("user_id");
            %>
              <h1>Cart Page</h1>
         
    <table border=1>
        <thead>
            <TR>
                <th> User ID </th>
                <th> Film ID </th>
                <th> Film Title </th>
            </TR>
        </thead>
        <tbody>
            <%
           Class.forName("com.mysql.jdbc.Driver");
            Connection connection= null;
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila", "root","nbuser");
            Statement stmt= null;
            stmt=connection.createStatement();
            Statement statement=connection.createStatement();
            String titles = request.getParameter("title"); 
            
            String query="select film_id from film where title='"+ titles +"'";
            ResultSet rss=null;
           rss=stmt.executeQuery(query);
           while(rss.next()){
    
            int FILMID=rss.getInt("film_id");
           int film_id =FILMID;
                    session.setAttribute("film_id",film_id);
           }
           %>
           
            <%
                   Integer film_id=(Integer)session.getAttribute("film_id");
           String command="insert into cart (USERID,FILMID,TITLE) values('" + user_id + "','" + film_id + "','" + titles + "')";
                 statement.executeUpdate(command);          
           String query2="select USERID,FILMID, TITLE  from cart where USERID='"+ user_id + "'";
           ResultSet rs=null;
           rs=stmt.executeQuery(query2);
           while(rs.next()){            
             %>
             <tr>
                 <%
                  String title= rs.getString("title");                          
                 %>
        
            <tr>
               <TD> <%= rs.getString(1) %> </TD>
                <TD> <%= rs.getString(2) %> </TD>
                <TD> <%=title%> </TD>
            </tr>
             <%      
                }

            %>
            </table>
        </tbody>
   
</body>

</html> 