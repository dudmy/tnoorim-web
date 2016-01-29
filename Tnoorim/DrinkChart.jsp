<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="tnoorim.*, java.util.*" %>

<%
	request.setCharacterEncoding("EUC-KR");
%>

<%
	String visitorPhone = request.getParameter("visitorPhone");
%>

<html>
	<head>
		<title>T.noorim (카페를 누리다)</title>
		<link href="image/favicon.png" rel="icon" type="image/x-icon" />
		<script language="JavaScript" src="javascript/JavaScript.js"></script>
		<link type="text/css" rel="stylesheet" href="css/Css.css">

		<script src="javascript/jquery-1.11.3.js"></script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>

		<!-- statistics -->
		<script type="text/javascript" src="https://www.google.com/jsapi"></script>
		<script type="text/javascript">
			google.load("visualization", "1", {packages:["corechart"]});

			google.setOnLoadCallback(drawInit);

			function drawVisualization(dataFromAjax) {
				var visitorPhone = "<%=visitorPhone%>";

				var data = google.visualization.arrayToDataTable(dataFromAjax);
				var options = { };

				new google.visualization.PieChart(document.getElementById('piechart')).draw(data, options);
			}

			function drawInit() {
				var visitorPhone = "<%=visitorPhone%>";

				var data = null;
				var table_data = null;

				$.ajax({
					url: 'DrinkData.jsp?visitorPhone='+visitorPhone,
					data: {},
					success: function(res) {
						table_data = eval("(" + res + ")");
						drawVisualization(table_data);
					}
				});
			}

			setInterval(function() { drawInit(); }, 2000);
		</script>
	</head>

	<body>

		<br /><br />

		<font color="#a92020" size="7px"><strong>&nbsp;&nbsp;&nbsp;&nbsp;LOVER</strong></font>
		<center>
			<div id="piechart" style="width: 500px; height: 300px;"></div>
		</center>

	</body>
</html>