<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
        <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
        <title>Add New Product</title>
    </head>
    <body>
        <script>
            $(function () {
                $('input[name=sales_date]').datepicker();
                 $('input[name=shipping_date]').datepicker();
            });
        </script>

        <form method="POST" action='ProductController' name="frmAddProduct">
            Order Number : <input type="text" readonly="readonly" name="order_num"
                             value="<c:out value="${product.order_num}" />" /> <br /> 
            Customer ID: <input
                type="text" name="customer_id"
                value="<c:out value="${product.customer_id}" />" /> <br /> 
            Product ID : <input
                type="text" name="product_id"
                value="<c:out value="${product.product_id}" />" /> <br /> 
            Quality : <input type="text" name="quality"
                           value="<c:out value="${product.quality}" />" /> <br /> 
            Shipping Cost : <input type="text" name="shipping_cost"
                           value="<c:out value="${product.shipping_cost}" />" /> <br /> 
            Sales Date : <input
                type="text" name="sales_date"
                value="<fmt:formatDate pattern="MM/dd/yyyy" value="${product.sales_date}" />" /> <br /> 
            Shipping Date : <input
                type="text" name="shipping_date"
                value="<fmt:formatDate pattern="MM/dd/yyyy" value="${product.shipping_date}" />" /> <br /> <input
                           type="submit" value="Submit" />
            
        </form>
    </body>
</html>