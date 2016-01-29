<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="tnoorim.*, java.util.*" %>

<%
	request.setCharacterEncoding("EUC-KR");
%>

<jsp:useBean id="eventBean" class="tnoorim.EventBean" />
<jsp:useBean id="eventMgr" class="tnoorim.EventMgr" />
<jsp:setProperty name="eventBean" property="*" />

<%
	String cafe_name = (String)session.getAttribute("nameKey");
%>

<%
	boolean flag = eventMgr.eventInsert(eventBean, cafe_name);

	if(flag) {
%>
	<script>
		alert("이벤트 등록에 성공하였습니다.");

		parent.opener.location.reload();

		self.close();
	</script>
<%
	}
%>