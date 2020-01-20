<%-- 
    Document   : index
    Created on : 31 Dec, 2019, 9:25:08 PM
    Author     : mformihir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%!
           double result = 0;
           public static double add(double a, double b)
           {
                return a+b;
           }
            public static double sub(double a, double b)
           {
                return a-b;
           }
            public static double mul(double a, double b)
           {
                return a*b;
           }
            public static double div(double a, double b)
           {
                return a/b;
           }
        %>
        
       
        
        <%  
            if(request.getParameter("operation") != null)
            {
                char operation = request.getParameter("operation").charAt(0);
                double n1 = Double.parseDouble(request.getParameter("number1"));
                double n2 = Double.parseDouble(request.getParameter("number2"));
            
                switch(operation)
                {
                    case '+': 
                        result = add(n1,n2); 
                        break;
                    case '-': 
                        result = sub(n1,n2); 
                           break;
                    case '*': 
                        result = mul(n1,n2);  
                            break;
                    case '/': 
                        result = div(n1,n2); 
                    break;
                }
            }
        %>
         <form method="POST">
            <input type="text" name="number1"> </br>
            <input type="text" name="number2"> </br>
            <input type="submit" value="+" name="operation"> 
            <input type="submit" value="-" name="operation"> 
            <input type="submit" value="*" name="operation"> 
            <input type="submit" value="/" name="operation"> </br>
            <input type="text" name="result" value="<%= result %>">
        </form>
    </body>
</html>
