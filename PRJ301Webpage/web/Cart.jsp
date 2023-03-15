<%-- 
    Document   : Cart
    Created on : Oct 31, 2020, 9:42:21 PM
    Author     : trinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart</title>
        <link href="../../css/site.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    </head>
    <body>
        <form action="<c:url value="/controller/buy_handler.do"/>">
            <button class="btn btn-primary" name="action" value="back"><i class="bi bi-bag"></i>Home</button>
            <table class="table table-striped">
                <tr>
                    <th>No.</th>
                    <th>Images</th>
                    <th>Id</th>
                    <th>Brand</th>
                    <th>Type</th>
                    <th>Price</th>
                    <th></th>
                </tr>
                <c:forEach var="entry" items="${pageScope.cartDis}" varStatus="loop">
                    <tr>
                        <td>${loop.count}</td>
                        <td>
                            <img src="<c:url value="/WEB-INF/productPics/${image}"/>" alt=""/>
                        </td>
                        <td>${entry.key.id}</td>
                        <td>${entry.key.brandId}</td>
                        <td>${entry.key.type}</td>
                        <td>${entry.key.price}</td>
                        <td>                            
                            Amount<input type="number" step="1" name="amount" value="1" max="${entry.vajlue}" min="1"></input>
                            <button type="submit" class="btn btn-warning" name="op" value="remove"><i class="bi bi-x-lg"></i>Remove</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <p>Total: ${total}</p>
            <button type="submit" class="btn btn-success" name="op" value="buy"><i class="bi bi-cart-check-fill"></i>Buy</button>
            <button type="submit" class="btn btn-danger" name="op" value="remove"><i class="bi bi-cart-check-fill"></i>Empty</button>
        </form>
    </body>
</html>
