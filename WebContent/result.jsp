<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <title>Consumer Voice</title>
     <link href="css/base.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/register.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/pi-chart.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

    <link href='http://fonts.googleapis.com/css?family=Petit+Formal+Script' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Alegreya+Sans:300,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300' rel='stylesheet' type='text/css'>


</head>

<body>

    <%@include file="header.jsp"%>
    <div class="content">
        <div class="wrap">

            <div class="content-grid">
                <p>
                    <img src="images/top.png" title="">
                </p>
            </div>

            <div class="grid">

                <div class="progress-pie-chart" data-percent=${pos_percentage }>
                    <div class="ppc-progress">
                      <div class="ppc-progress-fill"></div>
                    </div>
                    <div class="ppc-percents">
                      <div class="pcc-percents-wrapper">
                        <span>%</span>
                      </div>
                    </div>
                  </div>
                  <div id="genTag"><h2> ${pos_percentage }% People seems to be in favour</h2></div> 
            </div>

            <div class="row">
                <div class="col-xs-6">

                    <table>
                        <thead>
                            <tr>
                                <th><center>Top Positive Responses</center></th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items='${ positive_tweets }' var="temp">
                            <tr>
                                <td>${ temp.status.text }</td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>
                <div class="col-xs-6">

                    <table>
                        <thead>
                        	<tr>
                                <th colspan="2"><center>Top negative Response</center></th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items='${ negative_tweets }' var="temp">
                            <tr>
                                <td>${ temp.status.text }</td>
                            </tr>
                             </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>

            <div class="footer">
                <p class="a">
                    <a href="#">
                        <img src="images/facebook.png" title="">
                    </a>
                    <a href="#">
                        <img src="images\twitter.png" title="">
                    </a>
                </p>
            </div>

        </div>
    </div>

</body>


<script src="js/register.js"></script>
<script src="js/pi-chart.js"></script>

</html>