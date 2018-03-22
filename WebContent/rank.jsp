<!DOCTYPE html>
<html>

<head>
    <title>Consumer Voice</title>
    <link href="css/base.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/register.css" rel="stylesheet" type="text/css" media="all" />
    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap-select.min.css" />

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
            <form name="rankform" action="Ranker" method="post">
                <select class="selectpicker" data-live-search="true" name="category" onchange="document.rankform.submit();">
                	<option value="toselect" selected>Select Category</option>
                    <c:forEach items='${ cat }' var="temp">
                		<option class="text-center" value='${ temp }'>${ temp}</option>
                	</c:forEach>
                </select>
                </form>

                <br><br><br>

                <ul class="list-group">
                <c:forEach items='${ data }' var="temp">
                    <li class="list-group-item justify-content-between">
                        '${ temp.name }'
                        <span class="badge badge-default badge-pill">${ temp.pos_percent }</span>
                    </li>
                    </c:forEach>
                </ul>

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
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-select.min.js"></script>

</html>