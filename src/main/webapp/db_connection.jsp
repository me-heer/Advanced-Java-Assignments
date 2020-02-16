<%@ page import="java.sql.*" %><%--
    Document   : db_connection
    Created on : 14 Feb, 2020, 8:22:50 PM
    Author     : mformihir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"  %>
<%
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ajt","mihir","Mihir67_");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM products");
        rs.next();
        out.println(rs.getInt(1));
        out.println(rs.getString(2));
        out.println(rs.getString(3));
        out.println(rs.getDouble(4));
        out.println(rs.getInt(5));
    }catch(Exception e){
        out.println(e);
    }

    
 %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
