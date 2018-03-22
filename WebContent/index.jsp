<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Consumer Voice</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/register.css" rel="stylesheet" type="text/css" media="all" />
    <link href='http://fonts.googleapis.com/css?family=Petit+Formal+Script' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Alegreya+Sans:300,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300' rel='stylesheet' type='text/css'>
</head>
<body>
   <%@include file="header.jsp"%>
    <div class="cd-user-modal">
        <!-- this is the entire modal form, including the background -->
        <div class="cd-user-modal-container">
            <!-- this is the container wrapper -->
            <ul class="cd-switcher">
                <li><a href="#0">Sign in</a></li>
                <li><a href="#0">New account</a></li>
            </ul>
            <div id="cd-login">
                <!-- log in form -->
                <form class="cd-form" action="Login" method="post">
                    <p class="fieldset">
                        <label class="image-replace cd-email" for="signin-email">E-mail</label>
                        <input class="full-width has-padding has-border" id="signin-email" name="email" type="email" placeholder="E-mail">
                        <span class="cd-error-message">Error message here!</span>
                    </p>

                    <p class="fieldset">
                        <label class="image-replace cd-password" for="signin-password">Password</label>
                        <input class="full-width has-padding has-border" id="signin-password" name="password" type="password" placeholder="Password">
                        <a href="#" class="hide-password">Show</a>
                        <span class="cd-error-message">Error message here!</span>
                    </p>

                    <p class="fieldset">
                        <input type="checkbox" id="remember-me" checked>
                        <label for="remember-me">Remember me</label>
                    </p>
                    <p class="fieldset">
                        <input class="full-width" type="submit" name="button" value="Login">
                    </p>
                </form>

            </div> <!-- cd-login -->
            <div id="cd-signup">
                <!-- sign up form -->
                <form class="cd-form" action="Login" method="post">
                    
                    <p class="fieldset">
                        <label class="image-replace cd-username" for="signup-username">Username</label>
                        <input class="full-width has-padding has-border" id="signup-username" name="cusername" placeholder="User Name">
                        <span class="cd-error-message">Error message here!</span>
                    </p>

                    <p class="fieldset">
                        <label class="image-replace cd-email" for="signup-email">E-mail</label>
                        <input class="full-width has-padding has-border" id="signup-email" name="cemail" type="email" placeholder="E-mail">
                        <span class="cd-error-message">Error message here!</span>
                    </p>
                    <p class="fieldset">
                        <label class="image-replace cd-password" for="signin-password">Password</label>
                        <input class="full-width has-padding has-border" id="signin-password" name="cpassword" type="password" placeholder="Password">
                        <a href="#" class="hide-password">Show</a>
                        <span class="cd-error-message">Error message here!</span>
                    </p>
                    <p class="fieldset">
                        <input type="checkbox" id="accept-terms">
                        <label for="accept-terms">I agree to the <a href="#0">Terms</a></label>
                    </p>
                    <p class="fieldset">
                        <input class="full-width has-padding" type="submit" name="button" value="Create account">
                    </p>
                </form>
                <!-- <a href="#0" class="cd-close-form">Close</a> -->
            </div> <!-- cd-signup -->
            
            <a href="#0" class="cd-close-form">Close</a>
        </div> <!-- cd-user-modal-container -->
    </div> <!-- cd-user-modal -->
    
    <div class="content">
        <div class="wrap">
            
            <div class="content-grid">
                <p><img src="images/top.png" title=""></p>
            </div>


            <div class="grid">
                <p><img src="images/coming.png" title=""></p>

                <form id="search" action="Search" method="post">
                    <input type="text" size="30" value="Search Twitter #tag e.g... #pakistan" onblur="if (this.value == '') this.value = 'Search Twitter #tag e.g... #pakistan'" onfocus="    if (this.value == 'Search Twitter #tag e.g... #pakistan') this.value = ''" name="querry" id="email">
                    <a href="#"><button type="submit" class="btn span btn-4 btn-4a icon-arrow-right"><span></span></button></a>

                    <div id="response"></div>
                </form>
            </div>

            <div class="footer">
                <p class="a"><a href="#"><img src="images/facebook.png" title=""></a><a href="#"><img src="images\twitter.png" title=""></a></p>
            </div>

        </div>
    </div>

</body>

<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="js/register.js"></script>
</html>