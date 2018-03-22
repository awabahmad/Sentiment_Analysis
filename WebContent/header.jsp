<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<h1 style="text-align:center; color:red; font-size: 32px;">${ Status }</h1>
 <header role="banner">
        <div id="cd-logo"><a href="index.jsp"><img src="images/logo.png" alt="Logo"></a></div>
        <% if(session.getAttribute("name")==null){ %>
        <nav class="main-nav">
            <ul>
                <li><a class="cd-signin" href="#0">Sign in</a></li>
                <li><a class="cd-signup" href="#0">Sign up</a></li>
                <li><a class="cd-signin" href="about.jsp">About us</a></li>
            </ul>
        </nav>
        <%}else{ %>
        	<nav class="main-nav">
            <ul>
               <li>
                    <a class="cd-signup" href="Compare">Compare</a>
                </li>
                <li>
                    <a class="cd-signup" href="Ranker">Get Products Ranked</a>
                </li>
                <li>
                    <a class="cd-signup" href="Logout">Sign out</a>
                </li> 
                <li>
                    <a class="cd-signup" href="about.jsp">About us</a>
                </li> 
           </ul>
        </nav>
        <%} %>
    </header>    
</html>
