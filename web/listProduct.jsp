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
</html>