<%-- 
    Document   : customerHome
    Created on : Apr 4, 2017, 8:11:47 PM
    Author     : mamos
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Home</title>
    </head>
    <body>
        <ul>
            <li><a class="active" href="customerHome.jsp">Home</a></li>
            <li><a href="home_cart.jsp">Cart</a></li>
            <li><a href="home_wishlist.jsp">Wishlist</a></li>    
            <li><a href="search.jsp">Search</a></li>     
            <li><a href="checkout.jsp">Checkout</a></li>
            <li><a href="recomendations.jsp">Movie Recommendations</a></li>
            <li><a href="home.jsp">Log Out</a></li>
        </ul> <br> 
        
        <img src="css/ui-lightness/images/logo.png" width="247" height="65" alt="captcha"/> <br>
        
            <% String email = session.getAttribute("email").toString();
             Class.forName("com.mysql.jdbc.Driver");
            Connection connection= null;
           connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila", "root","nbuser");
            Statement stmt= null;
            stmt=connection.createStatement();
           Statement statement=connection.createStatement();         
           String query="select USERID from users"
                           + " where EMAIL='"+ email + "'";
           ResultSet rs=null;
           rs=stmt.executeQuery(query);
           while(rs.next()){            
             %>
             <tr>
                 <%
                    int USERID=rs.getInt("USERID");
                 
                    int user_id =USERID;
                    session.setAttribute("user_id",user_id);
                    
                    
                 %>
        
         
             <%      
                }

            %>
          
            <% String em = session.getAttribute("email").toString();
             Class.forName("com.mysql.jdbc.Driver");
            Connection con= null;
           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila", "root","nbuser");
            Statement st= null;
            st=con.createStatement();
           Statement state=con.createStatement();         
           String q="select FIRSTNAME from users"
                           + " where EMAIL='"+ em + "'";
           ResultSet rset=null;
           rset=st.executeQuery(q);
           while(rset.next()){            
             %>
             <tr>
                 <%
                    String name=rset.getString("FIRSTNAME");
                    session.setAttribute("FIRSTNAME", name);
                 %>
        
         
             <%      
                }
                String fn = session.getAttribute("FIRSTNAME").toString();
            %>
            
          
            <h1>Welcome <%=fn%>!</h1>
            <h1>Welcome to Crimson Video Store</h1>
            <h2>Please use the navigation bar above to navigate our website.</h2>
    </body>
</html>
