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

    <script src="js/index.js"></script>
    <style>
    
    #about{
	font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
	color: white;
	font-size: 20px;
	text-align: justify;
	margin-left: 10%;
	margin-right: 10%;
}


#creditName{
	font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
	color: white;
	font-size: 20px;
	text-align: left;
	margin-left: 10%;
	margin-right: 10%;
}
    </style>
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

            
                <div id ="about">
                     As the name of our project is Consumers voice include the tweets. This project addresses the problem of sentimental analysis twitter; that is classifying tweets according to the sentimental expressed in them: Positive, Negative and Neutral. Twitter is an online micro-blogging which allows user to write short status updates of maximum length 140 characters. Analysing the public sentiments to find out response of their products in the market, predicting political elections etc. The aim of this project is to develop a wed based application for the product on the bases of public opinion.   
                    <br>
                    <br>
                    <br>
                    Are you prepare to be surprised by Consumer€™s Voice!?
                    <br>
                    </div>

                <div id="creditName">
                    <br>
                    Muhammad Asif<br>
                    Muhammad Ahmed Raza<br>
                    Zawar Liaqat
                </div>
            </div>
        </div>
    </div>

</body>

<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="js/index.js"></script>
<script src="js/register.js"></script>
</html>