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
	String buyId = new String();
	String buyPhone = new String();
	String buyMenu = new String();
	String buyDate = new String();
	String buyOption = new String();

	Vector buyList;
	int buySize;

	buyList = buyMgr.getBuyList();
	buySize = buyList.size();

	int toggle = 0;
	boolean onoff = false;
%>

<table width="60%" class="one">
	<tr>
		<th width="20%" class="th">PHONE</th>
		<th width="20%" class="th">DATE</th>
		<th width="35%" class="th">MENU</th>
		<th width="10%" class="th">OPTION</th>
		<th width="10%" class="th"> </th>
	</tr>
	<%
		for(int i=0; i<buySize; i++) {
			buyBean = (BuyBean)buyList.elementAt(i);
			if(cafe_name.equals(buyBean.getCafe_name()) && cafe_branch.equals(buyBean.getCafe_branch())) {

				toggle++;
				onoff = true;

				buyId = String.valueOf(buyBean.getBuy_id());
				buyPhone = buyBean.getPhone();
				buyMenu = buyBean.getMenu_name();
				buyDate = buyBean.getDate();
				buyOption = buyBean.getBuy_option();

				if(toggle%2 == 1) {
	%>
					<tr>
						<td align="center" height="40"><%=buyPhone%></td>
						<td align="center" height="40"><%=buyDate%></td>
						<td align="center" height="40"><%=buyMenu%></td>
						<%
							if(buyOption.equals("Regular")) {
						%>
								<td align="center" height="40">R</td>
						<%
							} else {
						%>
								<td align="center" height="40">L</td>
						<%
							}
						%>
						<!-- 팝업창 디자인, 팝업창 위치 -->
						<td width="10%" align="center" height="40">
							<a href="#" title="제작완료" onClick="window.open('OrderProc.jsp?buyId=<%=buyId%>&&buyDate=<%=buyDate%>&&buyPhone=<%=buyPhone%>', 'new', 'resizable=no width=300 height=240'); return false" class="btn smGlobalBtn"></a>
						</td>
					</tr>
	<%
				} else {
	%>
					<tr class="odd">
						<td align="center" height="40"><%=buyPhone%></td>
						<td align="center" height="40"><%=buyDate%></td>
						<td align="center" height="40"><%=buyMenu%></td>
						<%
							if(buyOption.equals("Regular")) {
						%>
								<td align="center" height="40">R</td>
						<%
							} else {
						%>
								<td align="center" height="40">L</td>
						<%
							}
						%>
						<!-- 팝업창 디자인, 팝업창 위치 -->
						<td width="10%" align="center" height="40">
							<a href="#" title="제작완료" onClick="window.open('OrderProc.jsp?buyId=<%=buyId%>&&buyDate=<%=buyDate%>&&buyPhone=<%=buyPhone%>', 'new', 'resizable=no width=300 height=240'); return false" class="btn smGlobalBtn"></a>
						</td>
					</tr>
	<%
				}
			} 
		}

		if(!onoff) {
	%>
		<tr>
			<td align="center" colspan="5" height="40">주문 내역이 없습니다.</td>
		</tr>
	<%
			onoff = false;
		}
	%>
</table>