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
                <form name="temp" action="LoadSubCategories" method="post">
                <select class="selectpicker" data-live-search="true" name="category" onchange="document.temp.submit();">
  					<option value="toselect" selected>Select Category</option>
  					<c:forEach items='${ cat }' var="temp">
                		<option class="text-center" value='${ temp }'>${ temp}</option>
                	</c:forEach>
  				</select>
  				</form>
            </div>
		<br><br>
            <div class="grid">
				
  				<form name="dummy" action="Compare" method="post">	
                <select class="selectpicker" data-live-search="true" name="compare1">
               		 <option value="toselect" selected>Select 1st Product</option>
                	<c:forEach items='${ data }' var="temp">
                		<option value='${ temp }'>${ temp}</option>
                	</c:forEach>
  					
				</select>

                
                <div id="genTag">VS</div>
 				<select class="selectpicker" data-live-search="true" data-show-subtext="true" name="compare2" onchange="document.dummy.submit();">
                    	<option value="toselect" selected>Select 2nd Product</option>
                    <c:forEach items='${ data }' var="temp">
                		<option value='${ temp }'>${ temp}</option>
                	</c:forEach>
                </select>
				</form>
                <div id="genTag"><h2> ${ better_percent }% People seems to be in support of ${ better_name }</h2></div>
            </div>
            <div class="row">
                <div class="col-xs-6">

                    <table>
                        <thead>
                            <tr>
                                <th class="text-center"> ${ compare1 } Negative Facts</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items='${ compare1_negative }' var="temp">
                            <tr>
                                <td> ${ temp.status.text }</td>
                            </tr>
                         </c:forEach>
                        </tbody>
                    </table>

                </div>
                <div class="col-xs-6">

                    <table>
                        <thead>
                            <tr>
                                 <th class="text-center"> ${ compare2 } Negative Facts</th>
                            </tr>
                        </thead>
                        <tbody>
                           <c:forEach items='${ compare2_negative }' var="temp">
                            <tr>
                                <td> ${ temp.status.text }</td>
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
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-select.min.js"></script>


</html>