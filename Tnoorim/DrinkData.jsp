<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="tnoorim.*, java.util.*" %>

<%
	request.setCharacterEncoding("EUC-KR");
%>

<jsp:useBean id="visitorBean" class="tnoorim.VisitorBean" />
<jsp:useBean id="visitorMgr" class="tnoorim.VisitorMgr" />

<%
	String cafe_name = (String)session.getAttribute("nameKey");
	String cafe_branch = (String)session.getAttribute("branchKey");
%>

<%
	String visitorPhone = request.getParameter("visitorPhone");

	Vector visitorList;
	int visitorSize;

	visitorList = visitorMgr.visitorDrink(cafe_name, cafe_branch, visitorPhone);
	visitorSize = visitorList.size();
%>

<%
	StringBuilder sb = new StringBuilder();

	sb.append("[['MENU', 'COUNT'], ");

	if(visitorSize > 0) {
		for(int i=0; i<visitorSize; i=i+2) {
			if((visitorSize-2) == i) {
				sb.append("['" + visitorList.elementAt(i) + "', " + visitorList.elementAt(i+1) + "]");
			} else {
				sb.append("['" + visitorList.elementAt(i) + "', " + visitorList.elementAt(i+1) + "], ");
			}
		}
	}

	sb.append("]");
%>

<%=sb.toString()%>