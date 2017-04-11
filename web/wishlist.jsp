<%-- 
    Document   : Wishlist
    Created on : Apr 6, 2017, 9:40:16 AM
    Author     : carte
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
        <title>WishList</title>
    </head>
          
<body>
    <table border=1>
        <thead>
            <TR>
                <th> User ID </th>
                <th> Film ID </th>
                <th> Film Title </th>
                <th colspan=2>Action</th> 
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
         
           String command="insert into wishlist (USERID,TITLE) values(2,'" + titles + "')";
                 statement.executeUpdate(command);          
           String query="select t.USERID, f.film_id, t.TITLE  from wishlist as t join film as f"
                           + " on t.title=f.title"
                           + " where USERID=2";
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
                  <td><a href="CartController?action=d&title="<c:out value="<%=title%>"/> Add to Cart</a></td>
               <td><a href="WishListController?action=delete&title="<c:out value="<%=title%>"/> Remove from Wishlist</a></td> 
            </tr>
             <%      
                }

            %>
            </table>
        </tbody>
   
      
         
    
   <p><a href="listProduct.jsp">Search page</a></p>
   <p>
       
   </p>
   <p><a href="customerHome.jsp">Home page</a></p>
</body>

</html> 