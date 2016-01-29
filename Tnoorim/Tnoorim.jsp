<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="tnoorim.*, java.util.*" %>

<%
	request.setCharacterEncoding("EUC-KR");
%>

<jsp:useBean id="eventBean" class="tnoorim.EventBean" />
<jsp:useBean id="eventMgr" class="tnoorim.EventMgr" />

<%
	String cafe_name = (String)session.getAttribute("nameKey");
	String cafe_branch = (String)session.getAttribute("branchKey");
%>

<%
	String eventId = new String();
	String eventName = new String();
	String eventInfo = new String();
	String eventMenu = new String();
	String eventPrice = new String();
	String eventStart = new String();
	String eventEnd = new String();

	Vector eventList;
	int eventSize;

	eventList = eventMgr.getEventList();
	eventSize = eventList.size();

	int toggle = 0;
	boolean onoff = false;

	GregorianCalendar now = new GregorianCalendar();
	String today = String.format("%TF", now);
%>

<html>
	<head>
		<title>ī�並 ��������! - T.noorim (ī�並 ������)</title>
		<link href="image/favicon.png" rel="icon" type="image/x-icon" />
		<script language="JavaScript" src="javascript/JavaScript.js"></script>
		<link type="text/css" rel="stylesheet" href="css/Css.css">

		<script src="javascript/jquery-1.11.3.js"></script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>

		<!-- statistics -->
		<script type="text/javascript" src="https://www.google.com/jsapi?autoload={
			'modules':[{
				'name':'visualization',
				'version':'1',
				'packages':['corechart']
			}]
		}"></script>
		<script type="text/javascript">
			google.setOnLoadCallback(drawInit);

			function drawVisualization(dataFromAjax) {
				var data = google.visualization.arrayToDataTable(dataFromAjax);
				var options = {
					title: 'Cafe Total Counts & Sales',
					curveType: 'function',
					legend: { position: 'bottom' }
				};

				new google.visualization.LineChart(document.getElementById('curve_chart')).draw(data, options);
			}

			function drawInit() {
				var data = null;
				var table_data = null;

				$.ajax({
					url: 'Data.jsp',
					data: {},
					success: function(res) {
						table_data = eval("(" + res + ")");
						drawVisualization(table_data);
					}
				});
			}

			setInterval(function() { drawInit(); }, 1000);
		</script>

		<!-- order list -->
		<script type="text/javascript">
			orderListInit();

			function orderListInit() {
				$.ajax({
					url: 'OrderData.jsp',
					success: function(data) {
						$('#orderTable').empty();
						$('#orderTable').append(data);
					}
				});
			}

			setInterval(function() { orderListInit(); }, 1000);
		</script>

		<!-- visitor -->
		<script type="text/javascript">
			$(function() {
				var cssTop = parseInt($("#sky").css("top"));

				$(window).scroll(function() {
					var position = $(window).scrollTop();

					$("#sky").stop().animate({ "top": position + cssTop + "px" }, 300);
				});

				$("#top").click(function() {
					$('html, body').animate({ scrollTop: 0 }, 300);
				});
			});
		</script>

		<!-- visitor list -->
		<script type="text/javascript">
			visitorListInit();

			function visitorListInit() {
				$.ajax({
					url: 'VisitorData.jsp',
					success: function(data) {
						$('#visitorTable').empty();
						$('#visitorTable').append(data);
					}
				});
			}

			setInterval(function() { visitorListInit(); }, 1000);
		</script>

		<style>
			hr {
				height: 8px;
				border: 0;
				box-shadow: 0 8px 8px -8px #dddddd inset;
			}

			.one {
				border-collapse: collapse;
				border-bottom: 1px solid #dddddd;
			}

			.th {
				padding: 15px;
				background-color: #a92020;
				color: white;
			}

			.odd {
				background-color: #eeeeee;
			}

			.one tr:hover {
				background-color: #c3e6e5;
			}

			.smGlobalBtn {
				display: inline-block;
				cursor: pointer;
				width: 24px;
				height: 24px;
				box-shadow: 0 2px 2px #999999;
				padding: 0px;
				text-decoration: none;
				text-align: center;
				color: #ffffff;
				line-height: 2em;
				border-radius: 24px;
				-moz-border-radius: 24px;
				-webkit-border-radius: 24px;
				transition: 0.25s;
			}

			.btn {
				background: #a92020;
			}

			.btn:before {
				color: #ffffff;
				content: '\2714';
			}

			.btn:hover {
				background: #7f1818;
			}

			.smGlobalBtn2 {
				border: 2px solid transparent;
				background: #a92020;
				line-height: 25px;
				padding: 10px;
				border-radius: 3px;
				transition: 0.25s;
				display: block;
				width: 180px;
				margin: 0 auto;
				box-shadow: 0 3px 3px #999999;
			}

			.btn2:hover {
				background-color: #7f1818;
			}

			#list {
				width: 60%;
				text-align: left;
			}

			#list ul {
				font-style: italic;
				font-size: 30px;
				color: #a92020;
				list-style:none;
			}

			#list ul li p {
				padding: 5px;
				font-style: normal;
				font-size: 13px;
				color: #353535;
			}

			#list ul li p em {
				display: block;
			}

			li {
				background: url(image/Event_.png) no-repeat 0 5px;
				padding-left: 48px;
			}
		</style>
	</head>

	<body>
		<center>

		<!-- ���: ��ũ�� ����ٴϴ� �޴� -->
		<div style="position: fixed; top: 0px; background-color: rgba(255, 255, 255, 0.93); z-index: 2;">
			<table width="100%" style="table-layout: fixed;">
				<tr height="80px">
					<td width="25%" align="center">
						<span id="top" style="cursor: pointer;" title="T.noorim (ī�並 ������)">
							<img src="image/Logo2.png" height="55" />
						</span>
					</td>
					<td width="15%" align="center">
						<a href="#order_list" title="�ֹ� Ȯ��">order list</a>
					</td>
					<td width="15%" align="center">
						<a href="#event" title="�̺�Ʈ Ȯ��">event</a>
					</td>
					<td width="15%" align="center">
						<a href="#statistics" title="��� Ȯ��">statistics</a>
					</td>
					<td width="15%" align="center">
						<a href="#" title="�޴� - ������ �̵�">menu</a>
					</td>
					<td width="15%" align="center">
						<a href="#" title="ī�� ���� - ������ �̵�">cafe info</a>
					</td>
				</tr>
			</table>
		</div>

		<!-- �̹��� -->
		<img src="image/Branch.jpg" width="1349" height="400" />

		<!-- <%=cafe_name%> <%=cafe_branch%> �α׾ƿ� �߰� -->

		<!-- �ǽð� ����� -->
		<div id="sky" style="position: absolute; top: 205px; left: 10px; width: 100px; height: 250px; background-color: rgba(255, 250, 250, 0.93); padding: 10px; text-align: center; z-index: 1;">
			<font size="2px">Cafe Lover List</font>
			<hr />
			<div id="visitorTable"></div>
		</div>

		<br /><br /><br /><br /><br /><br />

		<!-- ������Ʈ �Ұ� -->
		<center>
			<table border="0" width="60%">
				<tr>
					<td align="center">
						<img src="image/Logo2.png" height="150" />
					</td>
				</tr>
				<tr>
					<td>
						<br /><br />
						'�繰���ͳ� (IoT)'�� �ٽ����� '���� (Beacon)'�� �ָ�ް� �ִ�. 
						������ ������� ��ġ�� �ľ��� ������ �����ϴ� ������ ��� �����, 
						'GPS'�� �޸� �ǳ������� ��ġ �ľ��� �����ϴٴ� ������ �ִ�. 
						�츮�� �̷��� ������ ����Ͽ� ������ ������� �ʰ� �޴��� �ֹ��� �� ������, 
						����ڿ��� ������ �̺�Ʈ�� �����ϴ� ���ø����̼ǰ� �� �������� �����ϰ��� �Ѵ�.
					</td>
				</tr>
			</table>
		</center>

		<!-- order list -->
		<br /><br /><br /><br /><br />
		<a id="order_list"></a>
		<hr width="60%" />
		<br /><br /><br /><br />
		<table border="0" width="60%">
			<tr>
				<td align="center"><h2>ORDER LIST</h2></td>
			</tr>
		</table>
		<br /><br /><br />
			<div id="orderTable"></div>

		<!-- event, ���� ��¥�� ���ϰ�, �ִ� 10�������� -->
		<br /><br /><br /><br /><br />
		<a id="event"></a>
		<hr width="60%" />
		<br /><br /><br /><br />
		<table border="0" width="60%">
			<tr>
				<td align="center"><h2>EVENT</h2></td>
			</tr>
		</table>
		<br />
			<div id="list">
				<ul>
				<%
					if(eventSize <= 10) {
						for(int i=0; i<eventSize; i++) {
							eventBean = (EventBean)eventList.elementAt(i);

							if(cafe_name.equals(eventBean.getCafe_name())) {
								eventId = String.valueOf(eventBean.getEvent_id());
								eventName = eventBean.getEvent_name();
								eventInfo = eventBean.getEvent_info();
								eventMenu = eventBean.getMenu_name();
								eventPrice = String.valueOf(eventBean.getPrice());
								eventStart = eventBean.getStartday();
								eventEnd = eventBean.getEndday();
				%>
								<li>
									<p>
										<em>
											<font color="#a92020">
												<font size="4px"><%=eventName%></font>
												&nbsp; <%=eventStart%> ~ <%=eventEnd%>
												&nbsp; <%=eventMenu%> <%=eventPrice%>
											</font>
										</em>
										<%=eventInfo%> <br />
									</p>
								</li>
				<%
							}
						}
					}
				%>
				</ul>
			</div>
			<br />
			<table border="0" width="60%">
				<tr>
					<td align="center">
						<a href="#" title="�̺�Ʈ���" onClick="window.open('Event.jsp', 'new', 'resizable=no width=420 height=700'); return false" class="btn2 smGlobalBtn2"><font color="#ffffff"><strong>RERISTER EVENTS</strong></font></a>
					</td>
				</tr>
			</table>

		<!-- statistics -->
		<br /><br /><br /><br /><br />
		<a id="statistics"></a>
		<hr width="60%" />
		<br /><br /><br /><br />
		<table border="0" width="60%">
			<tr>
				<td align="center"><h2>STATISTICS</h2></td>
			</tr>
		</table>
			<div id="curve_chart" style="width: 900px; height: 500px; z-index: -1;"></div>

		<br /><br /><br /><br />
		<br /><br /><br /><br />

		<!-- �ϴ� -->
		<div style="background-color: #353535;">
			<jsp:include page="Bottom.jsp"></jsp:include>
		</div>

		</center>
	</body>
</html>