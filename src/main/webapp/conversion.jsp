<%-- 
    Document   : login2
    Created on : 20 Jan, 2020, 1:22:24 PM
    Author     : mformihir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">    
 
    <%!
        String result = "";
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
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

   <!-- header-start -->
   <header>
       <title> Login </title>
   </header>
   <!-- header-end -->
  

   <!-- slider_area_start -->
  
      <div style="position: absolute; left: 35%; top: 35%">
                     <div class="title_text title_text2 ">
                        <h3>Temperature Converter</h3>
                     </div>
          <div>
                      <form method="post">
                        <div>
                            <input class="form-control valid" type="number" name="fahrenheit" placeholder="F"
                                            onfocus="this.placeholder = ''" onblur="this.placeholder = 'F'"
                                            >
                            <input class="form-control valid" type="number" name="celsius" placeholder="C"
                                            onfocus="this.placeholder = ''" onblur="this.placeholder = 'C'"
                                            >
                        </div>
                          <div class="button-group-area mt-10">
				
                            <button type="submit" class="genric-btn primary-border circle" name="ctof" value="submitted">C to F</button>
                            <button type="submit" class="genric-btn primary-border circle" name="ftoc" value="submitted">F to C</button>
			    <button type="reset" class="genric-btn info-border circle"> Reset </button>
			  </div>
                          <div class="mt-10">
                                    <%  
            if(result != null)
            {
                try{
                    String isCtoF = request.getParameter("ctof");
                        String isFtoC = request.getParameter("ftoc");
                        if (isCtoF != null) {
                            String inputC = request.getParameter("celsius");
                            if (inputC != null) {
                                Double celsius = Double.parseDouble(inputC);
                                Double fahrenheit = ((9.0 / 5.0) * celsius) + 32;
                                result += ("Celsius: " + celsius + " converted to Fahrenheit: " + fahrenheit + "</br>");
                            }
                        }
                        if (isFtoC != null) {
                            String inputF = request.getParameter("fahrenheit");
                            if (inputF != null) {
                                Double fahrenheit = Double.parseDouble(inputF);
                                Double celsius = (fahrenheit - 32) * (5.0 / 9.0);
                                result += ("Fahrenheit: " + fahrenheit + " converted to Celsius: " + celsius + "</br>");
                            }
                        }

                }catch(NumberFormatException e){
                    result += ("Enter a valid input." + "</br>"); 
                }
                finally{
                    out.println(result);
                }
                
            }
        %>
                          </div>
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

</body>

</html>