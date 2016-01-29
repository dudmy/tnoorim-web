<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="tnoorim.*, java.util.*" %>

<%
	request.setCharacterEncoding("EUC-KR");
%>

<jsp:useBean id="buyMgr" class="tnoorim.BuyMgr" />

<%
	String buy_id = request.getParameter("buyId");
	String buy_phone = request.getParameter("buyPhone");
	String buy_date = request.getParameter("buyDate");
%>

<html>
	<head>
		<title>T.noorim (카페를 누리다)</title>
		<link href="image/favicon.png" rel="icon" type="image/x-icon" />
		<script language="JavaScript" src="javascript/JavaScript.js"></script>
		<link type="text/css" rel="stylesheet" href="css/Css.css">

		<style>
			.smGlobalBtn2 {
				border: 1px solid transparent;
				background: #a92020;
				line-height: 16px;
				padding: 5px;
				border-radius: 2px;
				transition: 0.25s;
				display: block;
				width: 50px;
				margin: 0 auto;
				box-shadow: 0 2px 2px #999999;
			}

			.btn2:hover {
				background-color: #7f1818;
			}
		</style>
	</head>

	<body bgcolor="#fff0f0">
		<center>

		<br /><br />
		<img src="image/Order.png" width="100" height="100" />
		<br /><br />
		<table border="0">
			<tr>
				<td align="center"><font size="4">주문을 완료하시겠습니까?</font></td>
			</tr>
		</table>

		<table border="0">
			<tr>
				<td align="center"><a href="OrderOk.jsp?buyId=<%=buy_id%>&&buyDate=<%=buy_date%>&&buyPhone=<%=buy_phone%>" title="완료"><font size="3">네</font></a></td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td align="center"><a href="#" title="취소" onClick="winClose()"><font size="3">아니오</font></a></td>
			</tr>
		</table>

		</center>
	</body>
</html>