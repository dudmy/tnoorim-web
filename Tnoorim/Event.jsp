<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="tnoorim.*, java.util.*" %>

<%
	request.setCharacterEncoding("EUC-KR");
%>

<jsp:useBean id="menuBean" class="tnoorim.MenuBean" />
<jsp:useBean id="menuMgr" class="tnoorim.MenuMgr" />

<%
	String cafe_name = (String)session.getAttribute("nameKey");
%>

<%
	Vector menuList;
	int menuSize;

	menuList = menuMgr.getMenuList(cafe_name);
	menuSize = menuList.size();
%>

<html>
	<head>
		<title>T.noorim (카페를 누리다)</title>
		<link href="image/favicon.png" rel="icon" type="image/x-icon" />
		<script language="JavaScript" src="javascript/JavaScript.js"></script>
		<link type="text/css" rel="stylesheet" href="css/Css.css">

		<!-- 달력 -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="ui/jquery.mobile-1.2.0.min.css">
		<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
		<script language="JavaScript" type="text/JavaScript">
			$(document).ready(function() {
				var clareCalendar = {
					monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
					dayNamesMin: ['일','월','화','수','목','금','토'],
					weekHeader: 'Wk',
					dateFormat: 'yy.mm.dd',			// 형식 (2015.06.05)
					autoSize: false,			// 오토리사이즈 (body 등 상위 태그의 설정에 따름)
					changeMonth: true,			// 월 변경 가능
					changeYear: true,			// 년 변경 가능
					showMonthAfterYear: true,		// 년 뒤에 월 표시
					buttonImageOnly: true,			// 이미지 표시
					buttonText: '날짜선택',			// 버튼 텍스트 표시
					buttonImage: 'image/Calender.png',	// 이미지 주소
					showOn: "both",				// 엘리먼트와 이미지 동시 사용(both, button)
					yearRange: '1995:2025'			// 1995년부터 2025년까지
				};

				$("#fromDt").datepicker(clareCalendar);
				$("#toDt").datepicker(clareCalendar);
				$("img.ui-datepicker-trigger").attr("style", "margin-left: 10px; vertical-align: middle; cursor: pointer; width: 28px;"); // 이미지 버튼 style 적용
				$("#ui-datepicker-div").hide(); // 자동으로 생성되는 div 객체 숨김
			});
		</script>

		<style>
			.login-form {
				text-align: center;
			}

			.selectbox {
				border-radius: 3px;
				padding: 10px;
				width: 270px;
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

			input, textarea {
				text-align: center;
				background-color: #ffffff;
				border: 2px solid transparent;
				border-radius: 3px;
				font-size: 16px;
				padding: 10px;
				width: 290px;
				transition: border .5s;
			}

			input:focus, textarea:focus {
				border: 2px solid #a92020;
				box-shadow: none;
			}

			.input {
				text-align: center;
				background-color: #ffffff;
				border: 2px solid transparent;
				border-radius: 3px;
				font-size: 16px;
				padding: 10px;
				width: 250px;
				transition: border .5s;
			}

			.input:focus {
				border: 2px solid #a92020;
				box-shadow: none;
			}

			.smGlobalBtn2 {
				border: 2px solid transparent;
				background: #a92020;
				line-height: 25px;
				padding: 10px;
				border-radius: 3px;
				transition: 0.25s;
				display: block;
				width: 150px;
				margin: 0 auto;
				box-shadow: 0 3px 3px #999999;
			}

			.btn2:hover {
				background-color: #7f1818;
			}
		</style>
	</head>

	<body bgcolor="#fff0f0">
		<center>

		<br /><br />
		<table border="0" width="60%">
			<tr>
				<td align="center"><h2>RERISTER EVENTS</h2></td>
			</tr>
		</table>
			<table width="300">
			<div class="login-form">
				<form name="event" method="post" action="EventOk.jsp">
					<tr>
						<td align="center">
						<table align="center" width="100%">
							<tr>
								<td>Name</td>
							</tr>
							<tr>
								<td><input type="text" name="event_name"></td>
							</tr>
							<tr>
								<td>Comment</td>
							</tr>
							<tr>
								<td><textarea name="event_info" rows="4" cols="30" style="resize: none;"></textarea></td>
							</tr>
							<tr>
								<td>Menu</td>
							</tr>
							<tr>
								<td>
									<div class="selectbox">
										<select name="menu_name">
										<%
											for(int i=0; i<menuSize; i++) {
												menuBean = (MenuBean)menuList.elementAt(i);
												String menuName = menuBean.getMenu_name();
										%>
												<option value="<%=menuName%>"><%=menuName%></option>
										<%
											}
										%>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td>Price</td>
							</tr>
							<tr>
								<td><input type="number" name="price" min="0" step="100" value="2500"></td>
							</tr>
							<tr>
								<td>Date</td>
							</tr>
							<tr>
								<td>
									<input class="input" name="startday" type="text" id="fromDt" size="8" maxlength="8" placeholder="start date">
									<input class="input" name="endday" type="text" id="toDt" size="8" maxlength="8" placeholder="end date">
								</td>
							</tr>
						</table>
						</td>
					</tr>
				</form>
			</div>
			</table>

		<br /><br />

		<table border="0" width="60%">
			<tr>
				<td align="center"><a href="#" title="등록" onClick="eventCheck()" class="btn2 smGlobalBtn2"><font color="#ffffff"><strong>RERISTER</strong></font></a></td>
			</tr>
		</table>

		</center>
	</body>
</html>