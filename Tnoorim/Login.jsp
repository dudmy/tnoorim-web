<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="tnoorim.*, java.util.*" %>

<%
	request.setCharacterEncoding("EUC-KR");
%>

<jsp:useBean id="cafeBean" class="tnoorim.CafeBean" />
<jsp:useBean id="cafeMgr" class="tnoorim.CafeMgr" />

<%
	String error_name = (String)session.getAttribute("nameKey");
	String error_branch = (String)session.getAttribute("branchKey");
%>

<%
	Vector cafeList, branchList;
	int cafeSize, branchSize;

	cafeList = cafeMgr.getCafeList();
	cafeSize = cafeList.size();
	branchList = cafeMgr.getBranchList();
	branchSize = branchList.size();
%>

<html>
	<head>
		<title>Login - T.noorim (카페를 누리다)</title>
		<link href="image/favicon.png" rel="icon" type="image/x-icon" />
		<script language="JavaScript" src="javascript/JavaScript.js"></script>
		<link type="text/css" rel="stylesheet" href="css/Css.css">

		<style>
			.selectbox {
				margin-bottom: 5px;
				border-radius: 3px;
				padding: 10px;
				width: 250px;
				transition: border .5s;
				background: #ffffff url("http://2.bp.blogspot.com/-T3aZyed1Ql8/VFHNFmecaTI/AAAAAAAACqI/BlgRLXWKvPs/s1600/ic_arrow_drop_down_48px-32.png") no-repeat 90% 50%;
			}

			.selectbox select {
				padding: 5px 8px;
				width: 100%;
				border: none;
				background: transparent;
				-webkit-appearance: none;
			}

			.selectbox select:focus {
				outline: none;
			}

			.wrapper {
				padding: 30px;
				background: rgba(255, 255, 255, 0.4);
				position: absolute;
				top: 50%;
				left: 0;
				width: 100%;
				height: 400px;
				margin-top: -200px;
				overflow: hidden;
			}

			* {
				box-sizing: border-box;
			}

			*:focus {
				outline: none;
			}

			body {
				padding: 50px;
			}

			.app-title {
				text-align: center;
			}

			.login-form {
				text-align: center;
			}

			.control-group {
				margin-bottom: 5px;
			}

			input {
				text-align: center;
				background-color: #ffffff;
				border: 2px solid transparent;
				border-radius: 3px;
				font-size: 16px;
				padding: 10px;
				width: 250px;
				transition: border .5s;
			}

			input:focus {
				border: 2px solid #a92020;
				box-shadow: none;
			}

			.btn {
				border: 2px solid transparent;
				background: #a92020;
				color: #ffffff;
				font-size: 16px;
				line-height: 25px;
				padding: 10px;
				border-radius: 3px;
				transition: 0.25s;
				display: block;
				width: 250px;
				margin: 0 auto;
			}

			.btn:hover {
				background-color: #7f1818;
			}
		</style>
	</head>

	<body background="image/Main.jpg">
		<div class="wrapper">
			<div class="app-title">
				<img src="image/Logo.png" height="115" />
			</div>

			<br />

			<div class="login-form">
				<form name="login" method="post" action="LoginProc.jsp">
					<div class="control-group">
					<center>
						<!-- 카페 -->
						<div class="selectbox">
							<select name="cafe_name">
							<%
								for(int i=0; i<cafeSize; i++) {
									cafeBean = (CafeBean)cafeList.elementAt(i);
									String cafeName = cafeBean.getCafe_name();
							%>
									<option value="<%=cafeName%>"><%=cafeName%></option>
							<%
								}
							%>
							</select>
						</div>

						<!-- 지점 -->
						<div class="selectbox">
							<select name="cafe_branch">
							<%
								for(int i=0; i<branchSize; i++) {
									cafeBean = (CafeBean)branchList.elementAt(i);
									String branchName = cafeBean.getCafe_branch();
							%>
									<option value="<%=branchName%>"><%=branchName%></option>
							<%
								}
							%>
							</select>
						</div>
					</center>
					</div>

					<div class="control-group">
						<!-- 비밀번호 -->
						<input type="password" name="password" placeholder="Password" />
					</div>

					<div class="control-group">
						<!-- 확인 버튼 -->
						<input type="button" title="T.noorim - 페이지 이동" value="Login" onClick="loginCheck()" class="btn btn-primary btn-large btn-block" />
					</div>
				</form>
			</div>
		</div>
	</body>
</html>