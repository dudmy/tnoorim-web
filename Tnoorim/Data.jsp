<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="tnoorim.*, java.util.*" %>

<%
	request.setCharacterEncoding("EUC-KR");
%>

<jsp:useBean id="buyBean" class="tnoorim.BuyBean" />
<jsp:useBean id="buyMgr" class="tnoorim.BuyMgr" />

<%
	String cafe_name = (String)session.getAttribute("nameKey");
	String cafe_branch = (String)session.getAttribute("branchKey");
%>

<%
	Vector drinkList, priceList;
	int drinkSize, priceSize;

	drinkList = buyMgr.bestDrink(cafe_name, cafe_branch);
	drinkSize = drinkList.size();
	priceList = buyMgr.priceDrink(cafe_name, cafe_branch);
	priceSize = priceList.size();
%>

<%
	StringBuilder sb = new StringBuilder();

	sb.append("[['DATE', 'COUNT', 'PRICE (1,000)'], ");

	if(drinkSize > 0) {
		for(int i=0; i<drinkSize; i=i+2) {
			if((drinkSize-2) == i) {
				sb.append("['" + drinkList.elementAt(i) + "', " + drinkList.elementAt(i+1) + ", " + priceList.elementAt(i+1) + "]");
			} else {
				sb.append("['" + drinkList.elementAt(i) + "', " + drinkList.elementAt(i+1) + ", " + priceList.elementAt(i+1) + "], ");
			}
		}
	}

	sb.append("]");
%>

<%=sb.toString()%>