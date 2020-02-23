<%@ page import="java.sql.*" %><%--
    Document   : db_connection
    Created on : 14 Feb, 2020, 8:22:50 PM
    Author     : mformihir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"  %>
<%
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://b1a2da7cca77d9:a9abf445@us-cdbr-iron-east-04.cleardb.net/heroku_909da1d2af2e3b5?reconnect=true","b1a2da7cca77d9","a9abf445");
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
