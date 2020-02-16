<%--
  Created by IntelliJ IDEA.
  User: mformihir
  Date: 16/02/20
  Time: 5:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>


<html>
<head>
    <title>Edit Products</title>
</head>
<body>
    <h3>Add Products</h3>
    <form action="editproducts.jsp" method="post">
        <input type="text" name="pname" placeholder="Product Name">
        <input type="text" name="pdesc" placeholder="Description">
        <input type="text" name="price" placeholder="Price">
        <input type="text" name="stock" placeholder="Stock"> <br>
        <input type="submit" name="addproduct" value="Add Product">
        <input type="reset">
    </form>

    <h3>Search Products</h3>
    <form action="editproducts.jsp" method="get">
        <select name="searchby">
            <option value="pname">pname</option>
            <option value="pdesc">pdesc</option>
            <option value="stock">stock</option>
            <option value="price">price</option>
        </select>
        <input type="text" name="searchitem"/>
        <input type="submit" name="searchproduct" value="searchItems"/>
    </form>

    <h3>Update Product</h3>
    <h5>Find Product By</h5>
    <form action="editproducts.jsp" method="get">
        <select name="searchby">
            <option value="pname">pname</option>
            <option value="pdesc">pdesc</option>
            <option value="stock">stock</option>
            <option value="price">price</option>
        </select>
        <input type="text" name="searchitem"/> <br>
        <h5>Update Product Details</h5>
        <input type="text" name="pname" placeholder="Product Name">
        <input type="text" name="pdesc" placeholder="Description">
        <input type="text" name="price" placeholder="Price">
        <input type="text" name="stock" placeholder="Stock"> <br>
        <input type="submit" name="updateproduct" value="Update Product">
        <input type="reset">
    </form>

    <h3>Delete Product</h3>
    <h5>Find Product By</h5>
    <form action="editproducts.jsp" method="get">
        <select name="searchby">
            <option value="pname">pname</option>
            <option value="pdesc">pdesc</option>
            <option value="stock">stock</option>
            <option value="price">price</option>
        </select>
        <input type="text" name="searchitem"/> <br>
        <input type="submit" name="deleteproduct" value="Delete Product">
        <input type="reset">
    </form>
</body>
</html>

<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ajt","mihir","Mihir67_");
    Statement stmt = con.createStatement();

    if(request.getParameter("addproduct") != null)
    {
        try{
            String pname = request.getParameter("pname");
            String pdesc = request.getParameter("pdesc");
            float price = Float.parseFloat(request.getParameter("price"));
            int stock = Integer.parseInt(request.getParameter("stock"));
            int rs = stmt.executeUpdate("INSERT INTO products (pname, pdesc, price, stock) VALUES ('"+pname+"', '"+pdesc+"', price, stock)");
            out.println(rs + "product/s added.");
        }catch(NumberFormatException e){
            out.println("Enter valid input.");
        }catch(SQLException e){
            out.println("Database error.");
        }

    }

    if(request.getParameter("searchproduct") != null)
    {
        try{
            String searchBy = request.getParameter("searchby");
            String searchString = request.getParameter("searchitem");
            String whereQuery = "WHERE "+searchBy+" LIKE '%" + searchString + "%'";
            ResultSet rs = stmt.executeQuery("SELECT * FROM products " + whereQuery);
            if(!rs.isBeforeFirst())
                out.println("Could not find any product.");
            else{
                out.println("<table>");
                out.println("<tr>");
                out.println("<th> Product ID </th>");
                out.println("<th> Product Name </th>");
                out.println("<th> Product Description </th>");
                out.println("<th> Product Price </th>");
                out.println("<th> Product Stock </th>");
                out.println("</tr>");
                out.println("<tr>");
                while(rs.next()){
                    out.println("<td>"); out.println(rs.getInt(1)); out.println("</td>");
                    out.println("<td>"); out.println(rs.getString(2)); out.println("</td>");
                    out.println("<td>"); out.println(rs.getString(3)); out.println("</td>");
                    out.println("<td>"); out.println(rs.getFloat(4)); out.println("</td>");
                    out.println("<td>"); out.println(rs.getInt(5)); out.println("</td>");
                }
                out.println("</tr>");
                out.println("</table>");
            }
        }catch(NumberFormatException e){
            out.println("Enter valid input.");
        }catch(SQLException e){
            out.println("Database error.");
        }

    }
    if(request.getParameter("updateproduct") != null)
    {
        try{
            String searchBy = request.getParameter("searchby");
            String searchString = request.getParameter("searchitem");
            String whereQuery = "WHERE "+searchBy+" LIKE '%" + searchString + "%'";
            ResultSet rs = stmt.executeQuery("SELECT * FROM products " + whereQuery);
            if(!rs.isBeforeFirst())
                out.println("Could not find any product.");
            else{
                String pname = request.getParameter("pname");
                String pdesc = request.getParameter("pdesc");
                float price = Float.parseFloat(request.getParameter("price"));
                int stock = Integer.parseInt(request.getParameter("stock"));
                int rows = stmt.executeUpdate("INSERT INTO products (pname, pdesc, price, stock) VALUES ('"+pname+"', '"+pdesc+"', price, stock)");
                out.println(rows + "product/s updated.");
            }
        }catch(NumberFormatException e){
            out.println("Enter valid input.");
        }catch(SQLException e){
            out.println("Database error.");
        }

    }

    if(request.getParameter("deleteproduct") != null)
    {
        try{
            String searchBy = request.getParameter("searchby");
            String searchString = request.getParameter("searchitem");
            String whereQuery = "WHERE "+searchBy+" LIKE '%" + searchString + "%'";
            ResultSet rs = stmt.executeQuery("SELECT * FROM products " + whereQuery);
            if(!rs.isBeforeFirst())
                out.println("Could not find any product.");
            else{
                int rows = stmt.executeUpdate("DELETE FROM products "+whereQuery);
                out.println(rows + "product/s deleted.");
            }
        }catch(NumberFormatException e){
            out.println("Enter valid input.");
        }catch(SQLException e){
            out.println("Database error.");
        }

    }



%>
