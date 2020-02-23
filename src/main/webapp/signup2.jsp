<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: mformihir
  Date: 16/02/20
  Time: 11:45 AM
  To change this template use File | Settings | File Templates.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<%!
    String message = "";
%>

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Mihir Joshi</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/slicknav.css">
    <link rel="stylesheet" href="css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
</head>

<body>
<!--[if lte IE 9]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade
    your browser</a> to improve your experience and security.</p>
<![endif]-->

<!-- header-start -->
<header>
    <title> Sign Up </title>
</header>
<!-- header-end -->

<%
    //validation
    if (request.getParameter("submit") != null) {
        //username validation
        String username = request.getParameter("username");
        if (username.length() < 6)
            message += "Invalid Username. Minimum length of username should be 6.</br>";

        //password validation
        String password = request.getParameter("password");
        if (password.length() <= 6 || password.length() > 20)
            message += "Invalid Password. The password should be 6-20 characters long. </br>";
        if (!Pattern.matches("^(.*[\\W].*)+$", password))
            message += "The password should contain at least 1 special symbol.</br>";
        if (!Pattern.matches("^(.*[\\d].*)+$", password))
            message += "The password should contain at least 1 digit.</br>";
        if (!Pattern.matches("^(.*[A-Z].*)+$", password))
            message += "The password should contain at least 1 uppercase letter.</br>";

        //confirm password validation
        String confirmPassword = request.getParameter("cpassword");
        if (!confirmPassword.equals(password))
            message += "Password and Confirm Password must be the same. </br>";

        //email
        String email = request.getParameter("email");

        //phone number validation
        String phoneNumber = request.getParameter("phonenumber");
        if (!Pattern.matches("^[0-9]{6,10}$", phoneNumber))
            message += "The phone number should contain 6-10 digits. </br>";

        //address validation
        String address = request.getParameter("address");
        String[] testAddress = address.split("\\n");
        if (testAddress.length < 3)
            message += "Address should contain at least 3 lines. </br>";

        //hobbies validation
        String[] hobbies = request.getParameterValues("hobbies");
        if (hobbies == null)
            message += "You should have at least 3 hobbies selected. </br>";



        if (message.length() == 0)
        {
            int semester = Integer.parseInt(request.getParameter("semester"));
            String branch = request.getParameter("branch");
            String gender = request.getParameter("gender");
            StringBuilder hobbiesArray = new StringBuilder();
            for (String hobby : hobbies)
                hobbiesArray.append(hobby);
            message += "SignUp Success!";

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://b1a2da7cca77d9:a9abf445@us-cdbr-iron-east-04.cleardb.net/heroku_909da1d2af2e3b5?reconnect=true","b1a2da7cca77d9","a9abf445");
            //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ajt","mihir","Mihir67_");
            Statement stmt = con.createStatement();
            int rs = stmt.executeUpdate("INSERT INTO student_details (username, password, email, phone, semester, branch, gender, hobbies) VALUES ('" + username +"', '"+ password +  "','"+email+"', "+phoneNumber+", "+semester+",'"+branch+"','"+gender+"','" +hobbiesArray + "')");
            message += rs + " rows affected.";
        }

    }
%>

<!-- slider_area_start -->

<div style="position: absolute; left: 35%; top: 15%">
    <%
        out.println(message);
    %>
    <div class="title_text title_text2 ">
        <h3>Sign Up</h3>
    </div>
    <div>
        <form method="post" action="signup2.jsp">
            <div class="mt-10">
                <input class="form-control valid" type="text" name="username" placeholder="Username"
                       onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username'" required
                >
            </div>
            <div class="mt-10">
                <input type="password" name="password" placeholder="Password"
                       onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'" required
                       class="form-control valid">
            </div>
            <div class="mt-10">
                <input type="password" name="cpassword" placeholder="Confirm Password"
                       onfocus="this.placeholder = ''" onblur="this.placeholder = 'Confirm Password'"
                       class="form-control valid" required>
            </div>
            <div class="mt-10">
                <input type="email" name="email" placeholder="Email address"
                       onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email address'"
                       class="form-control valid" required>
            </div>
            <div class="mt-10">
                <input type="text" name="phonenumber" placeholder="Phone Number"
                       onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone Number'"
                       class="form-control valid" required>
            </div>
            <div class="mt-10">
                <div class="form-select" id="default-select">
                    <select name="semester" required>
                        <option value=" 1">Semester</option>
                        <option value="1">5</option>
                        <option value="2">6</option>
                        <option value="3">7</option>
                        <option value="4">8</option>
                    </select>
                </div>
            </div>
            <div class="mt-10">
                <div class="form-select" id="default-select">
                    <select name="branch" required>
                        <option value=" default">Branch</option>
                        <option value="Computer">Computer</option>
                        <option value="Civil">Civil</option>
                        <option value="Mechanical">Mechanical</option>
                        <option value="Chemical">Chemical</option>
                    </select>
                </div>
            </div>
            <div class="mt-10">
                <div class="form-select" id="default-select">
                    <select name="gender" required="required">
                        <option value=" 1">Gender</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                    </select>
                </div>
            </div>
            <div class="mt-10">
                <div class="switch-wrap d-flex justify-content-between">
                    <p>Music</p>
                    <div class="confirm-checkbox">
                        <input type="checkbox" id="hobby1" name="hobbies" value="music">
                        <label for="hobby1"></label>
                    </div>
                </div>
                <div class="switch-wrap d-flex justify-content-between">
                    <p>Games</p>
                    <div class="confirm-checkbox">
                        <input type="checkbox" id="hobby2" name="hobbies" value="games">
                        <label for="hobby2"></label>
                    </div>
                </div>

                <div class="switch-wrap d-flex justify-content-between">
                    <p>Movies</p>
                    <div class="confirm-checkbox">
                        <input type="checkbox" id="hobby3" name="hobbies" value="movies">
                        <label for="hobby3"></label>
                    </div>
                </div>
                <div class="switch-wrap d-flex justify-content-between">
                    <p>Football</p>
                    <div class="confirm-checkbox">
                        <input type="checkbox" id="hobby4" name="hobbies" value="football">
                        <label for="hobby4"></label>
                    </div>
                </div>
            </div>
            <div class="mt-10">
                <textarea class="form-control valid" name="address" placeholder="Address"
                          onfocus="this.placeholder = ''"
                          onblur="this.placeholder = 'Address'" required></textarea>

            </div>
            <button type="submit" name="submit" class="genric-btn primary-border circle">Sign Up</button>

            <button type="reset" class="genric-btn info-border circle">Reset</button>
        </form>

    </div>
</div>


<!-- slider_area_end -->


<!--================ Blog Area end =================-->

<!-- footer_start -->

<!-- footer_end -->

<!-- JS here -->
<script src="js/vendor/modernizr-3.5.0.min.js"></script>
<script src="js/vendor/jquery-1.12.4.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/isotope.pkgd.min.js"></script>
<script src="js/ajax-form.js"></script>
<script src="js/waypoints.min.js"></script>
<script src="js/jquery.counterup.min.js"></script>
<script src="js/imagesloaded.pkgd.min.js"></script>
<script src="js/scrollIt.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/wow.min.js"></script>
<script src="js/nice-select.min.js"></script>
<script src="js/jquery.slicknav.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery.countdown.js"></script>
<script src="js/plugins.js"></script>

<!--contact js-->
<script src="js/contact.js"></script>
<script src="js/jquery.ajaxchimp.min.js"></script>
<script src="js/jquery.form.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/mail-script.js"></script>

<script src="js/main.js"></script>
<% message = ""; %>
</body>

</html>