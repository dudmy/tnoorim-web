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
	String visitorPhone = new String();
	String visitorAddress = new String();

	Vector visitorList;
	int visitorSize;

	visitorList = visitorMgr.getVisitorList(cafe_name);
	visitorSize = visitorList.size();
%>

<%
	for(int i=0; i<visitorSize; i++) {
		visitorBean = (VisitorBean)visitorList.elementAt(i);

		visitorPhone = visitorBean.getPhone();
		visitorAddress = visitorBean.getBd_address();
%>
		<a href="#" title="러버확인" onClick="window.open('DrinkChart.jsp?visitorPhone=<%=visitorPhone%>', 'new', 'resizable=no width=500 height=401'); return false"><%=visitorPhone%></a>
<%
	}
%>