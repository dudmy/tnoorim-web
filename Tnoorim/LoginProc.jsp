<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="tnoorim.*, java.util.*" %>

<%
	request.setCharacterEncoding("EUC-KR");
%>

<jsp:useBean id="cafeMgr" class="tnoorim.CafeMgr" />

<%
	String cafe_name = request.getParameter("cafe_name");
	String cafe_branch = request.getParameter("cafe_branch");
	String password = request.getParameter("password");
%>

<%
	boolean loginCheck = cafeMgr.loginCheck(cafe_name, cafe_branch, password);

	if(loginCheck) {
		session.setAttribute("nameKey", cafe_name);
		session.setAttribute("branchKey", cafe_branch);
		session.setAttribute("pwKey", password);

		response.sendRedirect("Tnoorim.jsp");
	} else {
		session.setAttribute("nameKey", cafe_name);
		session.setAttribute("branchKey", cafe_branch);

		response.sendRedirect("Login.jsp");
	}
%>