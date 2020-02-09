<%@ page import="java.util.HashMap" %><%--
    Document   : ecomhomepage
    Created on : 30 Jan, 2020, 3:51:24 PM
    Author     : mformihir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="com.mihir.javaheroku.Product" %>
<!DOCTYPE html>
<!doctype html>
<html class="no-js" lang="zxx">
<%
    HashMap<Integer, Integer> cartItems = new HashMap<Integer, Integer>();
    String isAddedToCart = request.getParameter("addtocart");
    String quantity = request.getParameter("qty");
    if(isAddedToCart != null){
        if(session.getAttribute("cart") != null)
        {
            cartItems = (HashMap<Integer, Integer>) session.getAttribute("cart");
        }

        int pid = Integer.parseInt(request.getParameter("pid"));
        int qty = Integer.parseInt(request.getParameter("qty"));
        cartItems.put(pid,qty);
        session.setAttribute("cart",cartItems);
    }
%>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>eCommerce</title>
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
                <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
            <![endif]-->

        <!-- header-start -->
      
        <!-- about_area_start -->
        
        <!-- about_area_end -->
        <%
            Product p1 = new Product(1, "iPhone", "Don't buy it.", 100000d, 5);
            Product p2 = new Product(2, "Pixel", "Best phone ever", 10000d, 5);
            Product p3 = new Product(3, "Samsung", "It will explode", 7d, 5);
            Product p4 = new Product(4, "Windows", "Dead", 5000d, 5);
            Product p5 = new Product(5, "Java", "Coffee", 10d, 5);
            HashMap<Integer, Product> products = new HashMap<Integer, Product>();
            products.put(1, p1);
            products.put(2, p2);
            products.put(3, p3);
            products.put(4, p4);
            products.put(5, p5);
            if(application.getAttribute("prodcuts") == null)
            {
                application.setAttribute("products",products);
            }
        %>
        <!-- speakers_start -->
        <div class="speakers_area">
            <h1 class="horizontal_text d-none d-lg-block">
                Products
            </h1>
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="section_title_large mb-95">
                            <h3>
                                Products
                                <%
                                    int totalItems = 0;
                                    if(session.getAttribute("cart") != null)
                                        totalItems = ((HashMap<Integer,Integer>)session.getAttribute("cart")).size();
                                %>
                                <a href="checkout.jsp" name="checkout" style="color: #6610f2"><%= totalItems %></a>
                            </h3>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xl-5 col-md-6">
                        <div class="single_speaker">
                            <div class="speaker_thumb">
                                <img src="img/speakers/1.png" alt="">
                                <div class="hover_overlay">
                                    <div class="social_icon">

                                        <a href="ecomhomepage.jsp?pid=1"><i class="fa fa-plus-circle"></i></a>

                                    </div>
                                </div>
                            </div>
                            <div class="speaker_name text-center">
                                <h3>  <%= p1.getProductName() %> </h3>
                                <p>Kidney</p>
                                <form action="ecomhomepage.jsp" method="get">
                                    <input type="hidden" name="pid" value="1">
                                    <input type="number" name="qty" placeholder="quantity">
                                    <button type="submit" class="genric-btn primary-border circle" name="addtocart" value="submitted">Add to Cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-5 offset-xl-2 col-md-6">
                        <div class="single_speaker">
                            <div class="speaker_thumb">
                                <img src="img/speakers/2.png" alt="">
                                <div class="hover_overlay">
                                    <div class="social_icon">

                                        <a href="ecomhomepage.jsp"><i class="fa fa-plus-circle"></i></a>

                                    </div>
                                </div>
                            </div>
                            <div class="speaker_name text-center">
                                <h3>  <%= p2.getProductName() %> </h3>
                                <p><%= p2.getProductPrice() %></p>
                                <form action="ecomhomepage.jsp" method="get">
                                    <input type="hidden" name="pid" value="2">
                                    <input type="number" name="qty" placeholder="quantity"/>
                                    <button type="submit" class="genric-btn primary-border circle" name="addtocart" value="submitted">Add to Cart</button>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>





        <!-- speakers_end-->

        <!-- event_area_start -->
       
        <!-- event_area_end -->


        <!-- resister_book_start -->
        
        <!-- resister_book_end -->

        <!-- brand_area_start -->
        
        <!-- brand_area_end -->

        <!-- faq_area_Start -->
        
        <!-- faq_area_end -->

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

    </body>

</html>


