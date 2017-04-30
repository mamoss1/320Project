<%-- 
    Document   : Cart
    Created on : Apr 6, 2017, 9:40:16 AM
    Author     : carte
--%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
            <li><a href="return.jsp">Return</a></li>
            <li><a href="home.jsp">Log Out</a></li>
     </ul> <br>
            <% //this code gets the user's email and the user id so that it can be used in the sql code.
                String email = session.getAttribute("email").toString();
              Integer user_id=(Integer)session.getAttribute("user_id");
            %>
              <h1>Cart Page</h1>
         Your cart is allowed up to 5 DVDs. If you try to add more than 5 DVDs to your
         cart, they will be added to your wishlist.
    <table border=1>
        <thead>
            <TR>
                <th> User ID </th>
                <th> Film ID </th>
                <th> Film Title </th>
                <th colspan=1>Action</th> 

            </TR>
        </thead>
        <tbody>
            <%
                //the code below gets the title from the search page. The title is then used to get the film id. 
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
                // The user id is used to count the number of film that the user has. if the count is over five then the film are moved to the wishlist. 
                String query1 ="select count(*) from cart where USERID='"+ user_id + "'";
                 ResultSet rs1=null;
           rs1=stmt.executeQuery(query1);
           while(rs1.next()){ 
            
                       Integer num =rs1.getInt(1);
                
                    
                    if (num > 4){
              //insert the film into the wishlist if the count is over 5 films.     
                   Integer film_id=(Integer)session.getAttribute("film_id");
           String command="insert into wishlist (USERID,FILMID,TITLE) values('" + user_id + "','" + film_id + "','" + titles + "')";
                 statement.executeUpdate(command);     
                    }
                    else {
                    // insert the film into cart if the count is under 5 films.
                     Integer film_id=(Integer)session.getAttribute("film_id");
           String command="insert into cart (USERID,FILMID,TITLE) values('" + user_id + "','" + film_id + "','" + titles + "')";
                 statement.executeUpdate(command);
                    
                    }
                        
           }
           // the code below select the information for the table.
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
                <%-- The code below allows the user to delete the films that they dont want  --%>
               <td><a href="CartController?action=delete&title=<c:out value="<%=title%>"/>"> Remove</a></td>
            </tr>
             <%      
                }
               
             

            %>
            </table>
        </tbody>
   
</body>

</html> 