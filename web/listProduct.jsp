<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
        <title>Show All Products</title>
    </head>
    <body>
       
        
        <%-- MEGAN WAS HERE --%>
        <%--
        <table border=1>
            <thead>
                <tr>
                    <th>Order Number</th>
                    <th>Customer ID</th>
                    <th>Product ID</th>
                    <th>Quality</th>
                    <th>Shipping Cost</th>
                    <th>Sales Date</th>
                    <th>Shipping Date</th>
                    <th colspan=2>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${products}" var="product">
                    <tr>
                        <td><c:out value="${product.order_num}" /></td>
                        <td><c:out value="${product.customer_id}" /></td>
                        <td><c:out value="${product.product_id}" /></td>
                        <td><c:out value="${product.quality}" /></td>
                        <td><c:out value="${product.shipping_cost}" /></td>
                        <td><fmt:formatDate pattern="yyyy-MMM-dd" value="${product.sales_date}" /></td>
                        <td><fmt:formatDate pattern="yyyy-MMM-dd" value="${product.shipping_date}" /></td>
                        <td><a href="UserController?action=edit&order_num=<c:out value="${product.order_num}"/>">Update</a></td>
                        <td><a href="UserController?action=delete&order_num=<c:out value="${product.order_num}"/>">Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <p><a href="UserController?action=insert">Add Product</a></p>

        
        

    </body>
    --%>
    
<body>
      <form action="listProduct.jsp" method="POST"> 
     
            Please enter the Film category:
            <input type="text" name="category">
            <br>
            Please enter the Films Actor's First Name:
              <input type="text" name="F_actor">
            <br>
              Please enter the Films Actor's Last Name:
              <input type="text" name="L_actor">
            <br>
            Please enter the Store Number:
              <input type="text" name="store">
            <br>
            <input type="submit" value="Submit">
        </form>
    <table border=1>
        <thead>
            <tr>
          
               <th>Title</th>
           
                <th colspan=2>Action</th> 
            </tr>
        </thead>
        <tbody>
            <%
           Class.forName("com.mysql.jdbc.Driver");
            Connection connection= null;
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila", "mwaskin","mwaskin");
             Statement stmt= null;
            stmt=connection.createStatement();
                
            Statement statement = connection.createStatement();

            String category = request.getParameter("category");  
                  String F_actor = request.getParameter("F_actor");
                  String L_actor=request.getParameter("L_actor");
                  String store= request.getParameter("store");
           
            if(category!=null){
            
             String query= " select F.title from store as S join inventory as I"
                     + " on S.store_id=I.store_id"
                      + " join film_category as FC"
                      + " on I.film_id=FC.film_id"
                     +" join film as F"
                     +" on FC.film_id=F.film_id"
                     +" join film_actor as FA"
                     +" on F.film_id=FA.film_id"
                     +" join actor as A"
                     +" on FA.actor_id=A.actor_id"
                     +" join category as C"
                     +" on FC.category_id=C.category_id"
                     + " where C.name like '" + category + "' or  "
                     + "A.first_name like '" + F_actor + "' or "
                     + "A.last_name like '" + L_actor + "' or "
                     + "S.store_id like '"+ store + "'"
                      +"group by F.title";
             ResultSet rs= null;
             rs= stmt.executeQuery(query);
             while(rs.next()){
             %>
             <tr>
                 <%
              
                 
                 %>
             
            <td><c:out value="<%= rs.getString(1) %>"/></td>
                    <td><a href="=<c:out value="<%=rs.getString(1)%>"/>">CheckOut</a></td>
                    <td><a href="=<c:out value="<%=rs.getString(1)%>"/>">Whish List</a></td>
         

               </tr>
             <%      
                }
}
            %>
         
        </tbody>
    </table>
    <p><a href="">Add Product</a></p>
</body>

</html>