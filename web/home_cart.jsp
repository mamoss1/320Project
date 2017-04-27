<%-- 
    Document   : home_cart
    Created on : Apr 12, 2017, 10:58:54 PM
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
            <li><a href="recomendations.jsp">Movie Recommendations</a></li>
            <li><a href="return.jsp">Return</a></li>
            <li><a href="home.jsp">Log Out</a></li>
        </ul> <br>
        <img src="css/ui-lightness/images/logo.png" width="247" height="65" alt="captcha"/> <br>
            <% String email = session.getAttribute("email").toString();
              Integer user_id=(Integer)session.getAttribute("user_id");
            %>
        
            <h1>Cart</h1>
    
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
           // Statement statement=connection.createStatement();
            String titles = request.getParameter("title");                                     
           String query="select USERID,FILMID, TITLE  from cart where USERID='"+ user_id + "'";
           ResultSet rs=null;
           rs=stmt.executeQuery(query);
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